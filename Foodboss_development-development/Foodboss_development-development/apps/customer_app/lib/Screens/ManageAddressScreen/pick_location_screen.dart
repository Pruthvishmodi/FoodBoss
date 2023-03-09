import 'dart:developer';

import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/UI%20Controllers/main_screen_ui_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/map_address_controller.dart';
import 'package:customer_app/Models/address_model.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Input/text_input_widget.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/components/appbar_widget.dart';
import 'package:customer_app/Widgets/components/square_chip.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocationScreen extends StatelessWidget {
  PickLocationScreen({Key? key}) : super(key: key);

  var args = Get.arguments;

  MainScreenController mainScreenController = Get.put(MainScreenController());
  @override
  Widget build(BuildContext context) {
    MapAdressController controller = Get.find<MapAdressController>();
    bool isFromUpdate = args[0];
    print(isFromUpdate);
    int id = args[1];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ThemeConfig.whiteColor,
      appBar: customAppBar('Pick Location'),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              color: ThemeConfig.greyColor,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: ThemeConfig.secondaryColorLite,
                    child: Obx(
                      () {
                        if (controller.loading.value == true) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return GoogleMap(
                            myLocationButtonEnabled: true,
                            initialCameraPosition: CameraPosition(
                              target: controller.center.value,
                              zoom: 19,
                            ),
                            onCameraMove: (val) {
                              controller.onCameraMove(val);
                            },
                            onCameraIdle: controller.getLocationstring,
                            // markers: controller.markers,
                            mapType: MapType.normal,
                            onMapCreated: controller.onMapCreated,
                            myLocationEnabled: true,
                            zoomControlsEnabled: true,
                            // onTap: controller.handleTap,
                          );
                        }
                      },
                    ),
                  ),
                  const Image(
                    image: AssetImage('assets/images/locationIcon.png'),
                    width: 30,
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: ThemeConfig.greyColor,
                  blurRadius: 3,
                  spreadRadius: 3,
                )
              ], color: ThemeConfig.whiteColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainLabelText(
                    text: 'select your delivery location',
                    isBold: true,
                  ),
                  const Divider(),
                  AreaWidget(controller: controller),
                  const Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: SecondaryButton(
                      op: () {
                        isFromUpdate
                            ? updateDetailsSheet(
                                context,
                                controller.allAddress.value.addressess!
                                    .firstWhere((element) => element.id == id),
                                controller)
                            : enterDetailsSheet(context, controller);
                      },
                      text: isFromUpdate
                          ? 'update location'
                          : 'confirm location and procced',
                      type: 'filled',
                    ),
                  ),
                ],
              ),
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }

  updateDetailsSheet(BuildContext context, Address address,
      MapAdressController mapAdressController) {
    TextEditingController textEditingController1 = TextEditingController();
    TextEditingController textEditingController2 = TextEditingController();
    TextEditingController textEditingController3 = TextEditingController();
    textEditingController1.text = address.addressLine1!;
    textEditingController2.text = address.addressLine2!;
    textEditingController3.text = address.fullName!;
    Get.bottomSheet(
        Wrap(
          children: [
            Container(
              color: ThemeConfig.whiteColor,
              padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SB.medium(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MainLabelText(
                          text: 'edit address details',
                          isBold: true,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.close))
                      ],
                    ),
                    SB.medium(),
                    const Divider(),
                    SB.medium(),
                    AreaWidget(controller: mapAdressController),
                    SB.medium(),
                    const Divider(),
                    SB.small(),
                    TextInputWidget(
                      hintText: 'Address Line 1',
                      controller: textEditingController1,
                      onChange: (val) {
                        address.addressLine1 = val;
                      },
                      // focus: true,
                      // onChange: (val),
                    ),
                    SB.medium(),
                    TextInputWidget(
                      hintText: 'Address Line 2',
                      controller: textEditingController2,
                      onChange: (val) {
                        address.addressLine2 = val;
                      },
                    ),
                    SB.medium(),
                    TextInputWidget(
                      hintText: 'recipient\'s name',
                      controller: textEditingController3,
                      onChange: (val) {
                        address.fullName = val;
                      },
                    ),
                    SB.medium(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LabelText(text: 'Set as Default'),
                        Obx(
                          () => Switch.adaptive(
                            value: mapAdressController
                                .allAddress.value.addressess!
                                .firstWhere(
                                    (element) => element.id == address.id)
                                .isDefault!,
                            onChanged: (val) {
                              mapAdressController.allAddress.value.addressess!
                                  .firstWhere(
                                      (element) => element.id == address.id)
                                  .isDefault = val;
                              mapAdressController.allAddress.refresh();
                            },
                          ),
                        ),
                      ],
                    ),
                    SB.large(),
                    SizedBox(
                        width: double.infinity,
                        child:
                            // (textEditingController1.isBlank!)
                            //     ?
                            DistructiveButton(
                                text: 'update address',
                                op: () {
                                  // print(controller.controllerText
                                  //     .value['add1']!.text);
                                  if (textEditingController1.isBlank!) {
                                    Get.snackbar(
                                        'Error', 'Please all the details');
                                  } else {
                                    mapAdressController.updateAddress(
                                        address, mainScreenController);
                                    Get.back();
                                    Get.back();
                                  }
                                },
                                type: 'filled')
                        // :
                        // SecondaryButton(
                        //     op: () {
                        //       // print(controller.controllerText
                        //       //     .value['add1']!.text);
                        //       // enterDetailsSheet(context);
                        //     },
                        //     text: 'save address and proceed',
                        //     type: 'filled',
                        //   ),
                        )
                  ],
                ),
              ),
            ),
          ],
        ),
        isScrollControlled: true);
  }
}

