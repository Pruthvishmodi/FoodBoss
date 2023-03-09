import 'package:flutter/material.dart';
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/screens/add_orders/add_orders.dart';
import 'package:shared_widgets/shared_widgets.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "My Earnings",
      bottombar: false,
      color: ThemeConfig.PRIMARY_COLOR,
      appBar: true,
      appbarFunc: () {
        // Get.toNamed("/deliveryboys/add");
      },
      child: const AddOrdersScreen(),
    );
  }
}
