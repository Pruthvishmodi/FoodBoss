// ignore_for_file: prefer_const_constructorsimport 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/business_controller/add_profile_controller.dart';

import 'package:rider_app/widgets/BodyContainer.dart';
import 'package:rider_app/widgets/CustomAppBar.dart';
import 'package:rider_app/widgets/CustomButton.dart';
import 'package:rider_app/widgets/RoundedSquareImageCard.dart';
import 'package:rider_app/widgets/SmallRoundedInputField.dart';
import 'package:rider_app/widgets/TextFieldContainer.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/title_subtitle.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class StoreRegistrationScreen extends StatelessWidget {
  StoreRegistrationScreen({Key? key}) : super(key: key);
  static late TextEditingController textEditingController;
  AddProfileController addProfileController =
      Get.put(AddProfileController(), permanent: false);

  bool value = false;

  bool agreed = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Option? option = Option.yes;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(50),
      //   child: CustomAppBar(
      //     title: 'Driver Details',
      //     noElevation: true,
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: size.height * 0.1),
              const TitleSubTitle(
                  title: "Driver Details",
                  subtitle:
                      "Enter your personal details in order to register for driver."),
              // const SizedBox(
              //   height: 20,
              // ),
              // const SmallRoundedInputField(
              //   hintText: 'Shop Name',
              // ),
              SizedBox(height: size.height * 0.05),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  LabelText(titleString: "Driver Images*"),
                  LabelText(titleString: "Driving License*"),
                ],
              ),

              SizedBox(height: size.height * 0.03),

              ShopImagesSection(),
              SizedBox(height: size.height * 0.01),

              SmallRoundedInputField(
                // textType: TextInputType.number,
                hintText: 'Vehicle Number', 
                onChange: (val) {
                  addProfileController.addVehicleNo(val);
                },
              ),
              SizedBox(height: size.height * 0.01),

              SmallRoundedInputField(
                hintText: 'Driving License Number',
                onChange: (value) {
                  addProfileController.addLicenceNo(value);
                },
              ),
              // const SizedBox(height: 15),
              // const SmallRoundedInputField(
              //   hintText: 'Shop Registration',
              //   tailingIcon: Icons.upload,
              // ),
              // const SizedBox(height: 20),
              // const SmallRoundedInputField(
              //   hintText: 'QR code (optional)',
              //   tailingIcon: Icons.upload,
              // ),
              SizedBox(height: size.height * 0.2),

              //const SizedBox(height: 20),
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
                          style: TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR)),
                      TextSpan(
                          text: ' Terms and Condition ',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed('/terms', arguments: [true]);
                            }),
                      const TextSpan(
                          text: '&',
                          style: TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR)),
                      TextSpan(
                          text: ' Privacy Policy ',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed('/privacy', arguments: [true]);
                            })
                    ])),
                // child: const Desc(
                //     alignment: TextAlign.center,
                //     descString:
                //         "By clicking on next you agree with our Terms of use and Privacy policy"),
              ),
              SizedBox(height: size.height * 0.03),

              SizedBox(height: size.height * 0.03),

              Container(
                width: MediaQuery.of(context).size.width,
                child: PrimaryButton(
                  text: 'NEXT',
                  op: () {
                    Get.toNamed('/pick-location');
                  },
                  type: "filled",
                ),
// =======
// // <<<<<<< banner
// //                   child: RichText(
// //                       textAlign: TextAlign.center,
// //                       text: TextSpan(children: [
// //                         const TextSpan(
// //                             text: 'By clicking on next you agree with our',
// //                             style:
// //                                 TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR)),
// //                         TextSpan(
// //                             text: ' Terms and Condition ',
// //                             style: const TextStyle(color: Colors.blue),
// //                             recognizer: TapGestureRecognizer()
// //                               ..onTap = () {
// //                                 Get.toNamed('/privacy', arguments: [true]);
// //                               }),
// //                         const TextSpan(
// //                             text: '&',
// //                             style:
// //                                 TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR)),
// //                         TextSpan(
// //                             text: ' Privacy Policy ',
// //                             style: const TextStyle(color: Colors.blue),
// //                             recognizer: TapGestureRecognizer()
// //                               ..onTap = () {
// //                                 Get.toNamed('/privacy', arguments: [true]);
// //                               })
// //                       ])),
// //                   // child: const Desc(
// //                   //     alignment: TextAlign.center,
// //                   //     descString:
// //                   //         "By clicking on next you agree with our Terms of use and Privacy policy"),
// // =======
//                   type: "filled",
// // >>>>>>> development
// >>>>>>> development
//                 ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Container ShopImagesSection() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  addProfileController.addDriverImages();
                },
                child: Container(
                  margin: const EdgeInsets.all(3),
                  height: 150,
                  width: double.infinity,
                  child: addProfileController.store.value.driverImage == null
                      ? const Icon(Icons.add)
                      : Image.file(
                          addProfileController.store.value.driverImage!),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
                    color: ThemeConfig.FORM_COLOR,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  addProfileController.addLicenceImage();
                },
                child: Container(
                  margin: const EdgeInsets.all(3),
                  height: 150,
                  width: double.infinity,
                  child: addProfileController.store.value.licence == null
                      ? const Icon(Icons.add)
                      : Image.file(addProfileController.store.value.licence!),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
                    color: ThemeConfig.FORM_COLOR,
                  ),
                ),
              ),
            ),
            // RoundedSquareImageCard(),
            // RoundedSquareImageCard(),
          ],
        ),
      ),
    );
  }
}

enum Option { yes, no }
