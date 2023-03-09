import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/map_address_controller.dart';
import 'package:customer_app/Models/cart_model.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Screens/ManageAddressScreen/manage_address_screen.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/title_text.dart';
import 'package:customer_app/Widgets/components/new_counter.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCart extends StatelessWidget {
  // final Store store;
  ShoppingCart({
    Key? key,
  }) : super(key: key);
  MapAdressController mapAdressController = Get.find<MapAdressController>();

  // late bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();
    TextEditingController commentController = TextEditingController();
    var args = Get.arguments;
    Store store = cartController.getCart.value.store != null
        ? cartController.getCart.value.store![args[0]!]
        : Store();
    print(store.distance);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.whiteColor,
        iconTheme: const IconThemeData(color: ThemeConfig.mainTextColor),
        elevation: 0,
      ),
      backgroundColor: ThemeConfig.whiteColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            mapAdressController.getAllAddress();
            cartController.fetchCart();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Container(
              // height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TitleText(text: store.name!),
                    ),
                    SB.large(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${(store.distance! / 1000).toStringAsFixed(1)} km away',
                                  style: const TextStyle(
                                      fontSize: ThemeConfig.mainLabelSize,
                                      fontWeight: FontWeight.bold),
                                ),
                                SB.small(),
                                Text(
                                  store.address!,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SB.large(),
                          Obx(
                            () => ListView.separated(
                              separatorBuilder: (context, index) => Column(
                                children: const [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider()
                                ],
                              ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cartController.getCart.value
                                          .store![args[0]!].items !=
                                      null
                                  ? cartController.getCart.value
                                      .store![args[0]!].items!.length
                                  : 0,
                              itemBuilder: (BuildContext context, int index) {
                                return cartPageContainer(
                                  product: cartController.getCart.value
                                              .store![args[0]!].items !=
                                          null
                                      ? cartController.getCart.value
                                          .store![args[0]!].items![index]
                                      : Product(),
                                  storeId: cartController
                                      .getCart.value.store![args[0]!].id!,
                                  storeIndex: args[0]!,
                                  productIndex: index,
                                );
                              },
                            ),
                          ),
                        ]),
                    Container(
                      height: 10,
                      color: ThemeConfig.greyColor,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 15, top: 8),
                        child: MyAddressCard()),
                    Container(
                      height: 10,
                      color: ThemeConfig.greyColor,
                    ),
                    Padding(
                      padding: ThemeConfig.screenPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SB.large(),
                          const MainLabelText(
                            text: 'Payment Method',
                            isBold: true,
                          ),
                          SB.large(),
                          Obx(
                            () => Column(children: [
                              PayOptionChips(
                                icon: Icons.currency_rupee_rounded,
                                // text: 'COD - pay with cash on delivery',
                                isSelected: cartController.paymethod.value ==
                                    PaymentMethod.COD,
                                ontap: () => cartController
                                    .changePayMethod(PaymentMethod.COD),
                                desc:
                                    'Tip: while receiving your delivery use cash or UPI payments to pay',
                                text: 'Cash on Delivery',
                              ),
                              !store.isKhataAvailable!
                                  ? Container()
                                  : PayOptionChips(
                                      icon:
                                          Icons.account_balance_wallet_rounded,
                                      // text: 'KHATA - your balance is 4570',
                                      ontap: () => cartController
                                          .changePayMethod(PaymentMethod.KHATA),
                                      isSelected:
                                          cartController.paymethod.value ==
                                              PaymentMethod.KHATA,
                                      desc:
                                          'Your current Khata balance is ${store.khataLimit}', //green color amount
                                      text: 'Khata Pay',
                                    ),
                            ]),
                          ),
                          SB.large(),
                        ],
                      ),
                    ),
                    Container(
                      height: 10,
                      color: ThemeConfig.greyColor,
                    ),
                    Padding(
                      padding: ThemeConfig.screenPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SB.large(),
                          // const MainLabelText(
                          //   text: 'Enter Additional comment',
                          //   isBold: true,
                          // ),
                          // SB.large(),
                          TextField(
                            // onSubmitted: onc,
                            cursorColor: ThemeConfig.mainTextColor,
                            // controller: commentController,
                            // keyboardType: TextInputWidge,
                            onChanged: (val) =>
                                cartController.onChangeComment(val),
                            // focusNode: focusNode,
                            onTap: () {
                              // ontap!();
                            },
                            decoration: const InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: ThemeConfig.whiteColor,
                              contentPadding:
                                  EdgeInsets.only(top: 7, bottom: 7, left: 7),
                              hintText: 'add comment',
                              hintStyle: TextStyle(
                                  color: ThemeConfig.descriptionColor),
                              // labelText: 'add comment',

                              labelStyle: TextStyle(
                                  color: ThemeConfig.descriptionColor),
                              // focusedBorder: const OutlineInputBorder(
                              //   borderSide:BorderSide.none,
                              //   //  const BorderSide(
                              //   //     color: ThemeConfig.secondaryColor, width: 1),
                              // ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: ThemeConfig.descriptionColor)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.5,
                                    color: ThemeConfig.secondaryColor),
                              ),
                              focusColor: ThemeConfig.greyColor,
                              suffixIcon: Icon(
                                Icons.add_circle_outline_rounded,
                                size: 25,
                              ),
                            ),
                          ),
                          SB.large(),
                        ],
                      ),
                    ),
                    Container(
                      height: 10,
                      color: ThemeConfig.greyColor,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 15, top: 8),
                      child: Obx(
                        () => billCard(
                          itemTotal: cartController
                              .getCart.value.store![args[0]!].totalItems
                              .toString(),
                          billTotal: (cartController.getCart.value
                                      .store![args[0]!].totalDiscoutPrice! +
                                  int.parse(cartController.getCart.value
                                      .store![args[0]!].deliveryCharges!))
                              .toString(),
                          subTotal: cartController
                              .getCart.value.store![args[0]!].totalPrice
                              .toString(),
                          deliveryCharge: cartController
                              .getCart.value.store![args[0]!].deliveryCharges
                              .toString(),
                          discount: (cartController.getCart.value
                                      .store![args[0]!].totalPrice! -
                                  cartController.getCart.value.store![args[0]!]
                                      .totalDiscoutPrice!)
                              .toString(),
                          discountTotal: cartController
                              .getCart.value.store![args[0]!].totalDiscoutPrice!
                              .toString(),
                          mininumOrderValue: cartController.getCart.value
                              .store![args[0]!].minimunOrderValue!,
                          isLessThanMinimun: double.parse(cartController.getCart
                                  .value.store![args[0]!].totalDiscoutPrice!
                                  .toString()) <
                              double.parse(cartController.getCart.value
                                  .store![args[0]!].minimunOrderValue!),
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
                      color: ThemeConfig.greyColor,
                    ),
                    SB.medium(),
                    Obx(
                      () => SizedBox(
                          width: double.infinity,
                          child: double.parse(cartController.getCart.value
                                      .store![args[0]!].totalDiscoutPrice!
                                      .toString()) <
                                  double.parse(cartController.getCart.value
                                      .store![args[0]!].minimunOrderValue!)
                              ? DisabledButton(
                                  text: 'Checkout', op: () {}, type: 'outlined')
                              : SecondaryButton(
                                  text: 'Checkout',
                                  op: () {
                                    if (cartController.paymethod.value ==
                                            PaymentMethod.KHATA &&
                                        cartController
                                                    .getCart
                                                    .value
                                                    .store![args[0]!]
                                                    .totalDiscoutPrice! +
                                                double.parse(cartController
                                                    .getCart
                                                    .value
                                                    .store![args[0]!]
                                                    .deliveryCharges!) >
                                            cartController.getCart.value
                                                .store![args[0]!].khataLimit!) {
                                      CustomSnackbar.errorSnackbar2(
                                          'Not Enough Khata Balance');
                                    } else {
                                      print('he');
                                      print(store.id!);
                                      print(mapAdressController
                                          .selectedAddress.id!);
                                      print(store.fcmToken.toString());
                                      cartController.checkoutCart(
                                          store.id!,
                                          mapAdressController
                                              .selectedAddress.id!,
                                          store.fcmToken ?? '');
                                    }
                                  },
                                  type: 'filled')),
                    ),
                    SB.medium(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class billCard extends StatelessWidget {
  final String itemTotal;
  final String deliveryCharge;
  final String discount;
  final String billTotal;
  final String mininumOrderValue;
  final String subTotal;
  final String discountTotal;
  final bool isLessThanMinimun;
  const billCard({
    Key? key,
    required this.itemTotal,
    required this.deliveryCharge,
    required this.discount,
    required this.billTotal,
    required this.mininumOrderValue,
    required this.isLessThanMinimun,
    required this.subTotal,
    required this.discountTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // color:Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SB.large(),

          const MainLabelText(
            text: 'Bill details',
            isBold: true,
          ),
          // SB.medium(),
          const SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const Text('Item Total', style: TextStyle(fontSize: 12)),
              const DescriptionText(text: 'Total items'),
              LabelText(
                text: itemTotal,
              ),

              // Text('\u{20B9}$price', style: const TextStyle(fontSize: 12))
            ],
          ),
          SB.small(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DescriptionText(text: 'Sub total'),
              Row(
                children: [
                  subTotal == discountTotal
                      ? SizedBox()
                      : DescriptionText(
                          text: '\u{20B9}$subTotal',
                          type: 'i',
                        ),
                  subTotal == discountTotal
                      ? SizedBox()
                      : const SizedBox(
                          width: 5,
                        ),
                  LabelText(
                    text: '\u{20B9}$discountTotal',
                  ),
                ],
              ),
            ],
          ),
          SB.small(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DescriptionText(text: 'Delivery charge'),
              LabelText(
                isSecondary: double.parse(deliveryCharge.toString()) == 0.0,
                text: double.parse(deliveryCharge.toString()) == 0.0
                    ? 'Free'
                    : '\u{20B9}$deliveryCharge',
              ),
            ],
          ),
          // SB.small(),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const LabelText(
          //       text: 'Discount',
          //       isSecondary: true,
          //     ),
          //     LabelText(
          //       text: '- \u{20B9}$discount',
          //       isSecondary: true,
          //     ),
          //   ],
          // ),

          SB.large(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MainLabelText(
                text: 'Bill Total',
                isBold: true,
              ),
              MainLabelText(
                text: '\u{20B9}$billTotal',
                isBold: true,
              )
            ],
          ),
          SB.large(),
          isLessThanMinimun
              ? Column(
                  children: [
                    SB.small(),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Your bill total should be greater than minimum order amount',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SB.small(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LabelText(text: 'Minimum Order Amount '),
                        LabelText(
                          text: '\u{20B9}$mininumOrderValue',
                        ),
                      ],
                    ),
                    SB.large(),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

