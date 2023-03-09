import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/customer/customer_controller.dart';
import 'package:seller_app/models/customer/add_customer_model.dart';
import 'package:seller_app/models/customer/all_customer_model.dart';
import 'package:seller_app/models/customer/my_customer_model.dart';
import 'package:seller_app/widgets/Heading.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class AllCustomerListCard extends StatelessWidget {
  CustomerController customerController = Get.find<CustomerController>();
  final AllCustomerData customerData;

  AllCustomerListCard({Key? key, required this.customerData}) : super(key: key);
  openBottomSheet(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    Get.bottomSheet(Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: ThemeConfig.WHITE_COLOR,
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Heading('Delivery Charge', ThemeConfig.MAIN_TEXT_COLOR),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: LabelText(titleString: 'Set Charges'),
                  ),
                  Expanded(
                      flex: 1,
                      child: SmallRoundedInputField(
                        hintText: '\u{20B9} 20',
                        controller: textEditingController,
                        textType: TextInputType.number,
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: PrimaryButton(
                  op: () {
                    print(textEditingController.text);
                    var customer = AddCustomerModel(
                        clientId: customerData.id.toString(),
                        isBlock: customerData.isUserBlocked.toString(),
                        deliveryCharge: textEditingController.text);

                    Navigator.of(context).pop();
                    customerController.addCustomer(customer, context);
                  },
                  text: 'ADD',
                  type: "filled",
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.00),
        color: ThemeConfig.WHITE_COLOR,
      ),
      margin: const EdgeInsets.only(
        top: 20.00,
      ),
      padding: const EdgeInsets.all(20.00),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    LabelText(titleString: 'Free Delivery'),
                    // Desc(descString: phone),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // LabelText(titleString: deliveryType),
                    const Desc(descString: "blocked"),
                    const SizedBox(
                      width: 5,
                    ),
                    Switch.adaptive(
                        activeColor: ThemeConfig.DISTRUCTIVE_COLOR,
                        inactiveThumbColor: ThemeConfig.DISTRUCTIVE_COLOR,
                        value: customerData.isUserBlocked! == '0',
                        onChanged: (newValue) {
                          // value = newValue;
                        }),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                  color: ThemeConfig.FORM_COLOR,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  customerData.name == ''
                      ? 'A'
                      : customerData.name!.split('')[0].toUpperCase(),
                  style: const TextStyle(
                      fontSize: 50, color: ThemeConfig.PRIMARY_COLOR),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainLabelText(titleString: customerData.name!),
                    Desc(descString: customerData.phone!),
                  ],
                ),
              ),
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
                  op: () {
                    openBottomSheet(context);
                  },
                  text: "SET CHARGES",
                  type: "filled",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyCustomerListCard extends StatelessWidget {
  // late TextEditingController textEditingController = TextEditingController();
  final int index;

  MyCustomerListCard({Key? key, required this.index}) : super(key: key);

  openBottomSheet(CustomerController customerController,
      CustomerData customerData, BuildContext context) {
    Get.bottomSheet(Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: ThemeConfig.WHITE_COLOR,
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Heading('Delivery Charge', ThemeConfig.MAIN_TEXT_COLOR),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 2,
                    child: LabelText(titleString: 'Set Charges'),
                  ),
                  Expanded(
                      flex: 1,
                      child: SmallRoundedInputField(
                          onChange: (val) => priceValue = val,
                          textType: TextInputType.number,
                          hintText: '\u{20B9} ${customerData.deliveryCharge}')),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: PrimaryButton(
                  op: () {
                    print(priceValue);
                    var customer = AddCustomerModel(
                        clientId: customerData.clientId.toString(),
                        isBlock: customerData.isBlock.toString(),
                        deliveryCharge: priceValue);

                    customerController.updateCustomer(
                      customer,
                    );
                    Get.back();
                  },
                  text: 'Save',
                  type: "filled",
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  late String priceValue;

  @override
  Widget build(BuildContext context) {
    CustomerController customerController = Get.find<CustomerController>();

    //  var customerData = customerController.myCustomerList[index];
    // bool switchValue = customerData.isBlock == 0 ? true : false;

    // toggleSwitchValue(){
    //  switchValue = !switchValue;
    // }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.00),
        color: ThemeConfig.WHITE_COLOR,
      ),
      margin: const EdgeInsets.only(
        top: 20.00,
      ),
      padding: const EdgeInsets.all(20.00),
      child: Column(
        children: [
          Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                          titleString: customerController
                                      .myCustomerList[index].deliveryCharge ==
                                  '0.00'
                              ? 'Free Delivery'
                              : customerController
                                  .myCustomerList[index].deliveryCharge!),
                      // Desc(descString: phone),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // LabelText(titleString: deliveryType),
                      Desc(
                          descString: customerController
                                      .myCustomerList[index].isBlock ==
                                  0
                              ? 'Unblocked'
                              : 'Blocked'),
                      const SizedBox(
                        width: 5,
                      ),
                      Switch.adaptive(
                          activeColor: ThemeConfig.DISTRUCTIVE_COLOR,
                          inactiveThumbColor: ThemeConfig.DISTRUCTIVE_COLOR,
                          value: customerController
                                      .myCustomerList[index].isBlock ==
                                  0
                              ? false
                              : true,
                          onChanged: (newValue) {
                            int i;
                            if (customerController
                                    .myCustomerList[index].isBlock ==
                                0) {
                              i = 1;
                            } else {
                              i = 0;
                            }
                            print(i);
                            var customer = AddCustomerModel(
                                clientId: customerController
                                    .myCustomerList[index].clientId
                                    .toString(),
                                isBlock: i.toString(),
                                deliveryCharge: customerController
                                    .myCustomerList[index].deliveryCharge);
                            customerController.updateCustomer(
                              customer,
                            );
                            customerController.myCustomerList[index].isBlock =
                                customerController
                                            .myCustomerList[index].isBlock ==
                                        0
                                    ? 1
                                    : 0;
                            customerController.myCustomerData.refresh();

                            // value = newValue;
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                  color: ThemeConfig.FORM_COLOR,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  customerController.myCustomerList[index].client!.name == ''
                      ? 'A'
                      : customerController.myCustomerList[index].client!.name!
                          .split('')[0]
                          .toUpperCase(),
                  style: const TextStyle(
                      fontSize: 50, color: ThemeConfig.PRIMARY_COLOR),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainLabelText(
                        titleString: customerController
                            .myCustomerList[index].client!.name!),
                    Desc(
                        descString: customerController
                            .myCustomerList[index].client!.phone!),
                  ],
                ),
              ),
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
                  op: () {
                    openBottomSheet(customerController,
                        customerController.myCustomerList[index], context);
                  },
                  text: "SET CHARGES",
                  type: "filled",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
