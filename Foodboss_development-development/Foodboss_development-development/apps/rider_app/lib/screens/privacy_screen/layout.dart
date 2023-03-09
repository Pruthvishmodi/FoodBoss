import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/screens/my%20report%20screen/myreport_screen.dart';
import 'package:rider_app/screens/plan_history_screen/previous_plan.dart';
import 'package:rider_app/screens/privacy_screen/privacy_screen.dart';
import 'package:shared_widgets/shared_widgets.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Privacy Policy",
      bottombar: false,
      color: ThemeConfig.PRIMARY_COLOR,
      appBar: true,
      appbarFunc: () {
        // Get.toNamed("/deliveryboys/add");
      },
      child: const PrivacyScreen(),
    );
  }
}
