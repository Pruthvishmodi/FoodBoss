import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:seller_app/controller/business_controller/auth/login_controller.dart';
import 'package:seller_app/screens/login_screen/login_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController controllerAuth =
        Get.put(AuthController(), permanent: false);
    // return PageLayout(
    //   appBar: false,
    //   bottombar: false,
    //   backArrow: false,
    //   title: "Edit profile",
    //   selectedIndex: 0,
    //   color: Colors.transparent,
    //   appbarFunc: () {},
    //   child: const LoginScreenMain(),
    // );
    return WillPopScope(
      onWillPop: () async {
        print("called here");
        // if (FocusScope.of(context).hasFocus) {
        FocusScope.of(context).unfocus();
        controllerAuth.isFocus.value = false;
        return false;
        // } else {
        //   return true;
        // }
      },
      child: Scaffold(
        body: LoginScreenMain(),
      ),
    );
  }
}
