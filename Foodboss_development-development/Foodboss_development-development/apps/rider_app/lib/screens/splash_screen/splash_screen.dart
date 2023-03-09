import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/widgets/title.dart';
import 'package:shared_widgets/shared_widgets.dart';

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
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        body: Container(
          height: MediaQuery.of(context).size.height,width:MediaQuery.of(context).size.width ,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.png'))),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/intro-01.png'),

              ],
            ),
          ),
        ),
      );
}