class cartPageContainer extends StatelessWidget {
  final Product product;
  final int storeId;
  final int storeIndex;
  final int productIndex;

  const cartPageContainer({
    Key? key,
    required this.product,
    required this.storeId,
    required this.storeIndex,
    required this.productIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Image.network(
              product.photo.toString(),
            ),
          ),
        ),
        Obx(
          () => Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: LabelText(
                          text: product.name.toString().split('-')[0],
                          isSecondary: true,
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     cartController.removeProductFromDirectly(
                      //         product.id!, storeId);
                      //   },
                      //   child: const Icon(
                      //     Icons.delete,
                      //     color: Colors.red,
                      //   ),
                      // )
                      Obx(
                        () => NewCounter(
                          width: 100,
                          count: cartController.getCart.value.store![storeIndex]
                              .items![productIndex].quantity!,
                          increment: () async {
                            printInfo(info: 'here');
                            var call = await cartController.addToCARTDIRECTLY(
                                product.foodId!,
                                storeId,
                                cartController.getCart.value.store![storeIndex]
                                        .items![productIndex].quantity! +
                                    1,
                                0);

                            if (call["success"] == true) {
                              cartController
                                  .getCart
                                  .value
                                  .store![storeIndex]
                                  .items![productIndex]
                                  .quantity = cartController
                                      .getCart
                                      .value
                                      .store![storeIndex]
                                      .items![productIndex]
                                      .quantity! +
                                  1;

                              cartController.getCart.value.store![storeIndex]
                                  .totalDiscoutPrice = int.parse((cartController
                                          .getCart
                                          .value
                                          .store![storeIndex]
                                          .totalDiscoutPrice!
                                          .toDouble() +
                                      double.parse(cartController
                                          .getCart
                                          .value
                                          .store![storeIndex]
                                          .items![productIndex]
                                          .discount!))
                                  .toString()
                                  .split('.')[0]);
                              cartController.getCart.value.store![storeIndex]
                                  .totalPrice = int.parse((cartController
                                          .getCart
                                          .value
                                          .store![storeIndex]
                                          .totalPrice!
                                          .toDouble() +
                                      double.parse(cartController
                                          .getCart
                                          .value
                                          .store![storeIndex]
                                          .items![productIndex]
                                          .price!))
                                  .toString()
                                  .split('.')[0]);
                              cartController.getCart.refresh();
                            }
                          },
                          decrement: () async {
                            printInfo(info: 'elo');
                            if (cartController.getCart.value.store![storeIndex]
                                    .items![productIndex].quantity! >
                                1) {
                              printInfo(
                                  info:
                                      'here ${cartController.getCart.value.store![storeIndex].items![productIndex].quantity! - 1}');
                              var call = await cartController.addToCARTDIRECTLY(
                                  product.foodId!,
                                  storeId,
                                  cartController
                                          .getCart
                                          .value
                                          .store![storeIndex]
                                          .items![productIndex]
                                          .quantity! -
                                      1,
                                  0);
                              printInfo(info: call.toString());
                              if (call["success"] == true) {
                                cartController
                                    .getCart
                                    .value
                                    .store![storeIndex]
                                    .items![productIndex]
                                    .quantity = cartController
                                        .getCart
                                        .value
                                        .store![storeIndex]
                                        .items![productIndex]
                                        .quantity! -
                                    1;

                                cartController.getCart.value.store![storeIndex]
                                        .totalDiscoutPrice =
                                    int.parse((cartController
                                                .getCart
                                                .value
                                                .store![storeIndex]
                                                .totalDiscoutPrice!
                                                .toDouble() -
                                            double.parse(cartController
                                                .getCart
                                                .value
                                                .store![storeIndex]
                                                .items![productIndex]
                                                .discount!))
                                        .toString()
                                        .split('.')[0]);
                                cartController.getCart.value.store![storeIndex]
                                    .totalPrice = int.parse((cartController
                                            .getCart
                                            .value
                                            .store![storeIndex]
                                            .totalPrice!
                                            .toDouble() -
                                        double.parse(cartController
                                            .getCart
                                            .value
                                            .store![storeIndex]
                                            .items![productIndex]
                                            .price!))
                                    .toString()
                                    .split('.')[0]);
                                cartController.getCart.refresh();
                              }
                            } else {
                              printInfo(info: 're');
                              var call = await cartController
                                  .removeToCARTDIRECTLY(product.id!);
                              if (call) {
                                cartController
                                    .getCart.value.store![storeIndex].items!
                                    .remove(cartController
                                        .getCart
                                        .value
                                        .store![storeIndex]
                                        .items![productIndex]);
                                if (cartController.getCart.value
                                    .store![storeIndex].items!.isEmpty) {
                                  Get.back();
                                  cartController.fetchCart();
                                }
                                cartController.getCart.refresh();
                              }
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  LabelText(
                    text: product.name.toString().split('-')[1].trim(),
                  ),
                  SB.small(),
                  Row(
                    children: [
                      Text('\u{20B9} ${product.discount.toString()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        width: product.discount != null &&
                                product.discount != product.price
                            ? 5
                            : 0,
                      ),
                      product.discount != null &&
                              product.discount != product.price
                          ? Text('\u{20B9} ${product.price}',
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                              ))
                          : const SizedBox(),
                    ],
                  ),
                  // SB.medium(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          '${product.weight.toString()} ${product.unit.toString()}',
                          style:
                              const TextStyle(fontSize: ThemeConfig.labelSize),
                        ),
                      ),
                      Text(
                          '\u{20B9} ${(double.parse(product.discount!) * cartController.getCart.value.store![storeIndex].items![productIndex].quantity!).toString()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ))
                      // CounterWidget(product: product,),
                    ],
                  ),
                  SB.medium(),
                ],
              )),
        ),
      ]),
    );
  }
}

