import 'package:flutter/material.dart';

import 'package:rider_app/widgets/app_navigation_bar.dart';
import 'package:rider_app/widgets/view%20customer%20details/view_customer_detail_card.dart';

class IndividualKhataUserDetails extends StatelessWidget {
  const IndividualKhataUserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.00),
        child: AppNavBar(
          color: Colors.transparent,
          title: Text("Jay Soni"),
        ),
      ),
      body: SingleChildScrollView(
        child: ViewCustomerDetials(),
      ),
    );
  }
}
