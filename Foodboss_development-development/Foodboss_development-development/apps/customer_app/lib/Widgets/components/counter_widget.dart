import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/store_product_ui_controller.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Controller/Business Controllers/store_product_controller.dart';

class CounterWidget extends StatelessWidget {
  final double? width;
  final Product? product;
  CartController cartController = Get.find<CartController>();
  StoreProductUiController storeProductUiController =
      Get.find<StoreProductUiController>();
  StoreProductController storeProductController =
      Get.find<StoreProductController>();
  // int count = 0;

  CounterWidget({Key? key, this.width, this.product}) : super(key: key);
  increment() {
    // print(productId);
    // print(storeId);
    cartController.addProductTocart(
        product!, storeProductUiController, storeProductController);
    // setState(() {
    //   count++;
    //   widget.cartController.addToCart();
    // });
  }

  decrement() {
    cartController.removeProductTocart(
        product!, storeProductUiController, storeProductController);
    // if (count > 0) {
    //   // setState(() {
    //     count--;
    //   // });
    // }
  }

  @override
  Widget build(BuildContext context) {
    printInfo(info: product!.id.toString());
    return Card(
      elevation: 2,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: width ?? 80,
          height: 30,
          decoration: BoxDecoration(
              color: (product == null ||
                      product!.quantity == 0 ||
                      product!.quantity == null)
                  ? ThemeConfig.whiteColor
                  : ThemeConfig.primaryColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 0.5,
                  color: (product == null ||
                          product!.quantity == 0 ||
                          product!.quantity == null)
                      ? ThemeConfig.greyColor
                      : ThemeConfig.primaryColor)),
          child: (product == null ||
                  product!.quantity == 0 ||
                  product!.quantity == null)
              ? GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    if (product!.quantity! >= product!.productStock!) {
                      CustomSnackbar.infoSnackbar('Sorry, No Stock available');
                    } else {
                      increment();
                    }
                    HapticFeedback.vibrate();
                  },
                  child: Container(
                      width: 80,
                      alignment: Alignment.center,
                      child: const Text('Add',
                          style: TextStyle(
                              color: ThemeConfig.secondaryColor,
                              fontSize: ThemeConfig.labelSize,
                              fontWeight: FontWeight.w900))))
              : Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              decrement();
                              HapticFeedback.vibrate();
                            },
                            child: const SizedBox(
                              // color: ThemeConfig.whiteColor,
                              width: double.infinity,
                              height: double.infinity,
                              child: Icon(
                                Icons.remove,
                                size: 15,
                              ),
                            ))),
                    Center(
                        child: Text(product!.quantity.toString(),
                            // cartController.cart.value.firstWhere((element) => element.id== product!.id).quantity.toString(),
                            style: const TextStyle(
                                color: ThemeConfig.mainTextColor,
                                fontSize: ThemeConfig.labelSize,
                                fontWeight: FontWeight.bold))),
                    Expanded(
                        child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              if (product!.quantity! >=
                                  product!.productStock!) {
                                CustomSnackbar.infoSnackbar(
                                    'Limited Stock available');
                              } else {
                                increment();
                              }
                              HapticFeedback.vibrate();
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ))),
                  ],
                )),
    );
  }
}
