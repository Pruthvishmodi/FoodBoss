import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/order_history_controller.dart';
import 'package:customer_app/Models/network_call_models.dart/ongoing_order_call.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Shadow_container.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/title_text.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryDetails extends StatefulWidget {
  const OrderHistoryDetails({Key? key}) : super(key: key);

  @override
  State<OrderHistoryDetails> createState() => _OrderHistoryDetailsState();
}

class _OrderHistoryDetailsState extends State<OrderHistoryDetails> {
  var showTitle = false;
  late ScrollController scrollController;

  @override
  initState() {
    scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (scrollController.position.pixels >= 100.0) {
      setState(() {
        showTitle = true;
      });
    } else {
      setState(() {
        showTitle = false;
      });
    }
  }

  var args = Get.arguments;

  OrderHistoryController orderHistoryController =
      Get.find<OrderHistoryController>();

  @override
  Widget build(BuildContext context) {
    var orderId = args[0];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.whiteColor,
        title: showTitle
            ? const MainLabelText(
                text: 'Order Summary',
                isBold: true,
              )
            : null,
        iconTheme: const IconThemeData(color: ThemeConfig.mainTextColor),
        elevation: 0,
      ),
      backgroundColor: ThemeConfig.whiteColor,
      body: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () {
            if (orderHistoryController.details.value.data == null) {
              return const ShimmerScreen();
            } else {
              OrderModel order = orderHistoryController.details.value.data!;
              print(order.paymentMethod);
              // print(order.toJson().toString());
              var status = 4;
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TitleText(text: 'Order Summary'),
                      ),
                      SB.large(),
                      ProgressWidget(
                        size: 30,
                        stage: status,
                      ),
                      SB.large(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TitleText(text: 'Order details'),
                      ),
                      ShadowContainer(
                        child: Column(
                          children: [
                            Row(
                              children: const [],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const DescriptionText(text: 'Total Item'),
                                LabelText(text: '${order.items!.length} Items'),
                              ],
                            ),
                            SB.medium(),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: const [
                            //     DescriptionText(text: 'Total Order Weight'),
                            //     LabelText(text: '15Kg'),
                            //   ],
                            // ),
                            // SB.medium(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const DescriptionText(text: 'Order ID'),
                                LabelText(text: '${order.id}'),
                              ],
                            ),
                            SB.medium(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const DescriptionText(text: 'Order Date/Time'),
                                LabelText(
                                    text:
                                        order.orderDatenTime ?? 'Not Provided'),
                              ],
                            ),
                            order.arrivalDate == null
                                ? const SizedBox()
                                : SB.medium(),
                            order.arrivalDate == null
                                ? const SizedBox()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const DescriptionText(
                                          text: 'Arrival Date'),
                                      LabelText(text: order.arrivalDate!),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                      SB.small(),
                      status >= 3
                          ? ShadowContainer(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      // DescriptionText(text: 'Total Item'),
                                      LabelText(text: 'Delivery boy'),
                                    ],
                                  ),
                                  SB.medium(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                order.deliveryBoy!.image!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              LabelText(
                                                  text:
                                                      order.deliveryBoy!.name!),
                                              DescriptionText(
                                                  text: order
                                                      .deliveryBoy!.phone!),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 2),
                                        decoration: BoxDecoration(
                                            color: ThemeConfig.greyColor,
                                            // border: Border.all(
                                            //     color: ThemeConfig.descriptionColor, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child:
                                            DescriptionText(text: 'Delivered'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      SB.large(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TitleText(text: 'Ordered Items'),
                      ),
                      Obx(
                        () => ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: orderHistoryController
                              .details.value.data!.items!.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemList(
                              product: orderHistoryController
                                  .details.value.data!.items![index],
                            );
                          },
                        ),
                      ),
                      orderHistoryController.details.value.data!.returnItems ==
                                  null ||
                              orderHistoryController
                                  .details.value.data!.returnItems!.isEmpty
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SB.large(),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TitleText(text: 'Cancelled Items'),
                                ),
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  itemCount: orderHistoryController
                                      .details.value.data!.returnItems!.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CancelOrder(
                                      product: orderHistoryController.details
                                          .value.data!.returnItems![index],
                                    );
                                  },
                                ),
                              ],
                            ),
                      SB.large(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TitleText(text: 'Seller Details'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShadowContainer(
                          child: Column(
                            children: [
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: const [
                              //     LabelText(isNormal: true, text: 'Order Date'),
                              //     LabelText(text: '6May, 2020')
                              //   ],
                              // ),
                              SB.small(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(isNormal: true, text: 'Name'),
                                  LabelText(text: order.store!.name!)
                                ],
                              ),
                              SB.small(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(
                                      isNormal: true, text: 'Mobile No.'),
                                  LabelText(text: order.store!.phoneNumber!)
                                ],
                              ),
                              SB.small(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(
                                      isNormal: true, text: 'Address'),
                                  Container(
                                      constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .5),
                                      child: LabelText(
                                        text: order.store!.address!,
                                        alignment: TextAlign.right,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      order.customerComments! == ''
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SB.large(),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child:
                                      MainLabelText(text: 'Additional Comment'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DescriptionText(
                                    text: order.customerComments!,
                                  ),
                                ),
                              ],
                            ),
                      SB.large(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TitleText(text: 'Payment Details'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const DescriptionText(text: 'Payment Method'),
                                LabelText(
                                    text: order.paymentMethod == "COD"
                                        ? 'Cash on Delivery'
                                        : order.paymentMethod == 'POD'
                                            ? 'Pay On Delivery'
                                            : 'Khata')
                              ],
                            ),
                            // SB.small(),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: const [
                            //     LabelText(isNormal: true, text: 'Subtotal'),
                            //     LabelText(text: '\u{20B9} 1080')
                            //   ],
                            // ),
                            SB.small(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const DescriptionText(text: 'Delivery Charge'),
                                LabelText(
                                    text:
                                        '+\u{20B9} ${order.deliveryCharge ?? 0}')
                              ],
                            ),
                            SB.small(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const LabelText(
                                  isNormal: true,
                                  text: 'Discount',
                                  isSecondary: true,
                                ),
                                Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                .5),
                                    child: LabelText(
                                      text:
                                          '-\u{20B9} ${(order.totalDiscount! - order.totalPrice!).abs()}',
                                      isSecondary: true,
                                    )),
                              ],
                            ),
                            SB.medium(),
                            const Divider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const MainLabelText(
                                  text: 'Order total',
                                  isBold: true,
                                ),
                                Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                .5),
                                    child: MainLabelText(
                                      text:
                                          '\u{20B9} ${order.totalDiscount! + order.deliveryCharge!}',
                                      isBold: true,
                                    )),
                              ],
                            ),
                            order.returnItems!.isNotEmpty
                                ? Column(
                                    children: [
                                      SB.small(),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const LabelText(
                                              text: 'Returned Items'),
                                          Container(
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .5),
                                              child: LabelText(
                                                  text: orderHistoryController
                                                      .details
                                                      .value
                                                      .data!
                                                      .returnItems!
                                                      .length
                                                      .toString())),
                                        ],
                                      ),
                                      SB.small(),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const LabelText(
                                              text: 'Returned item payment'),
                                          Container(
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .5),
                                              child: LabelText(
                                                  text:
                                                      '-\u{20B9} ${orderHistoryController.details.value.data!.returnAmount}')),
                                        ],
                                      ),
                                      SB.small(),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const MainLabelText(
                                            text: 'New order total',
                                            isBold: true,
                                          ),
                                          Container(
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .5),
                                              child: MainLabelText(
                                                  isBold: true,
                                                  text:
                                                      '\u{20B9}${orderHistoryController.details.value.data!.finalAmount}')),
                                        ],
                                      ),
                                      SB.small(),
                                    ],
                                  )
                                : Container(),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const LabelText(
                            //         isSecondary: true, text: 'your savings'),
                            //     Container(
                            //         constraints: BoxConstraints(
                            //             maxWidth: MediaQuery.of(context)
                            //                     .size
                            //                     .width *
                            //                 .5),
                            //         child: const LabelText(
                            //             isSecondary: true,
                            //             text: '-\u{20B9}1410')),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      // Divider(),
                      SB.medium(),
                      SizedBox(
                        width: double.infinity,
                        child: SecondaryButton(
                          text: 'Reorder',
                          op: () {},
                          type: 'filled',
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ]),
              );
            }
          },
        ),
      ),
    );
  }
}

