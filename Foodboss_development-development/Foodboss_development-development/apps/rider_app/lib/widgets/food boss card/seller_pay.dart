import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rider_app/config/theme_config.dart';
import 'package:rider_app/controller/UI%20controller/OrderController/seller_code_controller.dart';
import 'package:rider_app/models/order/pay_return_model.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:rider_app/widgets/product_list.dart';
import 'package:rider_app/widgets/text_widgets/heading_widget.dart';
import 'package:rider_app/widgets/text_widgets/title_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SellerPay extends StatelessWidget {
  final PayReturnOrders? payReturn;

  const SellerPay({Key? key, this.payReturn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SellerPayCodeController controller =
        Get.put(SellerPayCodeController(), permanent: false);
    openBottomSheet() {
      print(payReturn!.returnItem);
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
                      titleString: "All Returned Items",
                    ),
                  ],
                )),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: payReturn!.returnItems!.length,
                // itemCount: 3,

                itemBuilder: (BuildContext context, int index) {
                  var order = payReturn!.returnItems![index];
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [TitleText(titleString: 'Pay & Return')],
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Desc(descString: payReturn!.date!),
                      // Desc(descString: "  ${payReturn!.!}"),
                    ],
                  ),
                  //  Desc(
                  // descString: "Order ID: ${payReturn!.!}"),
                ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MainLabelText(titleString: payReturn!.shopName!),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // LabelText(titleString: "8549635248"),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () =>
                                launch("tel://${payReturn!.shopPhoneNumber!}"),
                            child: Desc(
                              descString: payReturn!.shopPhoneNumber!,
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
                                "Total Orders: ${payReturn!.totalOrder}"),
                        GestureDetector(
                          onTap: () {
                            openBottomSheet();
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Text(
                            'View All returned items',
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
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(
                            descString:
                                "Delivered Orders: ${payReturn!.deliveredOrder}"),
                        Desc(
                            descString:
                                "Returned Orders: ${payReturn!.returnedOrder}"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(
                            descString:
                                "Total Items: ${payReturn!.totalItems!}"),
                        Desc(
                            descString:
                                "Returned Items: ${payReturn!.returnItem!}"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelText(
                            titleString:
                                "Old Amount: \u{20B9}${payReturn!.amountCollectedOld!}"),
                        LabelText(
                            titleString:
                                "New Amount: \u{20B9}${payReturn!.amountCollectedNew!}"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelText(
                            titleString:
                                "Final COD amount: \u{20B9}${payReturn!.amountCollectedCodNew!}"),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      // width: ,
                      height: 100,
                      padding: const EdgeInsets.only(
                          bottom: 0, top: 20, left: 45, right: 45),
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
                  flex: 1,
                  child: PrimaryButton(
                    text: "Submit",
                    op: () {
                      controller.sendCodeRequest(payReturn!.shopId.toString());
                      // controller.sendCodeRequest(payReturn);
                      // Get.to(IndividualNewOrders(),
                      //     arguments: [
                      //       newOrders!.shopName!
                      //     ]);
                    },
                    type: "filled",
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class SellerPayReturn extends StatelessWidget {
  final PayReturnOrders? payReturn;

  const SellerPayReturn({Key? key, this.payReturn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SellerPayCodeController controller =
        Get.put(SellerPayCodeController(), permanent: false);
    openBottomSheet() {
      print(payReturn!.returnItem);
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
                      titleString: "All returned Items",
                    ),
                  ],
                )),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: payReturn!.returnItems!.length,
                // itemCount: 3,

                itemBuilder: (BuildContext context, int index) {
                  var order = payReturn!.returnItems![index];
                  return payReturn!.returnItems!.length == 0
                      ? Center(
                          child: LabelText(titleString: 'No returned Items'),
                        )
                      : ProductList(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [TitleText(titleString: 'Pay')],
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Desc(descString: payReturn!.date!),
                      // Desc(descString: "  02:45 AM"),
                    ],
                  ),
                  // const Desc(
                  //     descString: "Order ID: 84545"),
                ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MainLabelText(titleString: payReturn!.shopName!),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // LabelText(titleString: "8549635248"),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () =>
                                launch("tel://${payReturn!.shopPhoneNumber!}"),
                            child: Desc(
                              descString: payReturn!.shopPhoneNumber!,
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
                                "Total Orders: ${payReturn!.totalOrder}"),
                        LabelText(
                            titleString:
                                "Final COD Amount: \u{20B9}${payReturn!.amountCollectedCodNew!}")
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(
                            descString:
                                "Delivered Orders: ${payReturn!.deliveredOrder}"),
                        Desc(descString: "No returned Orders"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(
                            descString:
                                "Total Items: ${payReturn!.totalItems!}"),
                        LabelText(
                            titleString:
                                "Total Amount: \u{20B9}${payReturn!.amountCollectedNew}"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     ,
                    //   ],
                    // ),

                    const SizedBox(
                      height: 20,
                    ),
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
                  flex: 1,
                  child: PrimaryButton(
                    text: "Submit",
                    op: () {
                      controller.sendCodeRequest(payReturn!.shopId.toString());

                      // controller
                      // Get.to(IndividualNewOrders(),
                      //     arguments: [
                      //       newOrders!.shopName!
                      //     ]);
                    },
                    type: "filled",
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class OtpFormFields extends StatelessWidget {
  SellerPayCodeController controller = Get.find<SellerPayCodeController>();
  OtpFormFields({
    Key? key,
  }) : super(key: key);
  @override
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
