import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/business_controller/auth/login_controller.dart';
import 'package:rider_app/ui_logic/login_to_otp.dart';
import 'package:rider_app/widgets/BodyContainer.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/distructive_text.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/title_subtitle.dart';

class AuthLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String type;
  final List<Widget> forms;
  static const String REGISTER_TYPE = "register";
  static const String LOGIN_TYPE = "login";
  static const String OTP_TYPE = "otp";
  AuthLayout(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.type,
      required this.forms})
      : super(key: key);

  AuthController controllerAuth = Get.put(AuthController(), permanent: false);
  ResendController resendController =
      Get.put(ResendController(), permanent: false);
  // bool _showBox = false;
  // void _startTimer() {
  //   // Disable the button after it has been pressed
  //   setState(() {
  //     _isButtonPressed = true;
  //   });

  //   Timer(Duration(seconds: 30), () {
  //     setState(() {
  //       _showBox = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final LoginController controller =
        Get.put(LoginController(), permanent: false);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BodyContainer(
        child: Container(
          height: size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: size.height * 0.03),
            TitleSubTitle(
              title: title,
              subtitle: subtitle,
            ),
            ...forms,
            // SizedBox(
            //   height: size.height * 0.2,
            // ),

            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LabelText(
                  titleString: type == AuthLayout.LOGIN_TYPE
                      ? "Don't have an account?"
                      : type == AuthLayout.REGISTER_TYPE
                          ? "Already have an account?"
                          : "Didn't recieve?",
                ),
                const SizedBox(width: 10),
                GestureDetector(
                    onTap: () {
                      type == AuthLayout.OTP_TYPE
                          ? Get.toNamed("/otpverify")
                          : type == AuthLayout.LOGIN_TYPE
                              ? Get.toNamed("/register")
                              : Get.toNamed("/login");
                    },
                    child: type == AuthLayout.LOGIN_TYPE
                        ? const DistructiveText(
                            titleString: 'Register',
                          )
                        : type == AuthLayout.REGISTER_TYPE
                            ? const DistructiveText(titleString: 'Login')
                            : Obx(() => GestureDetector(
                                    onTap: resendController.onPressed.value ==
                                            true
                                        ? () {
                                            resendController.changeOnpressed();
                                            type == AuthLayout.LOGIN_TYPE
                                                ? controllerAuth.login()
                                                : controllerAuth.register();
                                            // setState(() {
                                            //   onPressedValue = false;
                                            //   controllerAuth.login();
                                            // }

                                            // );
                                            Timer(const Duration(seconds: 30),
                                                () {
                                              resendController
                                                  .changeOnpressed();
                                            });
                                          }
                                        : null,
                                    child:
                                        resendController.onPressed.value == true
                                            ? DistructiveText(
                                                titleString: 'Resend',
                                              )
                                            : Desc(descString: 'Resend'))
                                //  ElevatedButton(
                                //     child: const Text('resend'),
                                //     onPressed: resendController
                                //                 .onPressed.value ==
                                //             true
                                //         ? () {
                                //             resendController.changeOnpressed();
                                //             controllerAuth.login();
                                //             // setState(() {
                                //             //   onPressedValue = false;
                                //             //   controllerAuth.login();
                                //             // }

                                //             // );
                                //             Timer(const Duration(seconds: 30),
                                //                 () {
                                //               resendController
                                //                   .changeOnpressed();
                                //             });
                                //           }
                                //         : null),
                                )),
              ],
            ),
            SizedBox(height: size.height * 0.03),
          ]),
        ),
      ),
    );
  }
}

class ResendController extends GetxController {
  var onPressed = true.obs;
  changeOnpressed() {
    onPressed.value = !onPressed.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
