import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/driver/driver_controller.dart';
import 'package:seller_app/models/driver/add_driver_model.dart';
import 'package:seller_app/models/driver/my_driver_model.dart';
import 'package:seller_app/widgets/Heading.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryCard extends StatelessWidget {
  DriverController driverController =
      Get.put(DriverController(), permanent: false);
  final MyDriver driver;
  final bool? canAdd;
  DeliveryCard({
    Key? key,
    required this.driver,
    this.canAdd,
  }) : super(key: key);

  openBottomSheet(BuildContext context, String id, String name) {
    driverController.driverPrice.value = '0';
    Get.bottomSheet(Wrap(
      children: [
        Container(
          // height: 400,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: ThemeConfig.WHITE_COLOR,
          ),
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Heading('Delivery Charge', ThemeConfig.MAIN_TEXT_COLOR),
                const SizedBox(
                  height: 10,
                ),
                MainLabelText(titleString: name),
                const SizedBox(
                  height: 5,
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
                        tailingIcon: Icons.currency_rupee,
                        hintText: '0',
                        onChange: (val) =>
                            driverController.driverPrice.value = val,
                        textType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LabelText(titleString: 'Trusted Driver ?'),
                    Switch.adaptive(
                      value: driverController.trustedDriver.value,
                      onChanged: (val) {
                        driverController.trustedDriver.value =
                            !driverController.trustedDriver.value;
                      },
                      activeColor: ThemeConfig.PRIMARY_COLOR,
                    ),
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
                      Get.back();
                      driverController.addNewDriver(id, context);
                    },
                    text: 'Save',
                    type: "filled",
                  ),
                ),
              ],
            ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(
                        titleString: driver.startDeliveryTimings == null
                            ? 'Time Slot : Not provided'
                            : 'Time Slot : ${driver.startDeliveryTimings} - ${driver.endDeliveryTimings}'), // time
                    // Row(
                    //   children: [
                    //     const Desc(descString: 'Trusted'),
                    //     Switch.adaptive(
                    //       value: switchValue,
                    //       onChanged: (val) {},
                    //       activeColor: ThemeConfig.PRIMARY_COLOR,
                    //     ),
                    //   ],
                    // )
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
                child: Image(
                  image: NetworkImage(driver.hasMedia == true
                      ? driver.imagePath!.first.icon!
                      : 'https://icon-library.com/images/no-picture-available-icon/no-picture-available-icon-1.jpg'),
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainLabelText(
                        titleString: driver.riderName == ''
                            ? 'User'
                            : driver.riderName!),
                    GestureDetector(
                      onTap: () => launch("tel://${driver.phone!}"),
                      child: Desc(descString: '+91 ${driver.phone!}'),
                    ),
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
                    openBottomSheet(
                        context, driver.riderId.toString(), driver.riderName!);
                  },
                  text: canAdd == true ? 'Add' : "SET CHARGES",
                  type: "filled",
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  flex: 1,
                  child: PrimaryButton(
                    text: "DETAILS",
                    op: () {
                      Get.toNamed('/deliveryboy-detail',
                          arguments: [canAdd, driver]);
                    },
                    type: "outlined",
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class MyDeliveryCard extends StatelessWidget {
  DriverController driverController = Get.find<DriverController>();
  final MyDriver driver;
  final bool? canAdd;
  MyDeliveryCard({
    Key? key,
    required this.driver,
    this.canAdd,
  }) : super(key: key);

  openBottomSheet(BuildContext context, String id, String name, bool isTrusted,
      String deliveryCharge) {
    driverController.trustedDriver.value = isTrusted;
    bool switchValue = false;
    String priceValue = '';
    Get.bottomSheet(Wrap(
      children: [
        Container(
          // height: 400,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: ThemeConfig.WHITE_COLOR,
          ),
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Heading('Delivery Charge', ThemeConfig.MAIN_TEXT_COLOR),
                const SizedBox(
                  height: 20,
                ),
                MainLabelText(titleString: name == '' ? 'User' : name),
                const SizedBox(
                  height: 20,
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
                        hintText: '\u{20B9} $deliveryCharge',
                        onChange: (val) =>
                            driverController.driverPrice.value = val,
                        textType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LabelText(titleString: 'Trusted Driver ?'),
                    Switch.adaptive(
                      value: driverController.trustedDriver.value,
                      onChanged: (val) {
                        driverController.trustedDriver.value =
                            !driverController.trustedDriver.value;
                      },
                      activeColor: ThemeConfig.PRIMARY_COLOR,
                    ),
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
                      Get.back();
                      driverController.updateDriver(id, context);
                    },
                    text: 'Save',
                    type: "filled",
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    // print(driver.deliveryCharge);
    // print(driver.riderName);
    // print(driver.isTrusted);
    // print(driver.phone);
    // print(driver.riderId);

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(
                        titleString: driver.deliveryCharge == null
                            ? 'Error'
                            : driver.deliveryCharge == '0.00' ||
                                    driver.deliveryCharge == '0'
                                ? 'Free Delivery'
                                : '\u{20B9} ${driver.deliveryCharge!}'), // time
                    Row(
                      children: [
                        Desc(
                            descString: driver.isTrusted ?? driver.isTrusted!
                                ? 'Trusted'
                                : 'Not Trusted'),
                        Switch.adaptive(
                          value: driver.isTrusted ?? false,
                          onChanged: (val) {
                            driverController.toggleDriverTrust(
                                AddDriverRequestModel(
                                    charges: driver.deliveryCharge,
                                    isTrusted:
                                        driver.isTrusted == true ? '0' : '1',
                                    riderId: driver.riderId.toString()),
                                context);
                          },
                          activeColor: ThemeConfig.PRIMARY_COLOR,
                        ),
                      ],
                    )
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
                child: Image(
                  image: NetworkImage(driver.hasMedia!
                      ? driver.imagePath!.first.icon.toString()
                      : 'https://icon-library.com/images/no-picture-available-icon/no-picture-available-icon-1.jpg'),
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainLabelText(
                        titleString: driver.riderName == ''
                            ? "User"
                            : driver.riderName.toString()),
                    GestureDetector(
                      onTap: () => launch("tel://${driver.phone.toString()}"),
                      child: Desc(descString: driver.phone!),
                    ),
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
                    openBottomSheet(
                        context,
                        driver.riderId.toString(),
                        driver.riderName!,
                        driver.isTrusted!,
                        driver.deliveryCharge!);
                  },
                  text: canAdd == true ? 'Add' : "SET CHARGES",
                  type: "filled",
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  flex: 1,
                  child: PrimaryButton(
                    text: "DETAILS",
                    op: () {
                      Get.toNamed('/deliveryboy-detail',
                          arguments: [canAdd, driver]);
                    },
                    type: "outlined",
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
