import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.whiteColor,
      body: Center(
        child: Container(
          child: Image.asset(
            "assets/images/cow.gif",
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
