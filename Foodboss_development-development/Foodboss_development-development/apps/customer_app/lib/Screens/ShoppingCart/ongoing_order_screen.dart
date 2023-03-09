import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
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

class OngoingOrders extends StatefulWidget {
  const OngoingOrders({Key? key}) : super(key: key);

  @override
  State<OngoingOrders> createState() => _OngoingOrdersState();
}

class _OngoingOrdersState extends State<OngoingOrders> {
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

  CartController cartController = Get.find<CartController>();

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
            print(cartController.ongoingLoader.value);
            if (cartController.ongoingLoader.value == true) {
              // print(cartController.ongoingOrders.value.orders!
              //     .firstWhere((element) => element.id == orderId)
              //     .toJson()
              //     .toString());
              return const ShimmerScreen();
            } else {
              var indexOfOrder = cartController.ongoingOrders.value.orders!
                  .indexWhere((element) => element.id == orderId);
              OrderModel order = cartController.ongoingOrders.value.orders!
                  .firstWhere((element) => element.id == orderId);
              // print(order.paymentMethod);
              // print(order.toJson().toString());
              var status = order.status == 'Pending'
                  ? 1
                  : order.status == 'Packed'
                      ? 2
                      : order.status == 'Shipped '
                          ? 3
                          : 4;
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
                                LabelText(text: '${order.totalItems} Items'),
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
                                        child: DescriptionText(
                                            text: order.deliveryBoy!.status!),
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
                          itemCount: cartController.ongoingOrders.value
                              .orders![indexOfOrder].items!.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemList(
                              product: cartController.ongoingOrders.value
                                  .orders![indexOfOrder].items![index],
                              orderIndex: indexOfOrder,
                              canDelete: status == 3,
                            );
                          },
                        ),
                      ),
                      cartController.ongoingOrders.value.orders![indexOfOrder]
                                      .returnItems ==
                                  null ||
                              cartController.ongoingOrders.value
                                  .orders![indexOfOrder].returnItems!.isEmpty
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
                                  itemCount: cartController
                                      .ongoingOrders
                                      .value
                                      .orders![indexOfOrder]
                                      .returnItems!
                                      .length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CancelOrder(
                                      product: cartController
                                          .ongoingOrders
                                          .value
                                          .orders![indexOfOrder]
                                          .returnItems![index],
                                      canDelete: status == 3,
                                      orderIndex: indexOfOrder,
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
                                  child: TitleText(
                                    text: 'Additional Comment',
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        width: 0.5,
                                        color: ThemeConfig.descriptionColor,
                                      )),
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
                                    text: order.paymentMethod == 'COD'
                                        ? 'Cash on Delivery'
                                        : order.paymentMethod == 'POD'
                                            ? 'Pay On Delivery'
                                            : 'Khata')
                              ],
                            ),
                            SB.small(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const DescriptionText(text: 'Subtotal'),
                                Row(
                                  children: [
                                    order.totalPrice == order.totalDiscount
                                        ? SizedBox()
                                        : DescriptionText(
                                            text:
                                                '\u{20B9} ${order.totalPrice}',
                                            type: 'i'),
                                    order.totalPrice == order.totalDiscount
                                        ? SizedBox()
                                        : const SizedBox(
                                            width: 5,
                                          ),
                                    LabelText(
                                        text:
                                            '\u{20B9} ${order.totalDiscount}'),
                                  ],
                                )
                              ],
                            ),
                            SB.small(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const DescriptionText(text: 'Delivery Charge'),
                                LabelText(
                                    isSecondary: order.deliveryCharge == 0.0,
                                    text: order.deliveryCharge == 0.0
                                        ? 'Free'
                                        : '+ \u{20B9} ${order.deliveryCharge ?? 0}')
                              ],
                            ),
                            // SB.small(),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const LabelText(
                            //       isNormal: true,
                            //       text: 'Discount',
                            //       isSecondary: true,
                            //     ),
                            //     Container(
                            //         constraints: BoxConstraints(
                            //             maxWidth:
                            //                 MediaQuery.of(context).size.width *
                            //                     .5),
                            //         child: LabelText(
                            //           text:
                            //               '- \u{20B9} ${(order.totalDiscount! - order.totalPrice!)}',
                            //           isSecondary: true,
                            //         )),
                            //   ],
                            // ),
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
                                          '\u{20B9} ${cartController.ongoingOrders.value.orders![indexOfOrder].totalDiscount! + order.deliveryCharge!}',
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
                                                  text: cartController
                                                      .ongoingOrders
                                                      .value
                                                      .orders![indexOfOrder]
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
                                                      '- \u{20B9}${cartController.ongoingOrders.value.orders![indexOfOrder].returnAmount!.abs()}')),
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
                                                      '\u{20B9} ${(cartController.ongoingOrders.value.orders![indexOfOrder].totalDiscount!.toDouble() - cartController.ongoingOrders.value.orders![indexOfOrder].returnAmount! + order.deliveryCharge!).abs()}')),
                                        ],
                                      ),
                                      SB.small(),
                                    ],
                                  )
                                : SizedBox(),
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
                      status < 3
                          ? Container()
                          : status == 3
                              ? SizedBox(
                                  width: double.infinity,
                                  child: SecondaryButton(
                                    text: 'Generate Delivery Code',
                                    op: () {
                                      List<int> ids = [];
                                      for (var e in order.returnItems!) {
                                        ids.add(e.id!);
                                      }
                                      cartController.generateDeliveryCode(
                                          order.id!, ids);
                                    },
                                    type: 'filled',
                                    width: double.infinity,
                                  ))
                              : SizedBox(
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
  final int orderIndex;
  // final int productIndex;
  final Product product;
  final bool canDelete;
  const ItemList(
      {Key? key,
      required this.product,
      required this.orderIndex,
      // required this.productIndex,
      required this.canDelete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();
    Size size = MediaQuery.of(context).size;
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
          SizedBox(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product.photo!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: size.width * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelText(
                                text: product.name!.split('-')[0].trim(),
                                isSecondary: true,
                                isDotDot: true,
                              ),
                              LabelText(
                                  text: product.name!.split('-')[1].trim()),
                              LabelText(
                                  text: "${product.weight} ${product.unit}"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DescriptionText(
                                      text: '${product.quantity} Qty  '),
                                  LabelText(
                                      text: "\u{20B9} ${product.discount}"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                canDelete
                    ? GestureDetector(
                        onTap: () {
                          if (cartController.ongoingOrders.value
                                  .orders![orderIndex].returnItems ==
                              null) {
                            printInfo(info: "called here");
                            cartController.ongoingOrders.value
                                .orders![orderIndex].returnItems = [];
                            // cartController.ongoingOrders.value
                            //         .orders![orderIndex].returnAmount =
                            //     cartController.ongoingOrders.value
                            //         .orders![orderIndex].totalDiscount;
                          }
                          cartController.ongoingOrders.value.orders![orderIndex]
                              .returnItems!
                              .add(product);
                          cartController.ongoingOrders.value.orders![orderIndex]
                              .returnAmount = cartController.ongoingOrders.value
                                  .orders![orderIndex].returnAmount! +
                              double.parse(product.discount.toString());

                          cartController
                              .ongoingOrders.value.orders![orderIndex].items!
                              .remove(product);
                          if (cartController.ongoingOrders.value
                              .orders![orderIndex].items!.isEmpty) {
                            cartController
                                .ongoingOrders
                                .value
                                .orders![orderIndex]
                                .returnAmount = cartController.ongoingOrders
                                    .value.orders![orderIndex].returnAmount! +
                                cartController.ongoingOrders.value
                                    .orders![orderIndex].deliveryCharge!;
                          }
                          cartController.ongoingOrders.refresh();
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )
                    : const SizedBox(),
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                //   decoration: BoxDecoration(
                //       color: ThemeConfig.greyColor,
                //       // border: Border.all(
                //       //     color: ThemeConfig.descriptionColor, width: 1),
                //       borderRadius: BorderRadius.circular(5)),
                //   child:  LabelText(text: 'x${product.quantity}'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CancelOrder extends StatelessWidget {
  final bool canDelete;
  final Product product;
  final int orderIndex;
  const CancelOrder(
      {Key? key,
      required this.product,
      required this.canDelete,
      required this.orderIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();
    Size size = MediaQuery.of(context).size;
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
                      DescriptionText(text: 'x ${product.quantity!}'),
                      // LabelText(text: '\u{20B9} ${product.price!}')
                    ],
                  ),
                ],
              ),
              canDelete
                  ? GestureDetector(
                      onTap: () {
                        if (cartController.ongoingOrders.value
                            .orders![orderIndex].items!.isEmpty) {
                          cartController.ongoingOrders.value.orders![orderIndex]
                              .returnAmount = cartController.ongoingOrders.value
                                  .orders![orderIndex].returnAmount! -
                              cartController.ongoingOrders.value
                                  .orders![orderIndex].deliveryCharge!;
                        }
                        cartController
                            .ongoingOrders.value.orders![orderIndex].items!
                            .add(product);
                        cartController.ongoingOrders.value.orders![orderIndex]
                            .returnAmount = cartController.ongoingOrders.value
                                .orders![orderIndex].returnAmount! -
                            double.parse(product.discount.toString());
                        cartController.ongoingOrders.value.orders![orderIndex]
                            .returnItems!
                            .remove(product);

                        cartController.ongoingOrders.refresh();
                      },
                      child: const Icon(Icons.add),
                    )
                  : Container(),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              //   decoration: BoxDecoration(
              //       color: ThemeConfig.greyColor,
              //       // border: Border.all(
              //       //     color: ThemeConfig.descriptionColor, width: 1),
              //       borderRadius: BorderRadius.circular(5)),
              //   child: const LabelText(text: 'x1'),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
