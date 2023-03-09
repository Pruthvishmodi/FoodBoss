import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rider_app/infrastructure/store_service.dart';
import 'package:rider_app/models/store/catagories.dart';
import 'package:rider_app/models/store/items.dart';

class StoreController extends GetxController {
  ScrollController controller = ScrollController();
  var mainCatagories = MainCatModel().data.obs;
  var subCatagories = SubCatModel().data.obs;
  var catagories = Catagory().data.obs;
  var items = ItemModel().data.obs;

  List<ListData>? get mainCategoryList => mainCatagories.value?.data!;
  List<SubCatSubData>? get subCategoryList => subCatagories.value?.data!;
  List<ListCatData>? get categoryList => catagories.value?.data!;
  List<ListItemData>? get itemList => items.value?.data!;

  getMainCatagories() async {
    try {
      MainCatModel? data = await StoreService.fetchMainCat();
      print(data);
      if (data == null) {
        Get.snackbar("Opps", "Something went wrong");
      } else {
        if (data.success == false) {
          Get.snackbar("Opps", data.message!);
        } else {
          // #Todo logic
          mainCatagories.value = data.data;
        }
      }
    } catch (e) {
      Get.snackbar("Oppps", "Something went wrong");
    }
  }

  getSubCatagories(int id) async {
    try {
      SubCatModel? data = await StoreService.fetchSubCat(id);
      // print(data!.data!.data![0].name!);
      if (data == null) {
        Get.snackbar("Opps", "Something went wrong");
      } else {
        if (data.success == false) {
          Get.snackbar("Opps", 'Something went wrong');
        } else {
          // #Todo logic
          subCatagories.value = data.data;
        }
      }
    } catch (e) {
      Get.snackbar("Opps", "Something went wrong by cat");
    }
  }

  getCatagories(int id) async {
    try {
      Catagory? data = await StoreService.fetchCat(id);
      if (data == null) {
        Get.snackbar("Opps", "Something went wrong");
      } else {
        if (data.success == false) {
          Get.snackbar("Opps", "something went wrong by server");
        } else {
          // #Todo logic
          catagories.value = data.data;
        }
      }
    } catch (e) {
      Get.snackbar("Opps", "Something went wrong");
    }
  }

  getItems(int id, bool fromCat) async {
    try {
      ItemModel? data = await StoreService.fetchItems(id, fromCat);
      print(fromCat);
      if (data == null) {
        Get.snackbar("Opps", "Something went wrong");
      } else {
        if (data.success == false) {
          Get.snackbar("Opps", "Something went wrong");
        } else {
          items.value = data.data;
          Get.toNamed("/product-list-screen");
        }
      }
    } catch (e) {
      Get.snackbar("Opps", "Something went wrong server");
    }
  }

  addItems() async {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (items.value!.to! < items.value!.total!) {
          getItemsByPage(items.value!.nextPageUrl!);
        }
      }
    });
  }

  getItemsByPage(String url) async {
    try {
      ItemModel? data = await StoreService.fetchItemsByPage(url);
      // print(fromCat);
      if (data == null) {
        Get.snackbar("Opps", "Something went wrong");
      } else {
        if (data.success == false) {
          Get.snackbar("Opps", "Something went wrong");
        } else {
          items.value!.currentPage = data.data!.currentPage!;
          items.value!.lastPage = data.data!.lastPage!;
          items.value!.prevPageUrl = data.data!.prevPageUrl!;
          items.value!.lastPageUrl = data.data!.lastPageUrl!;
          items.value!.nextPageUrl = data.data!.nextPageUrl!;
          items.value!.firstPageUrl = data.data!.firstPageUrl!;
          items.value!.from = data.data!.from!;
          items.value!.to = data.data!.to!;
          items.value!.total = data.data!.total!;
          items.value!.path = data.data!.path!;
          items.value!.perPage = data.data!.perPage!;
          items.value!.data!.addAll(data.data!.data!);
          Get.toNamed("/product-list-screen");
        }
      }
    } catch (e) {
      Get.snackbar("Opps", "Something went wrong server");
    }
  }

  @override
  void onInit() {
    getMainCatagories();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
