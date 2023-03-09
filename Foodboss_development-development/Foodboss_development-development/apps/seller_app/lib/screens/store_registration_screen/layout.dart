import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:seller_app/screens/store_registration_screen/delivery.dart';
import 'package:shared_widgets/Config/theme_config.dart';


class DeliverySchedulePage extends StatelessWidget {
  const DeliverySchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Delivery Settings",
      bottombar: false,
      color: ThemeConfig.PRIMARY_COLOR,
      appBar: true,
      appbarFunc: () {
        Get.toNamed("/deliveryboys/add");
      },
      child: const Delivery(),
    );
  }
}