class ProgressCircle extends StatelessWidget {
  final double size;
  final Color color;
  const ProgressCircle({Key? key, required this.size, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(size / 2)),
      height: size,
      width: size,
      child: const Icon(
        Icons.done,
        color: ThemeConfig.whiteColor,
        size: 15,
      ),
    );
  }
}

class ProgressWidget extends StatelessWidget {
  final double size;
  final int stage;
  const ProgressWidget({Key? key, required this.size, required this.stage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              ProgressCircle(
                size: size,
                color: stage >= 1
                    ? ThemeConfig.secondaryColor
                    : ThemeConfig.greyColor,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: ThemeConfig.secondaryColor,
              //       borderRadius: BorderRadius.circular(size / 2)),
              //   height: size,
              //   width: size,
              // ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: stage > 1
                        ? ThemeConfig.secondaryColor
                        : ThemeConfig.greyColor,
                  ),
                  height: size / 9,

                  // width: size,
                ),
              ),
              ProgressCircle(
                color: stage >= 2
                    ? ThemeConfig.secondaryColor
                    : ThemeConfig.greyColor,
                size: size,
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: stage > 2
                        ? ThemeConfig.secondaryColor
                        : ThemeConfig.greyColor,
                  ),
                  height: size / 9,
                  // width: size,
                ),
              ),
              ProgressCircle(
                color: stage >= 3
                    ? ThemeConfig.secondaryColor
                    : ThemeConfig.greyColor,
                size: size,
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: stage > 3
                        ? ThemeConfig.secondaryColor
                        : ThemeConfig.greyColor,
                  ),
                  height: size / 9,

                  // width: size,
                ),
              ),
              ProgressCircle(
                color: stage >= 4
                    ? ThemeConfig.secondaryColor
                    : ThemeConfig.greyColor,
                size: size,
              ),
            ],
          ),
        ),
        SB.small(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelText(isSecondary: stage >= 1, text: 'Recieved'),
            LabelText(isSecondary: stage >= 2, text: 'Packed'),
            LabelText(isSecondary: stage >= 3, text: 'Shipped'),
            LabelText(isSecondary: stage >= 4, text: 'Delivered'),
          ],
        )
      ],
    );
  }
}

