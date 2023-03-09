import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:seller_app/infrastructure/auth_call.dart';
import 'package:seller_app/infrastructure/store_service.dart';
import 'package:seller_app/models/store/items.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';

class ItemController extends GetxController {
  ScrollController controllerScroll = ScrollController();
  var _state = States.INITIAL_STATE.obs;
  var items = ItemModel().data.obs;
  RxList<ListItemData> selectedItems = RxList<ListItemData>();
  // RxMap<int,>
  List<ListItemData>? get itemList => items.value?.data!;
  List<ListItemData> get selectedItemList {
    // makeControllers();
    // print('controller created');
    return selectedItems.value;
  }

  String get status => _state.value;
  var _productAddingStatus = States.INITIAL_STATE.obs;

  RxList<int> _selectedItemIndex = RxList();

  RxList<ListItemData> _selectedData = RxList();

  List get selectedIndexs => _selectedItemIndex.value;
  List<ListItemData> get selectedData => _selectedData.value;

  getItems(int id, bool fromCat) async {
    try {
      _state.value = States.LOADING_STATE;
      ItemModel? data = await StoreService.fetchItems(id, fromCat);
      print(fromCat);
      if (data == null) {
        CustomSnackbar.errorSnackbar();
        _state.value = States.ERROR_STATE;
      } else {
        if (data.success == false) {
          CustomSnackbar.errorSnackbar();
          _state.value = States.ERROR_STATE;
        } else {
          items.value = data.data;
          _state.value = States.SUCCESS_STATE;
          // Get.toNamed("/product-list-screen");
        }
      }
    } catch (e) {
      CustomSnackbar.errorSnackbar();
      _state.value = States.ERROR_STATE;
    }
  }

  getSearchItems(String name) async {
    try {
      _state.value = States.LOADING_STATE;
      ItemModel? data = await StoreService.fetchItemsBySearch(name);
      // print(fromSearch);
      if (data == null) {
        CustomSnackbar.errorSnackbar();
        _state.value = States.ERROR_STATE;
      } else {
        if (data.success == false) {
          CustomSnackbar.errorSnackbar();
          _state.value = States.ERROR_STATE;
        } else {
          items.value = data.data;
          _state.value = States.SUCCESS_STATE;
          // Get.toNamed("/product-list-screen");
        }
      }
    } catch (e) {
      CustomSnackbar.errorSnackbar();
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

  selectItem(int id) {
    if (items.value!.data!
        .singleWhere((element) => element.id == id)
        .isSelected!) {
      items.value!.data!.singleWhere((element) => element.id == id).isSelected =
          false;
      // print(items.value!.data!
      //     .singleWhere((element) => element.id == id)
      //     .isSelected!);
    } else {
      items.value!.data!.singleWhere((element) => element.id == id).isSelected =
          true;
      // print(items.value!.data!
      //     .singleWhere((element) => element.id == id)
      //     .isSelected!);
    }
    items.refresh();
  }

  setItemsFiltered() {
    print("called");
    selectedItems.value = [];
    selectedItems.value.addAll(
        items.value!.data!.where((element) => element.isSelected == true));
    print(selectedItems.value);
  }

  getItemsByPage(String url) async {
    // _state.value = States.LOADING_STATE;
    try {
      ItemModel? data = await StoreService.fetchItemsByPage(url);
      print(data);
      if (data == null) {
        _state.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar();
      } else {
        if (data.success == false) {
          _state.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
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
          // itemList!.forEach((element) {
          //   print(element.name);
          // });
        }
      }
    } catch (e) {
      _state.value = States.ERROR_STATE;
      print(e);
      CustomSnackbar.errorSnackbar();
    }
  }

  // var textControllerMap = Map<int,TextEditingController>().obs;

  // makeControllers(){
  //   _selectedItems.forEach((element) {
  //     textControllerMap[element.id!] = TextEditingController();

  //   });
  // }

  // changeProductPrice(val, id){
  //  _selectedItems.value[_selectedItems.value.indexWhere((element) => element.id = id)].price =val;
  //  _selectedItems.refresh();
  // }

  // changeProductQuantity(val, id){
  //  _selectedItems.value[_selectedItems.value.indexWhere((element) => element.id = id)].packageItemsCount = val;
  //  _selectedItems.refresh();

  // }

  addIndex(int index) {
    if (_selectedItemIndex.contains(index)) {
      _selectedItemIndex.remove(index);
    } else {
      _selectedItemIndex.add(index);
    }
  }

  addProductsToMyStore(BuildContext context) async {
    _productAddingStatus.value = States.LOADING_STATE;
    // var
    // var itemListAdd = [];
    // _selectedItemIndex.value.forEach((e) {
    //   itemListAdd.add();
    // });

    try {
      var isValid = true;
      // _selectedItems.value.forEach((element) {
      //   element.discountPrice = int.parse(element.controllerPrice!.value.text);
      //   element.quantity = int.parse(element.controllerStock!.value.text);
      //   if (element.isRemoveMrp == false) {
      //     if (int.parse(element.controllerPrice!.value.text) > element.price!) {
      //       CustomSnackbar.errorSnackbar2('Price cannot be greater than MRP');
      //       isValid = false;
      //     }
      //   }
      // });
      if (isValid) {
        selectedItemList.forEach((element) {
          log(element.price.toString());
        });
        bool response = await StoreService.appProducts(
            SelectedItems(litsOfItems: selectedItemList));
        var step = await AuthCall.getSteps();
        print(response);
        if (response) {
          // print(response);
          // Get.back();
          items.value!.data = items.value!.data!.map((element) {
            element.isSelected = false;
            return element;
          }).toList();
          items.refresh();
          Get.back();
          CustomSnackbar.SucessSnackbar('Products added successfully');
          // if (step == 2) {
          //   await AuthCall.setSteps(3);
          // }
          // _productAddingStatus.value = States.SUCCESS_STATE;
        } else {
          _productAddingStatus.value = States.ERROR_STATE;
          CustomSnackbar.showDefaultErrorSnackbarStatic(context);
        }
      }
    } catch (e) {
      print(e);
      _productAddingStatus.value = States.ERROR_STATE;
      CustomSnackbar.showDefaultErrorSnackbarStatic(context);
    }
  }

  bool checkIndex(int id) {
    if (items.value!.data!
            .singleWhere((element) => element.id == id)
            .isSelected ==
        true) {
      return true;
    } else {
      return false;
    }
    // return false;
    // return items.value!.data!
    //     .singleWhere((element) => element.id == id)
    //     .isSelected!;
  }

  @override
  void onInit() {
    super.onInit();
    int id = Get.arguments['id'];
    bool fromCat = Get.arguments['fromCat'];
    bool fromSearch = Get.arguments['fromSearch'];

    print(id);
    print(fromCat);
    fromSearch == true ? null : getItems(id, fromCat);
    addItems();
  }

  @override
  void dispose() {
    controllerScroll.dispose();
    super.dispose();
  }
}
