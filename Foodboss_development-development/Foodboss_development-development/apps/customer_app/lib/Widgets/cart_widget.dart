import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartWidget extends StatelessWidget {
  CartWidget({
    Key? key,
  }) : super(key: key);

  CartController cartController = Get.put(CartController(), permanent: true);
  // HomePageController homePageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          color: Colors.transparent,
          height: cartController.count.value == 0 ? 0 : 60,
          padding: const EdgeInsets.all(10),
          child: cartController.count.value == 0
              ? Container()
              : GestureDetector(
                  onTap: () {
                    cartController.fetchCart();
                    cartController.fetchOngoingOrders();
                    // homePageController.tabIndex.value == 2;
                    Get.toNamed('/Basket');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 30,
                    width: size.width - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ThemeConfig.secondaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.shopping_cart_outlined,
                              color: ThemeConfig.whiteColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            LabelText(
                              text: '${cartController.count.value} items',
                              isWhite: true,
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            LabelText(
                              text: 'View Cart',
                              isWhite: true,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: ThemeConfig.whiteColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
