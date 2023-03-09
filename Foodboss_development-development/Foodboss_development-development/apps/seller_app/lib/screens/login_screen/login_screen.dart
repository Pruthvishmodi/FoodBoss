import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:seller_app/widgets/text_widgets/distructive_text.dart';
import 'package:seller_app/widgets/text_widgets/title_subtitle.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/business_controller/auth/login_controller.dart';
import 'package:seller_app/ui_logic/login_to_otp.dart';
import 'package:seller_app/widgets/RoundedInputField.dart';
import 'package:seller_app/widgets/TextFieldContainer.dart';
import 'package:seller_app/widgets/authlayout/authlayout.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';

List<Widget> getList(
    Size size, AuthController controllerAuth, BuildContext context) {
  return [
    Obx(
      () => Container(
        // padding:
        //     EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: const [
            //     LabelText(titleString: "Phone Number"),
            //   ],
            // ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                controllerAuth.isFocus.value = false;
              },
              child: IntlPhoneField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(ThemeConfig.BORDERRADIUS_MAX),
                      borderSide: const BorderSide(),
                    )),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  controllerAuth.changeNumber(phone.number, context);
                },
                onTap: () {
                  controllerAuth.isFocus.value = true;
                },
                onSubmitted: (_) {
                  controllerAuth.isFocus.value = false;
                },
                // onSaved: (_) {
                //   controllerAuth.isFocus.value = false;
                // },
              ),
            ),

            // const TextFieldContainer(
            //   color: ThemeConfig.FORM_COLOR,
            //   child: RoundedInputField(
            //     hintText: 'Enter Phone number',
            //     icon: Icons.phone_android_outlined,
            //   ),
            // ),
            SizedBox(
              height: controllerAuth.isFocus.value
                  ? size.height * 0.07
                  : size.height * 0.2,
            ),
            // SizedBox(height: 20),

            Row(
              children: [
                Obx(
                  () => Expanded(
                    child: controllerAuth.phone.length == 10
                        ? PrimaryButton(
                            text: "Login",
                            op: () {
                              if (controllerAuth.phone.length == 10) {
                                controllerAuth.login();
                              }
                              // controllerAuth.changeType(true);
                              // Get.toNamed("/otpverify");
                            },
                            type: "filled")
                        : DisabledButton(
                            text: "Login", op: () {}, type: "outlined"),
                  ),
                ),
                // Expanded(
                //   child: PrimaryButton(
                //       text: "Login",
                //       op: () {
                //         // if (controllerAuth.phone.length == 10) {
                //         //   controllerAuth.login();
                //         // }
                //         // controllerAuth.changeType(true);
                //         Get.toNamed("/otpverify");
                //       },
                //       type: "filled"),
                //   // : DisabledButton(text: "Login", op: () {}, type: "filled"),
                // ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/videos', arguments: [true]);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Desc(
                    descString: 'Need Help ?',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Desc(descString: 'Videos')
                ],
              ),
            ),
          ],
        ),
      ),
    )
  ];
}

class LoginScreenMain extends StatelessWidget {
  const LoginScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    final AuthController controllerAuth = Get.find<AuthController>();
    // final Controller controllerAuth =
    //     Get.put(LoginController(), permanent: false);
    Size size = MediaQuery.of(context).size;
    // return AuthLayout(
    //   title: "Welcome Back",
    //   subtitle: "Enter your account details here.",
    //   type: AuthLayout.LOGIN_TYPE,
    //   forms: getList(size, controllerAuth, context),
    // );
    return GestureDetector(
      onTap: () {
        print("object here");
        controllerAuth.isFocus.value = false;
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Container(
          color: ThemeConfig.FORM_COLOR,
          height: size.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              const Center(
                child: TitleSubTitle(
                  title: "Welcome Back",
                  subtitle: "Enter your account details here.",
                ),
              ),
              Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: controllerAuth.isFocus.value
                      ? size.height * 0.04
                      : size.height * 0.2,
                ),
              ),
              IntlPhoneField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                      borderSide: const BorderSide(),
                    )),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  controllerAuth.changeNumber(phone.number, context);
                },
                onTap: () {
                  controllerAuth.isFocus.value = true;
                },
                onSaved: (_) {
                  print(FocusScope.of(context).isFirstFocus);
                  print(FocusScope.of(context).isFirstFocus);
                  controllerAuth.isFocus.value = false;
                },
                onSubmitted: (_) {
                  print(FocusScope.of(context).isFirstFocus);
                  controllerAuth.isFocus.value = false;
                },
              ),
              Obx(
                () => controllerAuth.isFocus.value
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: controllerAuth.isFocus.value
                            ? size.height * 0.04
                            : size.height * 0.2,
                      )
                    : const Spacer(
                        flex: 1,
                      ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(() =>controllerAuth.phone.length == 10 ? PrimaryButton(
                        text: "Login",
                        op: () {
                          controllerAuth.login();
                        },
                        type: "filled",
                      ) : DisabledButton(text: 'Login', op: (){}, type: 'outlined'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Desc(descString: "Don't have an account?"),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/register");
                    },
                    child: const DistructiveText(
                      titleString: 'Register',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        // Get.toNamed('/videos');
                      },
                      child: const Desc(descString: 'Need Help ?')),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/videos",arguments: [true]);
                    },
                    child: const DistructiveText(
                      titleString: 'Watch Videos',
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 10),
              // Spacer(
              //   flex: 1,
              // ),
              // Expanded(
              //   child: SizedBox(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
