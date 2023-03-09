import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:seller_app/screens/my%20report%20screen/myreport_screen.dart';
import 'package:seller_app/screens/plan_history_screen/previous_plan.dart';

class PlanHistory extends StatelessWidget {
  const PlanHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Plan History",
      bottombar: false,
      color: Colors.transparent,
      appBar: true,
      
      appbarFunc: () {
       // Get.toNamed("/deliveryboys/add");
      },
      child: const PreviousPlan(),
    );
  }
}
