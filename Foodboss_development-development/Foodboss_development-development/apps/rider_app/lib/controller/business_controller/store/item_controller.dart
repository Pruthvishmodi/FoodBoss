import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rider_app/models/store/items.dart';

import '../../../infrastructure/store_service.dart';
import '../../../utils/states.dart';

class ItemController extends GetxController {
  ScrollController controllerScroll = ScrollController();
  var _state = States.INITIAL_STATE.obs;
  var items = ItemModel().data.obs;
  List<ListItemData>? get itemList => items.value?.data!;
  String get status => _state.value;

  getItems(int id, bool fromCat) async {
    try {
      _state.value = States.LOADING_STATE;
      ItemModel? data = await StoreService.fetchItems(id, fromCat);
      print(fromCat);
      if (data == null) {
        Get.snackbar("Opps", "Something went wrong");
        _state.value = States.ERROR_STATE;
      } else {
        if (data.success == false) {
          Get.snackbar("Opps", "Something went wrong");
          _state.value = States.ERROR_STATE;
        } else {
          items.value = data.data;
          _state.value = States.SUCCESS_STATE;
          // Get.toNamed("/product-list-screen");
        }
      }
    } catch (e) {
      Get.snackbar("Opps", "Something went wrong server");
      _state.value = States.ERROR_STATE;
    }
  }

  addItems() {
    print("object scrolled");
    controllerScroll.addListener(() async {
      print("object scrolled 02");
      if (controllerScroll.position.maxScrollExtent ==
          controllerScroll.position.pixels) {
        if (items.value!.to != null) {
          if (items.value!.to! < items.value!.total!) {
            await getItemsByPage(items.value!.nextPageUrl!);
          }
        }
      }
    });
  }

  getItemsByPage(String url) async {
    _state.value = States.LOADING_STATE;
    try {
      ItemModel? data = await StoreService.fetchItemsByPage(url);
      print(data);
      if (data == null) {
        _state.value = States.ERROR_STATE;
        Get.snackbar("Opps", "Something went wrong");
      } else {
        if (data.success == false) {
          _state.value = States.ERROR_STATE;
          Get.snackbar("Opps", "Something went wrong");
        } else {
          items.value!.currentPage = data.data!.currentPage;
          items.value!.lastPage = data.data!.lastPage;
          items.value!.prevPageUrl = data.data!.prevPageUrl;
          items.value!.lastPageUrl = data.data!.lastPageUrl;
          items.value!.nextPageUrl = data.data!.nextPageUrl;
          items.value!.firstPageUrl = data.data!.firstPageUrl;
          items.value!.from = data.data!.from;
          items.value!.to = data.data!.to;
          items.value!.total = data.data!.total;
          items.value!.path = data.data!.path;
          items.value!.perPage = data.data!.perPage;
          items.value!.data!.addAll(data.data!.data!);
          _state.value = States.SUCCESS_STATE;
          items.refresh();
          // Get.toNamed("/product-list-screen");
          itemList!.forEach((element) {
            print(element.name);
          });
        }
      }
    } catch (e) {
      _state.value = States.ERROR_STATE;
      print(e);
      Get.snackbar("Opps", "Something went wrong server");
    }
  }

  @override
  void onInit() {
    super.onInit();
    int id = Get.arguments['id'];
    bool fromCat = Get.arguments['fromCat'];
    print(id);
    print(fromCat);
    getItems(id, fromCat);
    addItems();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
