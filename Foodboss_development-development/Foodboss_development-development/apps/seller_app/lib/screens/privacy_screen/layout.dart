import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/screens/my%20report%20screen/myreport_screen.dart';
import 'package:seller_app/screens/plan_history_screen/previous_plan.dart';
import 'package:seller_app/screens/privacy_screen/privacy_screen.dart';

class PrivacyPolicyScreen extends StatelessWidget {
   PrivacyPolicyScreen({Key? key}) : super(key: key);
  
  var data = Get.arguments;

  late  bool fromLogin;


  @override
  Widget build(BuildContext context) {
    if(data != null){
       fromLogin = data[0];
    }
    return PageLayout(
      title: "Privacy Policy", 
      bottombar: false,
      color: ThemeConfig.PRIMARY_COLOR,
      appBar: fromLogin ? false :true,
      appbarFunc: () {
        // Get.toNamed("/deliveryboys/add");
      },
      child: const PrivacyScreen(),
    );
  }
}
