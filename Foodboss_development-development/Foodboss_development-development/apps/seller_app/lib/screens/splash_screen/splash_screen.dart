import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/title.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();


    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed('/home'),
    );
  }

  @override
  Widget build(BuildContext context) =>  Scaffold(
    backgroundColor: ThemeConfig.PRIMARY_COLOR,
        body: Center(
          child: Column(
            children: [
              Image.asset('assets/images/intro-01.png'),
              // const   TitleWidget(
              //   titleString: 'Food Boss',
              // ),
            ],
          ),
        ),
      );
}
