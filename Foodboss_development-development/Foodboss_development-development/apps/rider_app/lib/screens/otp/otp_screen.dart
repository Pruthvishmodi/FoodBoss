import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/business_controller/auth/login_controller.dart';
import 'package:rider_app/controller/business_controller/auth/otp_controller.dart';
import 'package:rider_app/screens/home/home_screen.dart';
import 'package:rider_app/screens/otp/otp_form.dart';
import 'package:rider_app/widgets/authlayout/authlayout.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/otp_form.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:shared_widgets/Config/theme_config.dart';

List<Widget> getList(Size size, OtpController controllerAuth) => [
      SizedBox(
        height: size.height * 0.2,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: OtpFormFields(
          textEditingController: controllerAuth,
        ),
      ),

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: const [
      //     OtpForm(
      //       index: 1,
      //     ),
      //     OtpForm(
      //       index: 2,
      //     ),
      //     OtpForm(
      //       index: 3,
      //     ),
      //     OtpForm(
      //       index: 4,
      //     ),
      //   ],
      // ),
      SizedBox(
        height: size.height * 0.2,
      ),
      Row(
        children: [
          Obx(
            () => Expanded(
              child: controllerAuth.phone.length == 10 &&
                      controllerAuth.finalOttp.length == 4
                  // controllerAuth.otp1.length == 1 &&
                  // controllerAuth.otp2.length == 1 &&
                  // controllerAuth.otp3.length == 1 &&
                  // controllerAuth.otp4.length == 1
                  ? PrimaryButton(
                      text: "VERIFY",
                      op: () {
                        if (controllerAuth.phone.length == 10) {
                          controllerAuth.otpverify();
                        }
                      },
                      type: "filled")
                  : DisabledButton(text: "VERIFY", op: () {}, type: "outlined"),
            ),
          ),
          // Expanded(
          //     child: PrimaryButton(
          //         text: "Verify",
          //         op: () {
          //           // if (controllerAuth.phone.length == 10) {
          //           //   controllerAuth.otpverify();
          //           // }
          //           Get.toNamed('/home');
          //         },
          //         type: "filled")
          //     // : DisabledButton(text: "Verify", op: () {}, type: "filled"),
          //     ),
        ],
      ),
    ];

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpController controller = Get.put(OtpController(), permanent: false);
    return AuthLayout(
      title: "OTP Verification",
      subtitle: "Please enter otp sent to your phone number",
      type: AuthLayout.OTP_TYPE,
      forms: getList(MediaQuery.of(context).size, controller),
    );
  }
}


// class OtpScreen extends StatefulWidget {
//   const OtpScreen({Key? key}) : super(key: key);

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   late OTPTextEditController controller;
//     final AuthController controllerAuth =
//         Get.put(AuthController(), permanent: false);

//   @override
//   void initState() {
 
//    OTPInteractor().getAppSignature()
//       .then((value) => print('signature - $value'));
//   controller = OTPTextEditController(
//     codeLength: 4,
//     onCodeReceive: (code) {
//       int index = 0;
//       print('Your Application receive code - $code');
//      controllerAuth.addOtp(code);
      
//     },
//   )..startListenUserConsent(
//       (code) {
//         final exp = RegExp(r'(\d{4})');
//         return exp.stringMatch(code ?? '') ?? '';
//       },
//       strategies: [
//         // SampleStrategy(),
//       ],
//     );

//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final AuthController controllerAuth =
//         Get.put(AuthController(), permanent: false);
//     Size size = MediaQuery.of(context).size;
//     return AuthLayout(
//       title: "OTP Verification",
//       subtitle: "Please enter otp sent to your phone number",
//       type: AuthLayout.OTP_TYPE,
//       forms: getList(size,controllerAuth ),
//     );
//   }
// }
