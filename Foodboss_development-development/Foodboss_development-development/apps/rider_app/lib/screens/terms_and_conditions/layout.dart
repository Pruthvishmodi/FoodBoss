import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/screens/terms_and_conditions/terms_and_conditions.dart';
import 'package:shared_widgets/shared_widgets.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Terms & Conditons", 
      bottombar: false,
      color: ThemeConfig.PRIMARY_COLOR,
      appBar: true,
      appbarFunc: () {
        // Get.toNamed("/deliveryboys/add");
      },
      child: const TermsAndConditions(),
    );
  }
}
