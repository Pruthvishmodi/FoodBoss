import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/screens/terms_and_conditions/terms_and_conditions.dart';

class Terms extends StatelessWidget {
   Terms({Key? key}) : super(key: key);

  var data = Get.arguments;

  late  bool fromLogin;

  @override
  Widget build(BuildContext context) {
     if(data != null){
       fromLogin = data[0];
    }
    return PageLayout(
      title: "Terms & Conditons", 
      bottombar: false,
      color: ThemeConfig.PRIMARY_COLOR,
      appBar: fromLogin ? false :true,
      appbarFunc: () {
        // Get.toNamed("/deliveryboys/add");
      },
      child: const TermsAndConditions(),
    );
  }
}
