import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/order_history_controller.dart';
import 'package:customer_app/Models/network_call_models.dart/order_history_model.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/title_text.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderHistoryController orderHistoryController =
        Get.put(OrderHistoryController());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: ThemeConfig.whiteColor,
        iconTheme: const IconThemeData(color: ThemeConfig.mainTextColor),
        elevation: 0,
      ),
      backgroundColor: ThemeConfig.whiteColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: TitleText(text: 'Order History'),
              ),
              SB.large(),
              Obx(
                () {
                  if (orderHistoryController.orders.value.data == null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) => Shimmer.fromColors(
                            child: const ShimmerContainer(
                              height: 200,
                              width: double.infinity,
                            ),
                            baseColor: Colors.white,
                            highlightColor: Colors.grey.shade200),
                      ),
                    );
                  } else {
                    if (orderHistoryController.orders.value.data!.length == 0) {
                      return const Expanded(
                          child: Center(
                        child: DescriptionText(text: 'No orders yet'),
                      ));
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount:
                              orderHistoryController.orderList.value.length,
                          itemBuilder: (BuildContext context, int index) {
                            return OrderCard(
                              orderH:
                                  orderHistoryController.orderList.value[index],
                            );
                          },
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final OrderH orderH;
  const OrderCard({Key? key, required this.orderH}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderHistoryController orderHistoryController =
        Get.find<OrderHistoryController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: ThemeConfig.greyColor,
              offset: Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              orderH.shop!.image!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                child: MainLabelText(
                                  text: orderH.shop!.name!,
                                  isBold: true,
                                ),
                              ),
                              DescriptionText(text: orderH.shop!.city!),
                              DescriptionText(
                                  text:
                                      '${(orderH.shop!.distance! / 1000).toStringAsFixed(1)} Kms'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      orderHistoryController
                          .fetchHistoryOrderDetails(orderH.id!);
                      Get.toNamed('/order-history-details',
                          arguments: [orderH.id!]);
                    },
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                              color: ThemeConfig.secondaryColorLite,
                              // border: Border.all(
                              //     color: ThemeConfig.descriptionColor, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: LabelText(text: orderH.orderStatus!),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.s,
                          children: const [
                            LabelText(
                              text: 'view more',
                              isSecondary: true,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 15,
                              color: ThemeConfig.secondaryColor,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DescriptionText(
                          text:
                              '${orderH.deliveryDate} at ${orderH.deliveryTime} '),
                      LabelText(text: '\u{20B9}${orderH.orderTotal}')
                    ],
                  ),
                  const Divider(),
                  Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            print(orderH.rated);
                            if (orderH.rated == null) {
                              Get.toNamed('/review-screen',
                                  arguments: [orderH.shop!.id!]);
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const LabelText(text: 'Rate'),
                              const SizedBox(
                                width: 2,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    // print(index);
                                    print(orderH.rate);
                                    return Container(
                                      height: 20,
                                      width: 35,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 0),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      decoration: BoxDecoration(
                                          color: orderH.rate! > index
                                              ? ThemeConfig.secondaryColor
                                              : ThemeConfig.whiteColor,
                                          border: Border.all(
                                              color: ThemeConfig.secondaryColor,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          LabelText(
                                              text: (index + 1).toString(),
                                              isSecondary: orderH.rate! > index
                                                  ? false
                                                  : true,
                                              isWhite: orderH.rate! > index
                                                  ? true
                                                  : false),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 15,
                                            color: orderH.rate! > index
                                                ? ThemeConfig.whiteColor
                                                : ThemeConfig.secondaryColor,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        // Container(
                        //   padding: const EdgeInsets.symmetric(horizontal: 5),
                        //   decoration: BoxDecoration(
                        //       color: ThemeConfig.secondaryColor,
                        //       borderRadius: BorderRadius.circular(8),
                        //       border: Border.all(
                        //           color: ThemeConfig.secondaryColor, width: 1)),
                        //   height: 40,
                        //   // width: 80,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       const Icon(
                        //         Icons.restart_alt_sharp,
                        //         size: 15,
                        //         color: ThemeConfig.whiteColor,
                        //       ),
                        //       TextButton(
                        //         onPressed: () {},
                        //         child: const Text('Reorder',
                        //             style: TextStyle(
                        //                 color: ThemeConfig.whiteColor,
                        //                 fontSize: 10)),
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
