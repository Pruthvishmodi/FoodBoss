import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/login_controller.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Text%20widgets/heading_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/title_text.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  TextEditingController textEditingController = TextEditingController();
  Future _tryPasteCurrentPhone() async {
    if (!mounted) return;
    try {
      final autoFill = SmsAutoFill();
      final phone = await autoFill.hint;
      if (phone == null) return;
      if (!mounted) return;
      textEditingController.text =
          phone.split('').sublist(3).join('').toString();
      print(phone.split('').sublist(3).join('').toString());
      loginController.mobileNumber.value =
          phone.split('').sublist(3).join('').toString();
      loginController
          .onChangeNumber(phone.split('').sublist(3).join('').toString());
      loginController.mobileNumber.refresh();
    } on PlatformException catch (e) {
      print('Failed to get mobile number because of: ${e.message}');
    }
  }

  @override
  void initState() {
    // print(phoneNumber);
    // TODO: implement initState
    super.initState();
    Future<void>.delayed(
        const Duration(milliseconds: 300), _tryPasteCurrentPhone);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeConfig.whiteColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: ThemeConfig.screenPadding,
          width: size.width,
          child: Column(
            children: [
              Padding(
                padding: ThemeConfig.screenPadding,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleText(text: "login"),
                      SB.medium(),
                      const LabelText(
                          text:
                              "we will send you an sms with verification code on this number."),
                      SB.large(),
                      Row(
                        children: [
                          const HeadingText(text: "+91"),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: textEditingController,
                              // autofocus: true,
                              onChanged: (val) =>
                                  loginController.onChangeNumber(val),
                              onSaved: (val) => loginController.onLogin(),
                              onFieldSubmitted: (val) =>
                                  loginController.onLogin(),
                              cursorColor: ThemeConfig.secondaryColor,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 5),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "e n t e r    n u m b e r",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 213, 212, 212),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Spacer(),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'by continuing , you agree to our ',
                      style: const TextStyle(fontSize: 10, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'terms of service',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed('/legal');
                            },
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: ThemeConfig.primaryColor),
                        ),
                        const TextSpan(
                            text: ' &',
                            style:
                                TextStyle(fontSize: 10, color: Colors.black)),
                        TextSpan(
                            text: ' privacy policy',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: ThemeConfig.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed('/privacy');
                              }),
                      ],
                    ),
                  ),
                  SB.medium(),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: loginController.mobileNumber.value.length != 10
                          ? DisabledButton(
                              text: 'Login',
                              op: () {},
                              type: 'filled',
                            )
                          : DistructiveButton(
                              op: () {
                                loginController.onLogin();
                              },
                              text: 'Login',
                              type: 'filled',
                            ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
