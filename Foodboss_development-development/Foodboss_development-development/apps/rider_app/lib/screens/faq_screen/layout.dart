import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/controller/business_controller/faq_category_controller.dart';
import 'package:rider_app/screens/faq_screen/faq_screen.dart';
import 'package:rider_app/utils/states.dart';
import 'package:shared_widgets/shared_widgets.dart';

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
