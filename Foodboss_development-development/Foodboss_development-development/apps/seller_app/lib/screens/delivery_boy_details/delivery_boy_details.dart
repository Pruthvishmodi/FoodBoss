import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/driver/driver_controller.dart';
import 'package:seller_app/models/driver/my_driver_model.dart';
import 'package:seller_app/widgets/Heading.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:seller_app/widgets/text_widgets/title_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryBoyDetails extends StatelessWidget {
  // final String name;
  // final String address;
  // final double phoneNumber;
  // final bool? canRemove;
  var args = Get.arguments;

  DeliveryBoyDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DriverController driverController = Get.find<DriverController>();

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
                          hintText: '\u{20B9} 0',
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
                      const Desc(descString: 'Trusted Driver ?'),
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
                        driverController.addNewDriver(id, context);
                        Navigator.pop(context);
                      },
                      text: 'Add',
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

    MyDriver? driver = args[1];
    print(driver);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        foregroundColor: ThemeConfig.WHITE_COLOR,
        elevation: 0,
        title: const Text(
          "Delivery Boy Details ",
          style: TextStyle(color: ThemeConfig.WHITE_COLOR),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.30,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                        ),
                        color: ThemeConfig.PRIMARY_COLOR),
                    // color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Hero(
                            tag: 'driver',
                            child: Container(
                              width: 150.0,
                              height: 230.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(driver!.hasMedia!
                                        ? driver.imagePath!.first.url.toString()
                                        : ThemeConfig.NOIMAGELINK)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              // padding: EdgeInsets.only(bottom: 40),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(
                                  //   height: 15,
                                  // ),
                                  MainLabelText(
                                      isWhite: true,
                                      titleString: driver.riderName!),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  GestureDetector(
                                    onTap: () =>
                                        launch("tel://${driver.phone!}"),
                                    child: Desc(
                                        isWhite: true,
                                        alignment: TextAlign.left,
                                        descString: '+91 ${driver.phone!}'),
                                  ),
                                  // SizedBox(
                                  //   height: 20,
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleText(titleString: 'Licence Details'),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            PageRouteBuilder(pageBuilder: (context, _, __) {
                          return GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              width: size.width,
                              height: size.height,
                              color: Colors.black.withOpacity(0.9),
                              child: Center(
                                child: Hero(
                                  tag: 'licence',
                                  child: Image(
                                    image: NetworkImage(
                                      driver.licenceImage.toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }));
                      },
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Hero(
                              tag: 'licence',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    ThemeConfig.BORDERRADIUS_MEDIUM),
                                child: Image(
                                    height: 100,
                                    width: 120,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        driver.licenceImage.toString())),
                              ),
                            ),
                            // Container(
                            //     width: 100.0,
                            //     height: 100.0,
                            //     decoration: const BoxDecoration(
                            //       borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            //       color: Colors.redAccent,
                            //     ),
                            //     child: const Image(
                            //       image: AssetImage('assets/images/profile_pic.jpg'),
                            //     )),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MainLabelText(
                                      titleString: 'Licence ID'),
                                  Desc(descString: '#${driver.licenceNumber}')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                                text:
                                    'Time Slot : ${driver.startDeliveryTimings} - ${driver.endDeliveryTimings}',
                                op: () {},
                                type: 'filled'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleText(titleString: 'More Details'),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: ThemeConfig.WHITE_COLOR),
                      // color: ThemeConfig.WHITE_COLOR,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              LabelText(titleString: 'Email'),
                              Desc(descString: 'Not Provided'),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Divider(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const LabelText(titleString: 'Vehical Number'),
                              Desc(
                                  descString:
                                      driver.vehicleNumber ?? 'DL 5S TP 2304'),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Divider(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const LabelText(titleString: 'Delivery Area'),
                              Desc(descString: driver.area ?? 'South Delhi'),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Divider(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const LabelText(titleString: 'Delivery Radius'),
                              Desc(
                                  descString: driver.deliveryRadious! < 1000
                                      ? '${driver.deliveryRadious} Meters'
                                      : '${(driver.deliveryRadious! / 1000)} Kilometers'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                                text: args[0] == true
                                    ? 'Add Delivery Boy'
                                    : 'Remove Delivery Boy',
                                op: () {
                                  print(args);

                                  if (args[0] == true) {
                                    openBottomSheet(
                                        context,
                                        driver.riderId.toString(),
                                        driver.riderName!);
                                  } else {
                                    driverController.removeDriver(
                                        driver.riderId.toString(), context);
                                    Navigator.pop(context);
                                  }
                                },
                                type: 'filled'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
