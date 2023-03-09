import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/homepage_controller.dart';
import 'package:customer_app/Models/cart_model.dart';
import 'package:customer_app/Models/network_call_models.dart/ongoing_order_call.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/title_text.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class StoreWiseCart extends StatelessWidget {
  StoreWiseCart({Key? key}) : super(key: key);

  CartController cartController = Get.find<CartController>();
  HomePageController homePageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.whiteColor,
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: () async {
          cartController.fetchCart();
          cartController.fetchOngoingOrders();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Container(
            // height: MediaQuery.of(context).size.height,
            padding: ThemeConfig.screenPadding,
            constraints:
                const BoxConstraints(maxWidth: ThemeConfig.maxScreenSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SB.large(),
                const TitleText(text: 'My Basket'),
                SB.small(),

                const LabelText(text: 'Manage your orders'),
                // const MainLabelText(
                //     text: 'Curated with the best range of products'),

                // const SizedBox(height: 20),
                SB.large(),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: -),
                  height: 5,
                  width: MediaQuery.of(context).size.width,
                  color: ThemeConfig.greyColor,
                ),
                SB.large(),

                const MainLabelText(
                  text: 'Your checkout list',
                  isBold: true,
                ),
                Obx(
                  () {
                    if (cartController.getCart.value.store == null) {
                      return Center(
                        child: Shimmer.fromColors(
                            child: const ShimmerContainer(
                              height: 200,
                              width: double.infinity,
                            ),
                            baseColor: Colors.white,
                            highlightColor: Colors.grey.shade200),
                      );
                    } else {
                      if (cartController.getCart.value.store!.isEmpty) {
                        return Container(
                          height: 200,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const DescriptionText(
                                  text: 'There are no products in the cart'),
                              SB.medium(),
                              SecondaryButton(
                                  text: 'Go shopping',
                                  op: () {
                                    print(
                                        ModalRoute.of(context)!.settings.name);
                                    if (ModalRoute.of(context)!.settings.name ==
                                        "/Basket") {
                                      Get.back();
                                      Get.back();
                                      Get.back();
                                      homePageController.changeTabIndex(1);
                                    } else {
                                      homePageController.changeTabIndex(1);
                                    }
                                  },
                                  type: 'filled')
                            ],
                          ),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          // padding: EdgeInsets.symmetric(vertical: 30),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cartController.getCart.value.store!.length,
                          reverse: true,
                          itemBuilder: (BuildContext context, int index) {
                            return CheckoutContainer(
                              store: cartController.getCart.value.store![index],
                              index: index,
                            );
                          },
                        );
                      }
                    }
                  },
                ),
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width,
                  color: ThemeConfig.greyColor,
                ),
                const SizedBox(height: 20),
                const MainLabelText(
                  text: 'Ongoing orders',
                  isBold: true,
                ),

                Obx(
                  () {
                    if (cartController.ongoingOrders.value.orders == null) {
                      return Center(
                        child: Shimmer.fromColors(
                            child: const ShimmerContainer(
                              height: 200,
                              width: double.infinity,
                            ),
                            baseColor: Colors.white,
                            highlightColor: Colors.grey.shade200),
                      );
                    } else {
                      if (cartController.ongoingOrders.value.orders!.isEmpty) {
                        return Container(
                          height: 200,
                          alignment: Alignment.center,
                          child: const DescriptionText(
                              text: 'There are no ongoing orders'),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          // padding: EdgeInsets.symmetric(vertical: 30),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              cartController.ongoingOrders.value.orders!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return OngoingOrderCard(
                              index: index,
                            );
                          },
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class CheckoutContainer extends StatelessWidget {
  final Store store;
  final int index;
  const CheckoutContainer({Key? key, required this.store, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainLabelText(
                  text: store.name!,
                  // isBold: true,
                ),
                // const Icon(
                //   Icons.delete_forever_rounded,
                //   color: Colors.red,
                // )
              ],
            ),
            SB.medium(),
            LabelText(
              text: 'Total items: ${store.totalItems}',
              // isBold: true,
            ),
            SB.medium(),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                      text: 'Total amount:',
                      style: TextStyle(color: ThemeConfig.mainTextColor)),
                  TextSpan(
                    text: '  \u{20B9}${store.totalDiscoutPrice} ',
                    style: const TextStyle(
                        color: ThemeConfig.mainTextColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                        // color: Colors.blue,
                        ),
                  ),
                  store.totalPrice == store.totalDiscoutPrice
                      ? const TextSpan()
                      : TextSpan(
                          text: '\u{20B9}${store.totalPrice}',
                          style: const TextStyle(
                              color: ThemeConfig.mainTextColor,
                              decoration: TextDecoration.lineThrough)),
                ])),
            SB.medium(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: ThemeConfig.secondaryColor, width: 1)),
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {
                  Get.toNamed('/checkout-list', arguments: [index]);
                },
                child: const Text('checkout',
                    style: TextStyle(color: ThemeConfig.secondaryColor)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OngoingOrderCard extends StatelessWidget {
  final int index;
  OngoingOrderCard({Key? key, required this.index}) : super(key: key);

  CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    OrderModel order = cartController.ongoingOrders.value.orders![index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MainLabelText(
                    text: order.storeName!,
                    // isBold: true,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(
                      color: ThemeConfig.secondaryColorLite,
                      border: Border.all(
                          color: ThemeConfig.secondaryColor, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: LabelText(
                    text: order.status!,
                    isNormal: true,
                  ),
                )
              ],
            ),
            SB.medium(),
            LabelText(
              text: 'Total items: ${order.totalItems}',
              // isBold: true,
            ),
            SB.medium(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      const TextSpan(
                          text: 'Total amount:',
                          style: TextStyle(color: ThemeConfig.mainTextColor)),
                      TextSpan(
                        text: '  \u{20B9}${order.price} ',
                        style: const TextStyle(
                            color: ThemeConfig.mainTextColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                            // color: Colors.blue,
                            ),
                      ),
                    ])),
                LabelText(
                  text: 'Order Id: ${order.id}',
                  // isBold: true,
                ),
              ],
            ),
            SB.medium(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: ThemeConfig.secondaryColor, width: 1)),
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {
                  cartController.fetchOrderDetails(order.id!);
                  Get.toNamed('/ongoing-orders', arguments: [order.id!]);
                },
                child: const Text('view details',
                    style: TextStyle(color: ThemeConfig.secondaryColor)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
