import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/business_controller/faq_category_controller.dart';
import 'package:seller_app/screens/faq_screen/faq_screen.dart';
import 'package:seller_app/utils/states.dart';

class FaqPage extends StatelessWidget {
  FaqCategoryController controller =
      Get.put(FaqCategoryController(), permanent: false);

  FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "FAQs",
      bottombar: false,
      color: ThemeConfig.PRIMARY_COLOR,
      appBar: true,
      appbarFunc: () {
        Get.toNamed("/deliveryboys/add");
      },
      child: const FaqScreen(),
    );
  }
}
