import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/screens/my_delivery_boy_screen/my_delivery_boys_screen.dart';
import 'package:shared_widgets/shared_widgets.dart';

class MyDeliveryBoyPage extends StatelessWidget {
  const MyDeliveryBoyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Rider Management",
      bottombar: true,
      color: ThemeConfig.PRIMARY_COLOR,
      appBar: true,
      appbarFunc: () {
        Get.toNamed("/deliveryboys/add");
      },
      child:  MyDeliveryBoyScreen(),
    );
  }
}