class ItemList extends StatelessWidget {
  // final int productIndex;
  final Product product;

  const ItemList({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: const [
          //     // DescriptionText(text: 'Total Item'),
          //     LabelText(text: 'Delivery boy'),
          //   ],
          // ),
          // SB.medium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.photo!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        text: product.name!.split('-')[0],
                        isSecondary: true,
                      ),
                      LabelText(text: product.name!.split('-')[1].trim()),
                      LabelText(
                        text: '${product.weight} ${product.unit}',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DescriptionText(text: '${product.quantity} Qty  '),
                          LabelText(text: "\u{20B9} ${product.discount}"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CancelOrder extends StatelessWidget {
  final Product product;
  const CancelOrder({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.red,
            // offset: Offset(
            //   5.0,
            //   5.0,
            // ),
            blurRadius: 1.0,
            spreadRadius: .1,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: const [
          //     // DescriptionText(text: 'Total Item'),
          //     LabelText(text: 'Delivery boy'),
          //   ],
          // ),
          // SB.medium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.photo!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        text: product.name!.split('-')[0],
                        isSecondary: true,
                      ),
                      LabelText(
                        text: product.name!.split('-')[1].trim(),
                      ),
                      LabelText(
                        text: '${product.weight} ${product.unit}',
                      ),
                      // DescriptionText(text: 'x ${product.quantity!}'),
                      // LabelText(text: '\u{20B9} ${product.price!}')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DescriptionText(text: '${product.quantity} Qty  '),
                          LabelText(text: "\u{20B9} ${product.discount}"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
