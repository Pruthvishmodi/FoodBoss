import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/screens/add_customer/add_customer.dart';
import 'package:rider_app/widgets/Heading.dart';
import 'package:rider_app/widgets/SmallRoundedInputField.dart';
import 'package:rider_app/widgets/TextFieldContainer.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/food%20boss%20card/food_boss_card.dart';
import 'package:rider_app/widgets/form_input.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/distructive_text.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 550),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.01),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.01,
                      ),
                      child: const SmallRoundedInputField(
                        hintText: "Search",
                        tailingIcon: Icons.search,
                        textType: TextInputType.name,
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: size.height * 0.01,
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           PrimaryButton(text: 'Unblock', op: () {}, type: ''),
                    //           const SizedBox(
                    //             width: 10,
                    //           ),
                    //           PrimaryButton(
                    //             text: 'Block',
                    //             op: () {},
                    //             type: '',
                    //           ),
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                    const CustomerListCard(
                      deliveryType: 'Free Delivery',
                      name: 'Suraj Barot',
                      number: '+91 8252632589',
                    ),
                    const CustomerListCard(
                      deliveryType: 'Free Delivery',
                      name: 'Suraj Barot',
                      number: '+91 8252632589',
                    ),
                    const CustomerListCard(
                      deliveryType: 'Free Delivery',
                      name: 'Suraj Barot',
                      number: '+91 8252632589',
                    ),
                    const CustomerListCard(
                      deliveryType: 'Free Delivery',
                      name: 'Suraj Barot',
                      number: '+91 8252632589',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {Get.to(AddCustomer());},
          backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
          child: Icon(
            Icons.add,
            color: ThemeConfig.MAIN_TEXT_COLOR,
            

          ),
        ));
  }
}

class CustomerListCard extends StatelessWidget {
  final String name;
  final String number;
  final String deliveryType;

  const CustomerListCard({
    Key? key,
    required this.name,
    required this.number,
    required this.deliveryType,
  }) : super(key: key);
  openBottomSheet() {
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
                children: const [
                  Expanded(
                    flex: 2,
                    child: LabelText(titleString: 'Set Charges'),
                  ),
                  Expanded(
                      flex: 1,
                      child: SmallRoundedInputField(hintText: '\u{20B9}20')),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: PrimaryButton(
                  op: () {},
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
                  children: [
                    LabelText(titleString: deliveryType),
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
                        value: true,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.00),
                  color: ThemeConfig.FORM_COLOR,
                ),
                padding: const EdgeInsets.all(10),
                child: const Image(
                  image: AssetImage("assets/images/profile_pic.jpg"),
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainLabelText(titleString: name),
                    Desc(descString: number),
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
                    openBottomSheet();
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
