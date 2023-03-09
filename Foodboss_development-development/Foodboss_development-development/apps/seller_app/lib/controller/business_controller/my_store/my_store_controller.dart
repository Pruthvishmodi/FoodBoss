import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:seller_app/infrastructure/my_store/get_cat.dart';
import 'package:seller_app/models/store/my_food_detail_model.dart';
import 'package:seller_app/models/store/mystore_cat.dart';
import 'package:seller_app/models/store/mystore_item.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';

class MyStoreController extends GetxController {
  RxList<ListCatMyStoreData> catgories = RxList<ListCatMyStoreData>();
  Rx<MyStoreItems> items = MyStoreItems().obs;
  var loading = false.obs;
  var error = false.obs;
  var length = 1.obs;
  RxMap<int, MyStoreItems> catItems = RxMap<int, MyStoreItems>();
  RxMap<int, ScrollController> controllerScroll =
      RxMap<int, ScrollController>();

  quickUpdateController(BuildContext context, MyStoreItemDetails item) async {
    // updateLoading.value = true;
    log(item.toString());
    try {
      bool res = await MyStoreServices.updateFood(item);
      // print(res);
      if (res) {
        catItems[item.data!.mainCategoryId!]!
            .data![catItems[item.data!.mainCategoryId!]!
                .data!
                .indexWhere((element) => element.id == item.data!.id!)]
            .discountPrice = item.data!.foodsUsers!.discountPrice!;
        catItems[item.data!.mainCategoryId!]!
            .data![catItems[item.data!.mainCategoryId!]!
                .data!
                .indexWhere((element) => element.id == item.data!.id!)]
            .quantity = item.data!.foodsUsers!.quantity!;
        catItems.refresh();
        CustomSnackbar.showDefaultSuccessSnackbarStatic(context);
      } else {
        // print('here');
        CustomSnackbar.showDefaultErrorSnackbarStatic(context);
      }
      // updateLoading.value = false;
    } catch (e) {
      // updateLoading.value = false;
      // print('there');
      CustomSnackbar.showDefaultErrorSnackbarStatic(context);
      print(e);
    }
  }

  getCatCotroller() async {
    loading.value = true;
    try {
      MyStoreCat? data = await MyStoreServices.getCatagories();
      if (data == null) {
        if (error.value == false) {
          error.value = true;
        }
        CustomSnackbar.errorSnackbar();
      } else {
        if (data.success == false) {
          if (error.value == false) {
            error.value = true;
          }
          CustomSnackbar.errorSnackbar();
        } else {
          catgories.value = data.data!;
          await getItemsByCatagories();
          if (catgories.value.length > 0) {
            catgories.forEach((value) {
              controllerScroll.value[value.mainCategoryId!] =
                  ScrollController();
              addItems(value.mainCategoryId!);
            });
          }
          loading.value = false;
          catgories.refresh();
          print("catItems[24]!.length");
          if (catgories.value.length <= 0) {
            error.value = true;
          } else {
            error.value = false;
          }
        }
      }
    } catch (e) {
      loading.value = false;
      if (error.value == false) {
        error.value = true;
      }
      print("error thrown here");
      print(e);
      // Get.snackbar("Oppps", "Something went wrong cat");
    }
  }

  getItemController(int id) async {
    try {
      MyStoreItems? data = await MyStoreServices.getMyStoreItems(id);
      if (data == null) {
        if (error.value == false) {
          error.value = true;
        }
      } else {
        if (data.success == false) {
          if (error.value == false) {
            error.value = true;
          }
        } else {
          items.value = data;
          catItems.value[id.toInt()] = items.value;
          error.value = false;
        }
      }
    } catch (e) {
      if (error.value == false) {
        error.value = true;
      }
      print("error thrown here in items");
      print(e);
    }
  }

  searchItemController(int id, String name) async {
    try {
      MyStoreItems? data =
          await MyStoreServices.searchItemsByCat(id.toString(), name);
      if (data == null) {
        if (error.value == false) {
          error.value = true;
        }
      } else {
        if (data.success == false) {
          if (error.value == false) {
            error.value = true;
          }
        } else {
          items.value = data;
          catItems.value[id.toInt()] = items.value;
          catItems.refresh();
          error.value = false;
        }
      }
    } catch (e) {
      if (error.value == false) {
        error.value = true;
      }
      print("error thrown here in items");
      print(e);
    }
  }

  getItemsByPage(String url, int catId) async {
    print(url);
    try {
      MyStoreItems? data = await MyStoreServices.fetchItemsByPage(url);
      if (data == null) {
      } else {
        if (data.success == false) {
        } else {
          // catItems.value[catId]!.currentPage = data.data!.currentPage;
          // catItems.value[catId]!.lastPage = data.data!.lastPage;
          // catItems.value[catId]!.prevPageUrl = data.data!.prevPageUrl;
          // catItems.value[catId]!.lastPageUrl = data.data!.lastPageUrl;
          catItems.value[catId]!.nextPageUrl = data.nextPageUrl;
          // catItems.value[catId]!.firstPageUrl = data.data!.firstPageUrl;
          // catItems.value[catId]!.from = data.data!.from;
          // catItems.value[catId]!.to = data.data!.to;
          // catItems.value[catId]!.total = data.data!.total;
          // catItems.value[catId]!.perPage = data.data!.perPage;
          catItems.value[catId]!.data!.addAll(data.data!);
          catItems.refresh();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  addItems(int catId) {
    print("called");
    controllerScroll.value[catId]!.addListener(() async {
      if (controllerScroll.value[catId]!.position.maxScrollExtent ==
          controllerScroll.value[catId]!.position.pixels) {
        if (catItems.value[catId]!.nextPageUrl != null) {
          //   print(catItems.value[catId]!.to);
          //   print(catItems.value[catId]!.total);
          //   if (catItems.value[catId]!.to! < catItems.value[catId]!.total!) {
          await getItemsByPage(catItems.value[catId]!.nextPageUrl!, catId);
          //   }
        }
      }
    });
  }

  getItemsByCatagories() async {
    try {
      for (ListCatMyStoreData item in catgories.value) {
        await getItemController(item.mainCategoryId!);
      }
    } catch (e) {
      if (error.value == false) {
        error.value = true;
      }
      Get.snackbar("error", e.toString());
    }
  }

  storeUpdateController(int id, int catId) async {
    print("called");
    try {
      int index = catItems.value[catId]!.data!
          .indexWhere((element) => element.id == id);
      ItemMyStoreData request = catItems.value[catId]!.data![index];

      // bool res = await MyStoreServices.updateFood(request);
      // print(res);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    // getCatCotroller();
    super.onInit();
  }

  @override
  void dispose() {
    controllerScroll.value.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
  }
}
