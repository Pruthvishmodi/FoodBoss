import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/store_registration/store_registration_controller.dart';
import 'package:seller_app/screens/profile_screen/profile_screen.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_image_picker.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/BodyContainer.dart';
import 'package:seller_app/widgets/CustomAppBar.dart';
import 'package:seller_app/widgets/CustomButton.dart';
import 'package:seller_app/widgets/RoundedSquareImageCard.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/TextFieldContainer.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/title_subtitle.dart';

class StoreRegistrationScreen extends StatelessWidget {
  const StoreRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    QrCodeSectionController qrCodeSectionController =
        Get.put(QrCodeSectionController(), permanent: false);
    var _state = States.INITIAL_STATE.obs;
    //  String get status => _state.value;

    Future<void> scanQR() async {
      print('here1');

      String barcodeScanRes;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        print('here');
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR);
        print(barcodeScanRes);
        if (barcodeScanRes.contains('@')) {
          qrCodeSectionController.onChangeQr(barcodeScanRes);
          _state.value = States.SUCCESS_STATE;
        } else {
          CustomSnackbar.errorSnackbar2('QR code invalid');
        }
        // launch(barcodeScanRes);
      } catch (e) {
        print(e);
      }
    }

    StoreRegistrationController controller =
        Get.put(StoreRegistrationController());
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
    
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          noElevation: true,
          title: 'Store Details',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleSubTitle(
                    title: "Step1",
                    subtitle:
                        "Enter your store details in order to register your store."),
                const SizedBox(
                  height: 20,
                ),
                SmallRoundedInputField(
                  hintText: 'Shop Name',
                  onChange: (val) {
                    controller.addShopName(val);
                  },
                ),
                const SizedBox(height: 15),
                const SizedBox(height: 15),
                const LabelText(titleString: "Shop Images"),
                const SizedBox(height: 10),

                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Obx(
                      () {
                        if (controller.store.value.shopImages.length <= 0) {
                          return GestureDetector(
                            onTap: () {
                              CustomImagePicker.pickAndCrop(
                                  controller.addShopImages);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                height: 200,
                                margin: const EdgeInsets.all(5),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: ThemeConfig.PRIMARY_COLOR),
                                  borderRadius: BorderRadius.circular(
                                      ThemeConfig.BORDERRADIUS_MEDIUM),
                                  color: ThemeConfig.WHITE_COLOR,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(
                                      Icons.upload,
                                      size: 50,
                                    ),
                                    LabelText(titleString: 'Store Image'),
                                  ],
                                )),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              CustomImagePicker.pickAndCrop(
                                  controller.addShopImages);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: ThemeConfig.PRIMARY_COLOR),
                                borderRadius: BorderRadius.circular(
                                    ThemeConfig.BORDERRADIUS_MEDIUM),
                                color: ThemeConfig.WHITE_COLOR,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    ThemeConfig.BORDERRADIUS_MEDIUM),
                                child: Image.file(
                                  controller.store.value.shopImages[0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    )),
                    Expanded(
                      child: Obx(
                        () {
                          if (controller.store.value.ownerImage == null) {
                            return GestureDetector(
                              onTap: () {
                                CustomImagePicker.pickAndCrop(
                                    controller.addOwnerImage);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 200,
                                  margin: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: ThemeConfig.PRIMARY_COLOR),
                                    borderRadius: BorderRadius.circular(
                                        ThemeConfig.BORDERRADIUS_MEDIUM),
                                    color: ThemeConfig.WHITE_COLOR,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Icon(
                                        Icons.upload,
                                        size: 50,
                                      ),
                                      LabelText(titleString: 'Owner Image'),
                                    ],
                                  )),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                CustomImagePicker.pickAndCrop(
                                    controller.addOwnerImage);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: ThemeConfig.PRIMARY_COLOR),
                                  borderRadius: BorderRadius.circular(
                                      ThemeConfig.BORDERRADIUS_MEDIUM),
                                  color: ThemeConfig.WHITE_COLOR,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      ThemeConfig.BORDERRADIUS_MEDIUM),
                                  child: Image.file(
                                    controller.store.value.ownerImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () {
                          if (controller.store.value.gst == null) {
                            return GestureDetector(
                              onTap: () {
                                CustomImagePicker.pickAndCrop(
                                    controller.addGstImages);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 200,
                                  margin: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: ThemeConfig.PRIMARY_COLOR),
                                    borderRadius: BorderRadius.circular(
                                        ThemeConfig.BORDERRADIUS_MEDIUM),
                                    color: ThemeConfig.WHITE_COLOR,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Icon(
                                        Icons.upload,
                                        size: 50,
                                      ),
                                      LabelText(titleString: 'GST Image'),
                                    ],
                                  )),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                CustomImagePicker.pickAndCrop(
                                    controller.addGstImages);
                              },
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: ThemeConfig.PRIMARY_COLOR),
                                  borderRadius: BorderRadius.circular(
                                      ThemeConfig.BORDERRADIUS_MEDIUM),
                                  color: ThemeConfig.WHITE_COLOR,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      ThemeConfig.BORDERRADIUS_MEDIUM),
                                  child: Image.file(
                                    controller.store.value.gst!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () {
                          if (controller.store.value.shopRegistration == null) {
                            return GestureDetector(
                              onTap: () {
                                CustomImagePicker.pickAndCrop(
                                    controller.addShopRegImages);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 200,
                                  margin: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: ThemeConfig.PRIMARY_COLOR),
                                    borderRadius: BorderRadius.circular(
                                        ThemeConfig.BORDERRADIUS_MEDIUM),
                                    color: ThemeConfig.WHITE_COLOR,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Icon(
                                        Icons.upload,
                                        size: 50,
                                      ),
                                      LabelText(
                                          titleString: 'Store Registration'),
                                    ],
                                  )),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                CustomImagePicker.pickAndCrop(
                                    controller.addShopRegImages);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: ThemeConfig.PRIMARY_COLOR),
                                  borderRadius: BorderRadius.circular(
                                      ThemeConfig.BORDERRADIUS_MEDIUM),
                                  color: ThemeConfig.WHITE_COLOR,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      ThemeConfig.BORDERRADIUS_MEDIUM),
                                  child: Image.file(
                                    controller.store.value.shopRegistration!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    // Expanded(
                    //   child: Obx(
                    //     () {
                    //       if (controller.store.value.qrCode == null) {
                    //         return GestureDetector(
                    //           onTap: () {
                    //             CustomImagePicker.pickAndCrop(
                    //                 controller.addQrImages);
                    //           },
                    //           child: Container(
                    //               padding: const EdgeInsets.all(5),
                    //               height: 200,
                    //               margin: const EdgeInsets.all(5),
                    //               width: double.infinity,
                    //               decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                     width: 1,
                    //                     color: ThemeConfig.PRIMARY_COLOR),
                    //                 borderRadius: BorderRadius.circular(
                    //                     ThemeConfig.BORDERRADIUS_MEDIUM),
                    //                 color: ThemeConfig.WHITE_COLOR,
                    //               ),
                    //               child: Column(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.spaceEvenly,
                    //                 children: const [
                    //                   Icon(
                    //                     Icons.upload,
                    //                     size: 50,
                    //                   ),
                    //                   LabelText(titleString: 'QR Code'),
                    //                 ],
                    //               )),
                    //         );
                    //       } else {
                    //         return GestureDetector(
                    //           onTap: () {
                    //             CustomImagePicker.pickAndCrop(
                    //                 controller.addQrImages);
                    //           },
                    //           child: Container(
                    //             height: 200,
                    //             width: double.infinity,
                    //             decoration: BoxDecoration(
                    //               border: Border.all(
                    //                   width: 1,
                    //                   color: ThemeConfig.PRIMARY_COLOR),
                    //               borderRadius: BorderRadius.circular(
                    //                   ThemeConfig.BORDERRADIUS_MEDIUM),
                    //               color: ThemeConfig.WHITE_COLOR,
                    //             ),
                    //             child: ClipRRect(
                    //               borderRadius: BorderRadius.circular(
                    //                   ThemeConfig.BORDERRADIUS_MEDIUM),
                    //               child: Image.file(
                    //                 controller.store.value.qrCode!,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //           ),
                    //         );
                    //       }
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                // const SizedBox(height: 15),
                // SmallRoundedInputField(
                //   hintText: 'Shop Registration',
                //   tailingIcon: Icons.upload,
                //   ontap: () {
                //     controller.addShopRegImages();
                //   },
                // ),
                // const SizedBox(height: 20),
                // SmallRoundedInputField(
                //   hintText: 'QR code (optional)',
                //   tailingIcon: Icons.upload,
                //   ontap: () {
                //     controller.addQrImages();
                //   },
                // ),
                // const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    await scanQR();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    // height: 200,
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: ThemeConfig.PRIMARY_COLOR),
                      borderRadius: BorderRadius.circular(
                          ThemeConfig.BORDERRADIUS_MEDIUM),
                      color: ThemeConfig.WHITE_COLOR,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const LabelText(titleString: 'QR Code'),
                              IconButton(
                                onPressed: () async {
                                  await scanQR();
                                },
                                icon: const Icon(
                                  Icons.qr_code_scanner_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(() {
                          if (_state.value == States.SUCCESS_STATE) {
                            controller.addQrNumber(
                                qrCodeSectionController.qrString.value);
                            print(qrCodeSectionController.qrString.value);
                            return ImageShower(
                                size: size,
                                url: qrCodeSectionController.qrString.value);
                          } else {
                            // return Text('dataa');
                            return Container();
                          }
                        }),
                        const Desc(
                          descString:
                              'This QR Code will be used by your delivery person to collect UPI Payments only',
                          alignment: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                // CheckboxListTile(
                //   value: agreed,
                //   checkColor: ThemeConfig.WHITE_COLOR,
                //   controlAffinity: ListTileControlAffinity.leading,
                //   activeColor: ThemeConfig.PRIMARY_COLOR,
                //   onChanged: (value) {
                //     setState(() {
                //       agreed = value!;
                //     });
                //   },
                //   title: const Text('Agree Terms and Condition*'),
                // ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/");
                  },
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        const TextSpan(
                            text: 'By clicking on next you agree with our',
                            style:
                                TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR)),
                        TextSpan(
                            text: ' Terms and Condition ',
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed('/terms',arguments: [true]);
                              }),
                        const TextSpan(
                            text: 'and',
                            style:
                                TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR)),
                        TextSpan(
                            text: ' Privacy Policy ',
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed('/privacy',arguments: [true]);
                              })
                      ])),
                  // child: const Desc(
                  //     alignment: TextAlign.center,
                  //     descString:
                  //         "By clicking on next you agree with our Terms of use and Privacy policy"),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Obx(() => controller.store.value.name == null ||
                          controller.store.value.name == "" ||
                          controller.store.value.shopImages.isEmpty ||
                          controller.store.value.ownerImage == null
                      ? DisabledButton(
                          text: 'Next',
                          op: () {
                            Get.snackbar(
                              'Details Missing',
                              'Please fill all details',
                              backgroundColor: ThemeConfig.WHITE_COLOR,
                            );
                            // print(controller.store.value.ownerImage);
                            // print()
                          },
                          type: 'outlined')
                      : PrimaryButton(
                          text: 'NEXT',
                          op: () {
                            if (controller.store.value.name != null &&
                                controller.store.value.shopImages.isNotEmpty &&
                                controller.store.value.ownerImage != null) {
                              Get.toNamed('/pick-location');
                            } else {
                              Get.snackbar(
                                'Details Missing',
                                'Please fill all details',
                                backgroundColor: ThemeConfig.WHITE_COLOR,
                              );
                            }
                          },
                          type: "filled",
                        )),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // SingleChildScrollView ShopImagesSection() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Container(
  //       padding: const EdgeInsets.all(5),
  //       child: Row(
  //         children: const [
  //           RoundedSquareImageCard(
  //             index: 0,
  //           ),
  //           RoundedSquareImageCard(
  //             index: 1,
  //           ),
  //           RoundedSquareImageCard(
  //             index: 2,
  //           ),
  //           RoundedSquareImageCard(
  //             index: 3,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

enum Option { yes, no }
