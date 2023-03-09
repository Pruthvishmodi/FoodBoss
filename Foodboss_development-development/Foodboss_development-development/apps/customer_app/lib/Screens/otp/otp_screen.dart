import 'dart:developer';

import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/login_controller.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/heading_text.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late OTPTextEditController controller;

  @override
  void initState() {
    // TODO: implement initState
    OTPInteractor()
        .getAppSignature()
        .then((value) => print('signature - $value'));
    controller = OTPTextEditController(
      codeLength: 4,
      onCodeReceive: (code) {
        int index = 0;
        print('Your Application receive code - $code');
        loginController.onChangeOtp(code);
        textEditingController.text = code;
        if (code.length == 4) {
          FocusScope.of(context).unfocus();
        }
        // addOtp(code);
      },
    )..startListenRetriever(
        (code) {
          final exp = RegExp(r'(\d{4})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        // strategies: [
        //   // SampleStrategy(),
        // ],
      );
    super.initState();
    // _listOPT();
  }

  _listOPT() async {
    await SmsAutoFill().listenForCode;
    print(SmsAutoFill().code.toString());
    var code = SmsAutoFill().code;
  }

  LoginController loginController = Get.find<LoginController>();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ThemeConfig.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeConfig.whiteColor,
        foregroundColor: ThemeConfig.mainTextColor,
      ),
      body: Container(
        width: size.width,
        height: size.height - 100,
        // padding: EdgeInsets.all(10),
        padding: EdgeInsets.only(
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            left: 10,
            right: 10),
        child: Column(
          children: [
            Container(
              padding: ThemeConfig.screenPadding,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SB.large(),
                    const HeadingText(text: 'verification code'),
                    SB.medium(),
                    DescriptionText(
                        text:
                            'We\'ve sent a verification code to + 91 ${loginController.mobileNumber.value}'),
                    SB.large(),
                    TextFormField(
                      controller: controller,
                      // autofocus: true,
                      onChanged: (val) => loginController.onChangeOtp(val),
                      onSaved: (val) => loginController.onVerifyOtp(),
                      cursorColor: ThemeConfig.secondaryColor,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "e n t e r    c o d e",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 213, 212, 212),
                            ),
                      ),
                    ),
                    //        Container(
                    //   child:  PinFieldAutoFill(
                    //     decoration: UnderlineDecoration(
                    //       textStyle: TextStyle(fontSize: 20, color: Colors.black),
                    //       colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
                    //     ),
                    //    codeLength: 4,
                    //     onCodeSubmitted: (code) {},
                    //     onCodeChanged: (code) {
                    //       if (code!.length == 6) {
                    //         FocusScope.of(context).requestFocus(FocusNode());
                    //       }
                    //     },
                    //   ),
                    // )
                  ]),
            ),
            Expanded(child: Container()),
            Column(
              children: [
                Row(
                  children: [
                    DescriptionText(text: ' didn\'t receive code '),
                    GestureDetector(
                      onTap: () => loginController.onLogin(),
                      child: DescriptionText(
                        text: 'resent verification code >',
                        color: ThemeConfig.secondaryColor,
                      ),
                    ),
                  ],
                ),
                SB.medium(),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    child: loginController.otp.value.length != 4
                        ? DisabledButton(
                            text: 'Login',
                            op: () {},
                            type: 'filled',
                          )
                        : DistructiveButton(
                            text: 'Verify',
                            op: () {
                              log(" aiufaoie  verify ${loginController.userController.user.value.isLogedin.toString()}");
                              if (loginController
                                      .userController.user.value.isLogedin ==
                                  true) {
                                loginController.mapAdressController.getloc();
                                Get.toNamed('/pick-location-screen',
                                    arguments: [false, 0]);
                              } else {
                                loginController.onVerifyOtp();
                              }
                            },
                            type: 'filled',
                          ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
