import 'dart:developer';

import 'package:customer_app/Controller/Business%20Controllers/category_page_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';

class DynamicRouter {
  StoreProductController storeProductController =
      Get.put(StoreProductController());
  var a = Get.lazyPut(() => CategoryPageController());

  ProductController productController = Get.put(ProductController());
  void initDynamicLinks() async {
    log('helooooooooooooooooooooooooooooooooo');
    // final PendingDynamicLinkData? data =
    //     await FirebaseDynamicLinks.instance.getInitialLink();
    // print('he11111111111111111111111111111111111111111');
    // final Uri? deepLink = data?.link;
    FirebaseDynamicLinks.instance.onLink.listen((deepLink) async {
      log('he00000000000000000000000000000000');
      // print('aaaaaaaaaaaa ${deepLink.toString()}');
      log('aaaaaaaaaaaaaaa ${deepLink.link.toString()}');
      log('aaaaaaaaaaaaaaa ${deepLink.link.path.toString()}');
      // if (deepLink != null) {
      print(deepLink.link.toString().contains('/product?'));
      if (deepLink.link.toString().contains('/faqs')) {
        Get.toNamed('/faqs');
      } else if (deepLink.link.toString().contains('/store')) {
        var id = deepLink.link.toString().split('3D')[1];
        print(id);
        await storeProductController.setStoreForRouter(int.parse(id));

        Get.toNamed('/store-products-screen');
      } else if (deepLink.link.toString().contains('/product')) {
        print('here');
        log(deepLink.link.toString());
        var storeid = deepLink.link
            .toString()
            .split('&storeId')[1]
            .split('&')[0]
            .split('=')[1];
        var productId = deepLink.link.toString().split('&')[1];
        print(storeid);
        print(productId);
        productController.fetchProductDetails(
            int.parse(storeid), int.parse(productId), 0, 0);

        Get.toNamed('/product-detail');
      }
    }).onError((e) {
      print('deep link $e ...............................');
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;
    print(deepLink.toString());
    if (deepLink != null && deepLink.queryParameters != null) {
      if (deepLink.toString().contains('/faqs')) {
        Get.toNamed('/faqs');
      } else if (deepLink.toString().contains('/store')) {
        var id = deepLink.toString().split('&')[1].split('=')[1];
        print(id);
        await storeProductController.setStoreForRouter(int.parse(id));

        Get.toNamed('/store-products-screen');
      } else if (deepLink.toString().contains('/product')) {
        print('here in product');
        print(deepLink);
        var storeid = deepLink
            .toString()
            .split('&storeId')[1]
            .split('&')[0]
            .split('=')[1];
        var productId = deepLink.toString().split('&')[2].split('=')[1];
        printInfo(info: storeid);
        print(productId);
        productController.fetchProductDetails(
            int.parse(storeid), int.parse(productId), 0, 0);

        Get.toNamed('/product-detail');
      }
    }
  }
}
