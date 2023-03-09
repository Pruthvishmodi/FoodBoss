import 'dart:developer';

import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/category_page_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/store_product_ui_controller.dart';
import 'package:customer_app/Models/network_call_models.dart/catwise_product_call.dart';
import 'package:customer_app/Models/network_call_models.dart/get_store_cat_call.dart';
import 'package:customer_app/Models/network_call_models.dart/store_detail_call.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Models/shop_model.dart';
import 'package:customer_app/Services/khata_services.dart';
import 'package:customer_app/Services/store_services.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StoreProductController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    addItems();
    super.onInit();
  }

  var store = ShopModel().obs;
  var catidctrl = 0.obs;
  var storeididctrl = 0.obs;
  var ctrlScroll = ScrollController();
  CategoryPageController categoryPageController =
      Get.put(CategoryPageController());

  CartController cartController = Get.find<CartController>();
  StoreProductUiController storeProductUiController =
      Get.put(StoreProductUiController());

  setStore(ShopModel shop, int catId) async {
    store.value = shop;
    await getStoreCategories(store.value.id!);
    // await checkKhataRequest(store.value.id!);
    storeProductUiController.changeIndex(
        store.value.categories!.indexWhere((element) => element.id == catId));
    getCatProducts(store.value.id!, catId);
  }

  setStoreForRouter(int id) async {
    store.value = await getShopModel(id);
    print(store.value.id.toString());
    storeProductUiController.fragIndex.value = 0;
    await getStoreCategories(store.value.id!);
    await getCatProducts(store.value.id!, store.value.categories!.first.id!);
  }

  setStoreWithoutCat(ShopModel shopModel) async {
    store.value = shopModel;
    print(store.value.id!);
    storeProductUiController.fragIndex.value = 0;
    await getStoreCategories(store.value.id!);
    await getCatProducts(store.value.id!, store.value.categories!.first.id!);
  }

  // filterProducts(String val) {
  //   store.value.categories![storeProductUiController.fragIndex.value]
  //           .filteredProducts =
  //       store.value.categories![storeProductUiController.fragIndex.value]
  //           .Products!
  //           .where((element) => element.name!.toLowerCase().contains(val))
  //           .toList();
  //   print(store
  //       .value.categories![storeProductUiController.fragIndex.value].Products!
  //       .where((element) => element.name!.toLowerCase().contains(val))
  //       .toList()
  //       .map((element) {
  //     print(element.name);
  //   }));
  //   store.refresh();
  // }

  filterProducts(int storeid, String val) async {
    var call = await StoreServices.searchProductFromStore(storeid, val);
    print(call);
    if (call != null) {
      List<Product> data = CatwiseProductCall.fromJson(call, q: 0).data != null
          ? CatwiseProductCall.fromJson(call, q: 0).data!
          : <Product>[];
      store.value.categories![storeProductUiController.fragIndex.value]
          .nextPageUrl = CatwiseProductCall.fromJson(call).nextPageUrl;
      if (data.isNotEmpty &&
          cartController.getCart.value.store != null &&
          cartController.getCart.value.store!.isNotEmpty) {
        if (cartController.getCart.value.store!
                .indexWhere((element) => element.id == storeid) !=
            -1) {
          if (cartController
                      .getCart
                      .value
                      .store![cartController.getCart.value.store!
                          .indexWhere((element) => element.id == storeid)]
                      .items !=
                  null &&
              cartController
                  .getCart
                  .value
                  .store![cartController.getCart.value.store!
                      .indexWhere((element) => element.id == storeid)]
                  .items!
                  .isNotEmpty) {
            for (var element in data) {
              for (var e in cartController
                  .getCart
                  .value
                  .store![cartController.getCart.value.store!
                      .indexWhere((element) => element.id == storeid)]
                  .items!) {
                if (e.name == element.name) {
                  element.quantity = e.quantity;
                  element.deleteCartId = e.id;
                  log(e.food_variant_id!.toString());
                  if (e.food_variant_id != 0) {
                    element.selectedVaritent = element.variants!
                        .indexWhere((x) => x.id == e.food_variant_id);
                  }
                } else {
                  element.quantity = 0;
                }
              }
            }
          }
        }
      }
      store.value.categories![storeProductUiController.fragIndex.value]
          .filteredProducts = [];
      store.value.categories![storeProductUiController.fragIndex.value]
          .filteredProducts = data;
    }
    // print(store
    //     .value.categories![storeProductUiController.fragIndex.value].Products!
    //     .where((element) => element.name!.toLowerCase().contains(val))
    //     .toList()
    //     .map((element) {
    //   print(element.name);
    // }));
    store.refresh();
  }

  getStoreCategories(int storeid) async {
    try {
      var call = await StoreServices.getStoreCategories(storeid);
      print(call);

      if (call != null) {
        store.value.categories = GetStoreCatCall.fromJson(call).data;
        print(store.value.categories.toString());
      } else {
        // Get.snackbar('Error', 'Something went wrong');
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print('here $e');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  // checkKhataRequest(int storeid) async {
  //   try {
  //     var call = await StoreServices.checkKhataRequest(storeid);
  //     print(call);

  //     if (call != null) {
  //       store.value.khataAvailable = call;
  //     } else {
  //       CustomSnackbar.errorSnackbar();
  //     }
  //   } catch (e) {
  //     print('here $e');
  //     CustomSnackbar.errorSnackbar2('Something went wrong');
  //   }
  // }

  getCatProducts(int storeid, int catId) async {
    storeididctrl.value = storeid;
    catidctrl.value = catId;
    try {
      var call = await StoreServices.getProductsCategoryWise(storeid, catId);
      print(call);
      if (call != null) {
        List<Product> data = CatwiseProductCall.fromJson(call).data != null
            ? CatwiseProductCall.fromJson(call).data!
            : <Product>[];
        store.value.categories!
            .firstWhere((element) => element.id == catId)
            .nextPageUrl = CatwiseProductCall.fromJson(call).nextPageUrl;

        if (data.isNotEmpty &&
            cartController.getCart.value.store != null &&
            cartController.getCart.value.store!.isNotEmpty) {
          if (cartController.getCart.value.store!
                  .indexWhere((element) => element.id == storeid) !=
              -1) {
            if (cartController
                        .getCart
                        .value
                        .store![cartController.getCart.value.store!
                            .indexWhere((element) => element.id == storeid)]
                        .items !=
                    null &&
                cartController
                    .getCart
                    .value
                    .store![cartController.getCart.value.store!
                        .indexWhere((element) => element.id == storeid)]
                    .items!
                    .isNotEmpty) {
              for (var element in data) {
                for (var e in cartController
                    .getCart
                    .value
                    .store![cartController.getCart.value.store!
                        .indexWhere((element) => element.id == storeid)]
                    .items!) {
                  if (e.name == element.name) {
                    element.quantity = e.quantity;
                    element.deleteCartId = e.id;
                    log(e.food_variant_id!.toString());
                    if (e.food_variant_id != 0) {
                      element.selectedVaritent = element.variants!
                          .indexWhere((x) => x.id == e.food_variant_id);
                    }
                  }
                }
              }
            }
          }
        }
        store.value.categories!
            .firstWhere((element) => element.id == catId)
            .Products = data;
        store.value.categories!
            .firstWhere((element) => element.id == catId)
            .filteredProducts = data;
        store.refresh();
        // addItems();
      } else {
        // Get.snackbar('Error', 'Something went wrong');
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print('there $e');
      // Get.snackbar('Error', 'Something went wrong');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  RxBool called = true.obs;
  addItems() {
    print("called");
    ctrlScroll.addListener(() async {
      if (ctrlScroll.position.maxScrollExtent == ctrlScroll.position.pixels) {
        print('hereeee');
        if (store.value.categories![storeProductUiController.fragIndex.value]
                .nextPageUrl !=
            null) {
          //   print(catItems.value[catId]!.to);
          //   print(catItems.value[catId]!.total);
          //   if (catItems.value[catId]!.to! < catItems.value[catId]!.total!) {
          if (called.value) {
            await getCatProductsPageWise();
          }
          //   }
        }
      }
    });
  }

  getCatProductsPageWise() async {
    try {
      called.value = false;
      String url = store.value
          .categories![storeProductUiController.fragIndex.value].nextPageUrl!;
      var call = await StoreServices.getProductsCategoryWisePagination(url);
      // print(call);

      if (call != null) {
        List<Product> data = CatwiseProductCall.fromJson(call).data != null
            ? CatwiseProductCall.fromJson(call).data!
            : <Product>[];
        print(CatwiseProductCall.fromJson(call).nextPageUrl);
        store.value.categories!
            .firstWhere((element) => element.id == catidctrl.value)
            .nextPageUrl = CatwiseProductCall.fromJson(call).nextPageUrl;
        if (data.isNotEmpty &&
            cartController.getCart.value.store != null &&
            cartController.getCart.value.store!.isNotEmpty) {
          if (cartController.getCart.value.store!
                  .indexWhere((element) => element.id == storeididctrl.value) !=
              -1) {
            if (cartController
                        .getCart
                        .value
                        .store![cartController.getCart.value.store!.indexWhere(
                            (element) => element.id == storeididctrl.value)]
                        .items !=
                    null &&
                cartController
                    .getCart
                    .value
                    .store![cartController.getCart.value.store!.indexWhere(
                        (element) => element.id == storeididctrl.value)]
                    .items!
                    .isNotEmpty) {
              for (var element in data) {
                for (var e in cartController
                    .getCart
                    .value
                    .store![cartController.getCart.value.store!.indexWhere(
                        (element) => element.id == storeididctrl.value)]
                    .items!) {
                  if (e.name == element.name) {
                    element.quantity = e.quantity;
                    element.deleteCartId = e.id;
                    log(e.food_variant_id!.toString());
                    if (e.food_variant_id != 0) {
                      element.selectedVaritent = element.variants!
                          .indexWhere((x) => element.id == e.food_variant_id);
                    }
                  }
                }
              }
            }
          }
        }
        store.value.categories!
            .firstWhere((element) => element.id == catidctrl.value)
            .Products!
            .addAll(data);
        store.value.categories!
            .firstWhere((element) => element.id == catidctrl.value)
            .filteredProducts!
            .addAll(data);
        store.refresh();
        called.value = true;
      } else {
        // Get.snackbar('Error', 'Something went wrong');
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print('there $e');
      // Get.snackbar('Error', 'Something went wrong');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  getStoreDetails() async {
    try {
      var call = await StoreServices.getStoreDetails(store.value.id!);
      if (call != null) {
        checkKhataExsist(store.value.id!);
        var data = StoreDetailCall.fromJson(call);
        store.value.deliveryCharge = data.data!.deliveryCharge!;
        store.value.ratings = data.data!.ratings;
        store.value.minimumOrderPrice = data.data!.minimumOrderPrice;
        store.refresh();
      } else {
        Get.snackbar('Error', "message");
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', "message");
    }
  }

  Future<ShopModel> getShopModel(int id) async {
    try {
      var call = await StoreServices.getStoreDetails(id);
      if (call != null) {
        print(call);
        // checkKhataExsist(store.value.id!);
        var data = StoreDetailCall.fromRouteJson(call);
        print(data.data!.id);
        return data.data!;
      } else {
        Get.snackbar('Sorry', "Store not available in your area!");
        return ShopModel();
      }
    } catch (e) {
      printInfo(info: e.toString());
      Get.snackbar('Error', "message");
      return ShopModel();
    }
  }

  Future<bool> checkKhataExsist(int shopid) async {
    try {
      var call = await KhataServices.checkKhataRequest(shopid);
      print(call);
      if (call == true) {
        store.value.khataAvailable = true;
        return true;
      } else {
        store.value.khataAvailable = false;
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  addKhataRequest(int shopid) async {
    try {
      var call = await KhataServices.addKhataRequest(shopid);
      if (call == true) {
        store.value.khataAvailable = true;
        store.refresh();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
