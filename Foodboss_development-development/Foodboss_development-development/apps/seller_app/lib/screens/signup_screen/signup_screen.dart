import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/business_controller/auth/login_controller.dart';
import 'package:seller_app/widgets/authlayout/authlayout.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/login_input_field.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';

List<Widget> list(AuthController controllerAuth, BuildContext context) {
  return [
    Container(
      // padding:
      // EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          const SizedBox(height: 25),
          // TextFieldContainer(
          //   color: ThemeConfig.FORM_COLOR,
          //   child: SmallRoundedInputField(
          //     onChange: (v) {
          //       controllerAuth.changeName(v);
          //     },
          //     textType: TextInputType.name,
          //     hintText: 'Name',
          //   ),
          // ),
          LoginInputField(
            text: 'Name',
            icon: Icons.person,
            onChange: (value) {
              controllerAuth.changeName(value);
            },
          ),
          const SizedBox(height: 20),
          // TextFieldContainer(
          //   color: ThemeConfig.FORM_COLOR,
          //   child: SmallRoundedInputField(
          //     controller: controller,
          //     onChange: (v) {},
          //     textType: TextInputType.name,
          //     hintText: 'Phone number',
          //   ),
          // ),
          IntlPhoneField(
            style: TextStyle(fontSize: 15),
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
          ),
          const SizedBox(height: 10),
          LoginInputField(
            text: 'Email (Optional)',
            icon: Icons.email,
            onChange: (value) {
              controllerAuth.changeEmail(value);
            },
          ),
          const SizedBox(height: 20),
          LoginInputField(
            isNumber: true,
            text: 'Referral Code (optional)',
            icon: Icons.money_outlined,
            onChange: (value) {
              controllerAuth.changeReffer(value);
            },
          ),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.toNamed('/videos', arguments: [true]);
                  },
                  child: const Desc(descString: 'Need Help ?')),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Obx(
                () => Expanded(
                  child: controllerAuth.phone.length == 10 &&
                          controllerAuth.name.isEmpty == false
                      ? PrimaryButton(
                          text: "Register",
                          op: () {
                            if (controllerAuth.phone.length == 10) {
                              controllerAuth.register();
                            }
                          },
                          type: "filled")
                      : DisabledButton(
                          text: "Register", op: () {}, type: "outlined"),
                ),
              ),
            ],
          ),
        ],
      ),
    )
  ];
}

class RegisterScreenMain extends StatelessWidget {
  const RegisterScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController controllerAuth =
        Get.put(AuthController(), permanent: false);
    return AuthLayout(
      title: "Welcome",
      subtitle: "Enter your details here",
      type: AuthLayout.REGISTER_TYPE,
      forms: list(controllerAuth, context),
    );
  }
}

// class SignupPage extends StatefulWidget {
//   SignupPage({Key? key}) : super(key: key);

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   bool value = false;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: BodyContainer(
//         child: Container(
//           height: size.height,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 30),
//               const Heading('Welcome!', ThemeConfig.MAIN_TEXT_COLOR),
//               const SizedBox(height: 15),
//               const SubText(
//                   text: 'Please enter your account here',
//                   color: ThemeConfig.MAIN_TEXT_COLOR,
//                   size: ThemeConfig.SUB_TITLE_SIZE),
//               const SizedBox(height: 15),
//               const TextFieldContainer(
//                   color: ThemeConfig.FORM_COLOR,
//                   child: SmallRoundedInputField(
//                     hintText: 'First Name',
//                   )),
//               const SizedBox(height: 15),
//               const TextFieldContainer(
//                   color: ThemeConfig.FORM_COLOR,
//                   child: SmallRoundedInputField(
//                     hintText: 'Last Name',
//                   )),
//               const SizedBox(height: 15),
//               const TextFieldContainer(
//                   color: ThemeConfig.FORM_COLOR,
//                   child: SmallRoundedInputField(
//                     hintText: 'Phone number',
//                   )),
//               const SizedBox(height: 15),
//               const TextFieldContainer(
//                   color: ThemeConfig.FORM_COLOR,
//                   child: SmallRoundedInputField(
//                     hintText: 'Email Address (Optional)',
//                   )),
//               const SizedBox(height: 15),
//               const TextFieldContainer(
//                   color: ThemeConfig.FORM_COLOR,
//                   child: SmallRoundedInputField(
//                     hintText: 'Referral Code (Optional)',
//                   )),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                       onTap: () {},
//                       child: Row(
//                         children: [
//                           Checkbox(
//                               value: value,
//                               activeColor: ThemeConfig.PRIMARY_COLOR,
//                               onChanged: (value) {
//                                 setState(() {
//                                   this.value = value!;
//                                 });
//                               }),
//                           const Text('Agree Terms & Conditions* ',
//                               style: TextStyle(
//                                 color: ThemeConfig.MAIN_TEXT_COLOR,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Poppins',
//                                 fontSize: ThemeConfig.SUB_TITLE_SIZE,
//                               )),
//                         ],
//                       )),
//                 ],
//               ),
//               SizedBox(height: size.height * 0.03),
//               const CustomButton(
//                 'Signup',
//                 ThemeConfig.PRIMARY_COLOR,
//                 pageRoute: '/otpverify',
//               ),
//               const SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SubText(
//                       text: 'Already have account? ',
//                       color: ThemeConfig.MAIN_TEXT_COLOR,
//                       size: ThemeConfig.SUB_TITLE_SIZE),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Get.toNamed('/login');
//                     },
//                     child: const Text(
//                       'Login',
//                       style: TextStyle(
//                           color: ThemeConfig.DISTRUCTIVE_COLOR,
//                           fontSize: ThemeConfig.SUB_TITLE_SIZE,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.bold),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height: size.height * 0.03),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
