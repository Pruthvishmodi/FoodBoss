import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/screens/customer_details/customer_details.dart';
import 'package:rider_app/screens/my%20report%20screen/myreport_screen.dart';
import 'package:shared_widgets/shared_widgets.dart';

class MyCustomerDetails extends StatelessWidget {
  const MyCustomerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "My Customer",
      bottombar: false,
      color: ThemeConfig.PRIMARY_COLOR,
      appBar: true,
      appbarFunc: () {
        
      },
      child: const CustomerDetails(),
    );
  }
}
