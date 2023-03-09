import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/auth/profile_controller.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/business_controller/auth/login_controller.dart';
import 'package:seller_app/widgets/title.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// final  ProfileController profileController = Get.put(ProfileController(),permanent: true);

// final SnackBarController snackbarController = Get.put(SnackBarController(context),permanent: true);

    final CheckTokenController controllerAuth =
        Get.put(CheckTokenController(), permanent: false);
    return Scaffold(
      backgroundColor: ThemeConfig.WHITE_COLOR,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
        // color: ThemeConfig.WHITE_COLOR,
          image: DecorationImage(image: AssetImage('assets/images/background.png'),fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Foodboss-logo1.png',
              height: 150,
              width: 150,
            ),
            // SizedBox(height: 50),
            // const TitleWidget(
            //   titleString: 'Food Boss',
            // ),
          ],
        ),
      ),
    );
  }
}