enterDetailsSheet(BuildContext context, MapAdressController controller) {
  Get.bottomSheet(
      Wrap(
        children: [
          Container(
            color: ThemeConfig.whiteColor,
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SB.medium(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MainLabelText(
                        text: 'enter address details',
                        isBold: true,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.close))
                    ],
                  ),
                  SB.medium(),
                  const Divider(),
                  SB.medium(),
                  AreaWidget(controller: controller),
                  SB.medium(),
                  const Divider(),
                  SB.small(),
                  TextInputWidget(
                    hintText: 'house no / flat no / floor / tower',
                    controller: controller.controllerText.value['add1'],
                    focus: true,
                    // onChange: (val),
                  ),
                  SB.medium(),
                  TextInputWidget(
                    hintText: 'street/ society / landmark',
                    controller: controller.controllerText.value['add2'],
                  ),
                  SB.medium(),
                  TextInputWidget(
                    hintText: 'recipient\'s name',
                    controller: controller.controllerText.value['recpname'],
                  ),
                  SB.large(),
                  const LabelText(
                      text: 'nickname of your address', isNormal: true),
                  SB.medium(),
                  Obx(
                    () => Row(children: [
                      SquareChip(
                        text: 'home',
                        isSelected: controller.nickname.value == Nickname.home,
                        ontap: () => controller.changeNickname(Nickname.home),
                      ),
                      SquareChip(
                        text: 'office',
                        ontap: () => controller.changeNickname(Nickname.office),
                        isSelected:
                            controller.nickname.value == Nickname.office,
                      ),
                      SquareChip(
                        text: 'other',
                        ontap: () => controller.changeNickname(Nickname.other),
                        isSelected: controller.nickname.value == Nickname.other,
                      ),
                    ]),
                  ),
                  Divider(),
                  SB.small(),
                  // Obx(
                  //   () {
                  //     return
                  SizedBox(
                      width: double.infinity,
                      child: DistructiveButton(
                          text: 'save address',
                          op: () {
                            if (controller
                                        .controllerText.value['add1']!.text ==
                                    '' ||
                                controller.controllerText.value['add2']!.text ==
                                    '' ||
                                controller.controllerText.value['recpname']!
                                        .text ==
                                    '') {
                              CustomSnackbar.errorSnackbar2(
                                  'Please fill all the details');
                            } else {
                              log('here');
                              controller.addAddress();
                            }
                          },
                          type: 'filled')
                      // : SecondaryButton(
                      //     op: () {
                      //       print(controller
                      //           .controllerText.value['add1']!.text);
                      //       // enterDetailsSheet(context);
                      //     },
                      //     text: 'save address and proceed',
                      //     type: 'filled',
                      //   ),
                      )
                  // },
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
      isScrollControlled: true);
}

class AreaWidget extends StatelessWidget {
  const AreaWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MapAdressController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 40,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(child: Obx(
          () {
            if (controller.loading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainLabelText(
                    text: controller.area == ''
                        ? controller.city == ''
                            ? controller.state
                            : controller.city
                        : controller.area,
                    isBold: true,
                  ),
                  LabelText(
                    text:
                        '${controller.city == '' ? '' : '${controller.city}, '}${controller.state}, ${controller.zip}, ${controller.country}',
                    isNormal: true,
                  )
                ],
              );
            }
          },
        ))
      ],
    );
  }
}
