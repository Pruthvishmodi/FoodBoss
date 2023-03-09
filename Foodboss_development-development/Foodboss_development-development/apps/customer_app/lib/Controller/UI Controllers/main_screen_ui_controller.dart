import 'package:customer_app/Controller/Business%20Controllers/search_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Models/cart_model.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Models/random_products_model.dart';
import 'package:customer_app/Models/shop_model.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/requests.dart';
import '../../utils/urls.dart';

class MainScreenController extends GetxController {
  // var tabIndex = 0.obs;
  // late ScrollController scrollController;
  ScrollController scrollController = ScrollController();
  var called = true.obs;
  UserController userController = Get.find<UserController>();
  var randomproductsbyshops = <ShopModel>[].obs;
  SearchScreenController searchScreenController =
      Get.put(SearchScreenController());
  int index = 0;
  void scrollListener() async {
    // if (scrollController.position.pixels >= 500.0) {
    // }

    // if(scrollController.position.maxScrollExtent==scrollController.position.pixels){
    //   print('here');
    //     if(index < randomproductsbyshops.value.length-1 ){
    //     }
    //       index++;

    // }

    // if (called == true) {
    await userController.getFavoritesFoods();
    await searchScreenController.fetchNearbyShop();
    printInfo(info: 'fav fetched');
    await userController.getFavoritesStores();
    randomproductsbyshops.value = searchScreenController.shops.value.data!;
    // scrollController.addListener(() async{
    // if (controller.position.maxScrollExtent == controller.position.pixels) {
    // if(called.value){
    randomproductsbyshops.forEach((element) async {
      await fetchRandomProducts(element.id!);
    });
    // }
    called.value = false;
    // if (items.value!.to! < items.value!.total!) {
    // getItemsByPage(items.value!.nextPageUrl!);
    // }
    // });
    // called = false;
    // }
  }

  getRandom() {
    randomproductsbyshops.forEach((element) async {
      printInfo(info: "gg");
      await fetchRandomProducts(element.id!);
    });
  }

  fetchRandomProducts(
    int shopId,
  ) async {
    try {
      var call = await Request.getData(Urls.RANDOMPRODUCTSBYSHOP(shopId), true);
      // print(call);
      printInfo(info: "done calling out");

      if (call.statusCode == 200) {
        if (call != null) {
          List<Product> products = RandomProducts.fromJson(call.data).products!;
          printInfo(info: "done calling");
          randomproductsbyshops.value
              .firstWhere((element) => element.id == shopId)
              .randomProducts = products;
          randomproductsbyshops.value
              .firstWhere((element) => element.id == shopId)
              .randomProducts!
              .forEach((element) {
            if (userController.cartController.getCart.value.store != null) {
              if (userController.cartController.getCart.value.store!.firstWhere(
                      (element) {
                    return element.id == shopId;
                  }, orElse: () {
                    return Store();
                  }).items !=
                  null) {
                userController.cartController.getCart.value.store!
                    .firstWhere(
                      (element) {
                        return element.id == shopId;
                      },
                    )
                    .items!
                    .forEach((ele) {
                      // print(ele.foodId);
                      // print(element.id);
                      if (ele.foodId == element.id) {
                        element.quantity = ele.quantity;
                        element.deleteCartId = ele.id;
                      }
                    });
              }
            }
          });
          randomproductsbyshops.refresh();
        } else {
          // Get.snackbar('Error', 'Something went wrong');
          CustomSnackbar.errorSnackbar();
        }
      }
    } catch (e) {
      print('there $e');
      // Get.snackbar('Something went wrongee', 'Network Error');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  @override
  void onInit() {
    // scrollController = ScrollController()..addListener(_scrollListener);
    scrollListener();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
