import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:rider_app/config/theme_config.dart';
import 'package:rider_app/controller/UI%20controller/OrderController/new_order_controller.dart';
import 'package:rider_app/controller/UI%20controller/OrderController/shipped_code_controller.dart';
import 'package:rider_app/models/order/shipped_order_model.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:rider_app/widgets/product_list.dart';
import 'package:rider_app/widgets/text_widgets/heading_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:url_launcher/url_launcher.dart';

class ShippedCard extends StatelessWidget {
  final ShippedOrders? progressOrders;
  ShippedCard({Key? key, this.progressOrders}) : super(key: key);
  NewOrderController newcontroller = Get.find<NewOrderController>();
  ShippedCodeController controller =
      Get.put(ShippedCodeController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    // controller.changeOrderId(progressOrders!.orderId.toString());
    // if (progressOrders!.paymentMethod == null ||
    //     progressOrders!.paymentMethod == '') {
    // } else {}
    // controller.changeType('COD');
    qrSheet() {
      print(progressOrders!.items!.length);
      // list = controllerGet.selectedItemList;
      Get.bottomSheet(Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                color: ThemeConfig.WHITE_COLOR),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const LabelText(titleString: 'QR Code'),
                      IconButton(
                        onPressed: () {
                          // await scanQR();
                          // isSelected = true;
                        },
                        icon: const Icon(
                          Icons.qr_code_scanner_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
                // Image.asset(
                //   'assets/images/qrCode.png',
                //   width: double.infinity,
                // ),

                // print(qrCodeSectionController.qrString.value);
                Container(
                  height: 300,
                  width: 300,
                  child: Column(
                    children: [
                      Expanded(
                        child: ImageShower(
                            size: MediaQuery.of(context).size,
                            url: progressOrders!.qrNumber!),
                      ),
                      LabelText(
                          titleString: progressOrders!.qrNumber!
                              .split('=')[1]
                              .split("&")[0])
                    ],
                  ),
                )

                // Obx(() => Column(
                //       children: [
                //         ImageShower(
                //             size: size, url: qrCodeSectionController.qrString.value),
                //         LabelText(
                //             titleString: qrCodeSectionController.qrString.value
                //                 .split('=')[1]
                //                 .split("&")[0])
                //       ],
                //     )),
              ],
            ),
          ),
        ],
      ));
    }

    openBottomSheet() {
      print(progressOrders!.items!.length);
      // list = controllerGet.selectedItemList;
      Get.bottomSheet(Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: ThemeConfig.WHITE_COLOR,
        ),
        padding: const EdgeInsets.only(bottom: 3, left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    HeadingText(
                      titleString: "Shipped Items",
                    ),
                  ],
                )),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: progressOrders!.items!.length,
                // itemCount: 3,

                itemBuilder: (BuildContext context, int index) {
                  var order = progressOrders!.items![index];
                  return ProductList(
                    img: order.media![0].url!,
                    name: "${order.name!.split('-')[1]}",
                    name1: "${order.name!.split('-')[0]}",
                    weight: '${order.weight!}',
                    price: '${order.price!}',
                    mass: '${order.quantity}',
                    unit: '${order.unit}',
                  );
                },
              ),
            ),
          ],
        ),
      ));
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.00),
        color: ThemeConfig.WHITE_COLOR,
      ),
      margin: const EdgeInsets.all(20.00),
      padding: const EdgeInsets.all(20.00),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Desc(descString: "Order Id: ${progressOrders!.orderId}"),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // DistructiveText(titleString: type),
                        Desc(descString: progressOrders!.date ?? "dfghjkl"),
                        Desc(
                            descString:
                                "  ${progressOrders!.time ?? "dfghjkl"}"),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    launch(
                        'https://www.google.com/maps/search/?api=1&query=${progressOrders!.latitude!},${progressOrders!.longitude}');
                  },
                  behavior: HitTestBehavior.translucent,
                  child: const Icon(
                    Icons.pin_drop,
                    color: Colors.red,
                    size: 30,
                  )),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainLabelText(
                                titleString: progressOrders!
                                        .customerDetails!.customerName ??
                                    "dfghjkl"),
                            const SizedBox(height: 5),
                            // LabelText(titleString: "8549635248"),

                            // const SizedBox(height: 5),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * .5),
                          child: Text(
                            progressOrders!.customerDetails!.customerAddress ??
                                "No address",
                            maxLines: 3,
                            style: TextStyle(
                              // decoration: TextDecoration.lineThrough,
                              color: ThemeConfig.MAIN_TEXT_COLOR,
                              fontSize: (ThemeConfig.LABEL_SIZE / 720.00) *
                                          MediaQuery.of(context).size.height >
                                      ThemeConfig.LABEL_SIZE
                                  ? (ThemeConfig.LABEL_SIZE / 720.00) *
                                      MediaQuery.of(context).size.height
                                  : ThemeConfig.LABEL_SIZE,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () => launch(
                                "tel://${progressOrders!.customerDetails!.customerNumber}"),
                            child: Desc(
                              descString: progressOrders!
                                      .customerDetails!.customerNumber ??
                                  "dfghjkl",
                              isSec: true,
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(
                            descString:
                                "Payment Type: ${progressOrders!.paymentMethod ?? "--"}"),
                        Desc(
                            descString:
                                "Total Items: ${progressOrders!.totalItems ?? "--"}"),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(
                            descString:
                                "Amount to collect: \u{20B9}${progressOrders!.amountToCollect ?? "--"}"),
                        GestureDetector(
                          onTap: () {
                            openBottomSheet();
                          },
                          child: Text(
                            'View all Items',
                            maxLines: 3,
                            style: TextStyle(
                              // decoration: TextDecoration.lineThrough,
                              color: ThemeConfig.PRIMARY_COLOR,
                              fontSize: (ThemeConfig.LABEL_SIZE / 720.00) *
                                          MediaQuery.of(context).size.height >
                                      ThemeConfig.LABEL_SIZE
                                  ? (ThemeConfig.LABEL_SIZE / 720.00) *
                                      MediaQuery.of(context).size.height
                                  : ThemeConfig.LABEL_SIZE,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    progressOrders!.paymentMethod == 'Khata'
                        ? Container()
                        : Obx(() {
                            if (newcontroller.shippedd.data!.progressOrders!
                                    .firstWhere((element) =>
                                        element.orderId ==
                                        progressOrders!.orderId)
                                    .isPod ==
                                true) {
                              return GestureDetector(
                                onTap: () {
                                  newcontroller.shippedd.data!.progressOrders!
                                      .firstWhere((element) =>
                                          element.orderId ==
                                          progressOrders!.orderId)
                                      .isPod = false;
                                  newcontroller.shipped.refresh();
                                },
                                behavior: HitTestBehavior.translucent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      child: Icon(
                                        Icons.done,
                                        size: 15,
                                        color: ThemeConfig.PRIMARY_COLOR,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color:
                                                  ThemeConfig.PRIMARY_COLOR)),
                                    ),
                                    Desc(descString: 'Mark as POD   '),
                                    // Checkbox(value: true, onChanged: (){}),
                                  ],
                                ),
                              );
                            } else {
                              // print(co)
                              return GestureDetector(
                                onTap: () {
                                  newcontroller.shippedd.data!.progressOrders!
                                      .firstWhere((element) =>
                                          element.orderId ==
                                          progressOrders!.orderId)
                                      .isPod = true;
                                  newcontroller.shipped.refresh();
                                },
                                behavior: HitTestBehavior.translucent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: ThemeConfig
                                                  .SECONDARY_TEXT_COLOR)),
                                    ),
                                    Desc(descString: 'Mark as POD   '),
                                    // Checkbox(value: true, onChanged: (){}),
                                  ],
                                ),
                              );
                            }
                          }),
                    Container(
                      width: double.infinity,
                      height: 100,
                      padding: const EdgeInsets.only(
                          bottom: 0, top: 20, left: 45, right: 45),
                      alignment: Alignment.center,
                      child: OtpFormFields(),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 3,
                  child: PrimaryButton(
                    text: "Submit",
                    op: () {
                      print(newcontroller.shippedd.data!.progressOrders!
                          .firstWhere((element) =>
                              element.orderId == progressOrders!.orderId)
                          .isPod);
                      controller.sendCodeRequest(
                          progressOrders!.orderId.toString(),
                          newcontroller.shippedd.data!.progressOrders!
                                      .firstWhere((element) =>
                                          element.orderId ==
                                          progressOrders!.orderId)
                                      .isPod ==
                                  true
                              ? 'POD'
                              : progressOrders!.paymentMethod!);

                      // Get.to(IndividualNewOrders(),
                      //     arguments: [newOrders!.shopName!]);
                    },
                    type: "filled",
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    qrSheet();
                  },
                  child: Container(
                    height: 40,
                    child: const Icon(Icons.qr_code),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ImageShower extends StatelessWidget {
  final String url;
  const ImageShower({
    Key? key,
    required this.size,
    required this.url,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Hero(
        tag: url,
        child: ClipRRect(
            borderRadius:
                BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
            child: QrImage(
              data: url,
              version: QrVersions.auto,
              // embeddedImage: const AssetImage(
              //   'assets/images/finalLogo.png',
              // ),
            )),
      ),
    );
  }
}

class QrCodeSectionController extends GetxController {
  // String st;
  // QrCodeSectionController(this.st);

  var qrString = ''.obs;

  onChangeQr(val) {
    qrString.value = val;
  }

  @override
  void onInit() {
    // print(qrString);
    // qrString.value = st;
    // TODO: implement onInit
    super.onInit();
  }
}

class OtpFormFields extends StatelessWidget {
  ShippedCodeController controller = Get.find<ShippedCodeController>();
  OtpFormFields({
    Key? key,
  }) : super(key: key);
  @override
  // late final ShippedCodeController textEditingController;
  Widget build(BuildContext context) {
    return PinCodeTextField(
      backgroundColor: Colors.transparent,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      showCursor: false,
      textStyle: const TextStyle(
          fontSize: 45,
          fontFamily: 'Digit',
          color: ThemeConfig.MAIN_TEXT_COLOR),
      hintCharacter: '8',
      hintStyle: TextStyle(
          fontSize: 45,
          fontFamily: 'Digit',
          color: Colors.grey.withOpacity(.2)),
      enablePinAutofill: true, keyboardType: TextInputType.number,
      length: 4,
      // obscureText: true,
      // obscuringCharacter: '*',
      // animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 70,
          fieldWidth: 60,
          activeFillColor: Colors.transparent,
          activeColor: Colors.transparent,
          selectedColor: Colors.transparent,
          inactiveColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          inactiveFillColor: Colors.transparent),
      // animationDuration: const Duration(milliseconds: 300),
      // backgroundColor: Colors.blue.shade50,
      enableActiveFill: true,
      // controller: textEditingController.textEditingController.value,
      onCompleted: (v) {
        print('aaaaa ${v}');
        controller.code.value = v;
        // controller.changeCode(v);

        // debugPrint("Completed");
      },
      onChanged: (value) {
        // textEditingController.addOtp(value.split('').reversed.join());
        // debugPrint(textEditingController.textEditingController.value.text);
        // textEditingController.changeOtp(value);
        // setState(() {
        //   currentText = value;
        // });
      },
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
}
