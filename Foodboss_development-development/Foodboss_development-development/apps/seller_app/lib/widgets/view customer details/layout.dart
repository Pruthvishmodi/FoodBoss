import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/app_navigation_bar.dart';
import 'package:seller_app/widgets/view%20customer%20details/view_customer_detail_card.dart';

class KhataRequestPage extends StatelessWidget {
  var args = Get.arguments;
  KhataRequestPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int index = args[0];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.00),
        child: AppBar(
          foregroundColor: ThemeConfig.WHITE_COLOR,
          backgroundColor: ThemeConfig.PRIMARY_COLOR,
          title: Text("Khata Request"),
        ),
      ),
      body: SingleChildScrollView(
          child: ViewCustomerDetials(
        index: index,
      )),
    );
  }
}
