import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/business_controller/auth/login_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CheckTokenController controllerAuth =
        Get.put(CheckTokenController(), permanent: false);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Foodboss-logo1.png',
              height: 150,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
