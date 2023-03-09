import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/screens/store_registration_screen/delivery.dart';
import 'package:shared_widgets/shared_widgets.dart';

class DeliverySchedulePage extends StatelessWidget {
  const DeliverySchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      Get.offAllNamed("/home");
      return true;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: ThemeConfig.WHITE_COLOR,
          title: Text(
            "Delivery Settings",
            style: TextStyle(color: ThemeConfig.WHITE_COLOR),
          ),
          elevation: 0,
          backgroundColor: ThemeConfig.PRIMARY_COLOR,
          leading: GestureDetector(
            onTap: () {
              Get.offAllNamed("/home");
            },
            child: Icon(
              Icons.arrow_back,
              color: ThemeConfig.WHITE_COLOR,
              size: 20,
            ),
          ),
        ),
        body: const Delivery(),
      ),
    );
  }
}