class addCounter extends StatefulWidget {
  const addCounter({Key? key}) : super(key: key);

  @override
  State<addCounter> createState() => _addCounterState();
}

class _addCounterState extends State<addCounter> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 30,
      decoration: BoxDecoration(
        color: num == 0 ? ThemeConfig.whiteColor : ThemeConfig.primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      // width: num == 0 ? 40 : 90,
      // width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          num != 0
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      if (num > 0) {
                        num--;
                      }
                    });
                  },
                  child: Container(
                      width: 45,
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.remove,
                        size: 20,
                      )))
              : Container(),
          num != 0
              ? Text(
                  num.toString(),
                  style: const TextStyle(fontSize: 13),
                )
              : Container(),
          num != 0
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      if (num > 0) {
                        num++;
                      }
                    });
                  },
                  child: Container(
                      width: 45,
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                      )))
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      num++;
                    });
                  },
                  child: const SizedBox(
                      width: 50,
                      child: Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                              color: ThemeConfig.secondaryColor, fontSize: 12),
                        ),
                      ))),
        ],
      ),
    );
  }
}

class MyAddressCard extends StatelessWidget {
  MyAddressCard({Key? key}) : super(key: key);
  MapAdressController mapAdressController = Get.find<MapAdressController>();
  openSheet() {
    print('tapped');
    Get.bottomSheet(
      Wrap(
        children: [
          Obx(
            () {
              if (mapAdressController.allAddress.value.success == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  // height: 500,
                  // width: 300,
                  padding: ThemeConfig.screenPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: ThemeConfig.screenPadding,
                        child: MainLabelText(
                          text: 'Select Address',
                          isBold: true,
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: mapAdressController
                            .allAddress.value.addressess!.length,
                        itemBuilder: (context, index) => AddressTile(
                          isSelected: index == 1,
                          address: mapAdressController
                              .allAddress.value.addressess![index],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          )
        ],
      ),
      backgroundColor: ThemeConfig.whiteColor,
      persistent: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ThemeConfig.radiusMin),
          topRight: Radius.circular(ThemeConfig.radiusMin),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Address address =
    //     mapAdressController.allAddress.value.addressess!.firstWhere(
    //   (element) => element.isDefault == true,
    // );
    return SizedBox(
      width: double.infinity,
      // color:Colors.red,
      child: Obx(() {
        if (mapAdressController.allAddress.value.success == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SB.large(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MainLabelText(
                    text: 'Delivery address',
                    isBold: true,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      openSheet();
                    },
                    child: const LabelText(
                      text: 'Select another address',
                      isSecondary: true,
                    ),
                  )
                ],
              ),
              // SB.medium(),
              const SizedBox(
                height: 15,
              ),

              Container(
                width: double.infinity,
                // padding: ThemeConfig.screenPadding,
                color: ThemeConfig.whiteColor,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelText(
                          text:
                              '${mapAdressController.selectedAddress.addressLine1}, ${mapAdressController.selectedAddress.addressLine2}',
                          isNormal: true,
                        ),
                        // LabelText(
                        //   text: 'Near Zundal circle,adalaj',
                        //   isNormal: true,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LabelText(
                              text:
                                  '${mapAdressController.selectedAddress.area}, ${mapAdressController.selectedAddress.state}',
                              isNormal: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SB.large(),
            ],
          );
        }
      }),
    );
  }
}

class PayOptionChips extends StatelessWidget {
  final String text;
  final String desc;
  final bool isSelected;
  final IconData icon;
  final Function ontap;
  const PayOptionChips({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.ontap,
    required this.desc,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => ontap(),
      child: Container(
        // decoration: BoxDecoration(
        // border: Border.all(color: ThemeConfig.secondaryColor, width: 1),
        //     borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                // child: LabelText(
                //   text: text,
                //   isWhite: isSelected ? true : false,
                // ),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ThemeConfig.whiteColor,
                  border: Border.all(
                      width: 1,
                      color: isSelected
                          ? ThemeConfig.secondaryColor
                          : ThemeConfig.whiteColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  icon,
                  color: isSelected
                      ? ThemeConfig.secondaryColor
                      : ThemeConfig.mainTextColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainLabelText(
                          text: text,
                          isBold: true,
                        ),
                        isSelected
                            ? const Icon(
                                Icons.check_circle_rounded,
                                color: ThemeConfig.secondaryColor,
                              )
                            : const SizedBox(),
                      ],
                    ),
                    SB.small(),
                    DescriptionText(
                      text: desc,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
