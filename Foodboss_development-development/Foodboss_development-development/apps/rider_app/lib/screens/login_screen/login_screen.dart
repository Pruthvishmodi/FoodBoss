import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rider_app/controller/business_controller/auth/login_controller.dart';
import 'package:rider_app/widgets/authlayout/authlayout.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:shared_widgets/shared_widgets.dart';

List<Widget> getList(Size size, AuthController controllerAuth) => [
      SizedBox(
        height: size.height * 0.2,
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: const [
      //     LabelText(titleString: "Phone Number"),
      //   ],
      // ),
      IntlPhoneField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            labelText: 'Phone Number',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
              borderSide: BorderSide(),
            )),
        keyboardType: TextInputType.number,
        initialCountryCode: 'IN',
        onChanged: (phone) {
          controllerAuth.changeNumber(phone.number);
        },
      ),

      // const TextFieldContainer(
      //   color: ThemeConfig.FORM_COLOR,
      //   child: RoundedInputField(
      //     hintText: 'Enter Phone number',
      //     icon: Icons.phone_android_outlined,
      //   ),
      // ),
      SizedBox(
        height: size.height * 0.2,
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
                  : DisabledButton(text: "Login", op: () {}, type: "outlined"),
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
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Desc(
            descString: 'Need Help ?',
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
              onTap: () {
                Get.toNamed('/videos');
              },
              child: Desc(descString: 'Videos'))
        ],
      ),
    ];

class LoginScreenMain extends StatelessWidget {
  const LoginScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController controllerAuth =
        Get.put(AuthController(), permanent: false);
    // final Controller controllerAuth =
    //     Get.put(LoginController(), permanent: false);
    Size size = MediaQuery.of(context).size;
    return AuthLayout(
      title: "Welcome Back",
      subtitle: "Enter your account details here.",
      type: AuthLayout.LOGIN_TYPE,
      forms: getList(size, controllerAuth),
    );
  }
}
