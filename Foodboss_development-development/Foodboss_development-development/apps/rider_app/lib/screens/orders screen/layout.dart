import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/screens/orders%20screen/orders.dart';
import 'package:shared_widgets/shared_widgets.dart';

class OrderPage extends StatelessWidget {
  var args = Get.arguments;
  TabBar get _tabBar => TabBar(
        padding: const EdgeInsets.all(5),
        isScrollable: true,
        labelColor: ThemeConfig.MAIN_TEXT_COLOR,
        unselectedLabelColor: ThemeConfig.WHITE_COLOR,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: ThemeConfig.WHITE_COLOR),
        tabs: [
          Container(height: 40, child: const Center(child: Text("New Orders"))),
          const Text(
            "Shipped",
            // style: TextStyle(color: ThemeConfig.WHITE_COLOR),
          ),
          const Text(
            "Seller Payment & Return",
            // style: TextStyle(color: ThemeConfig.WHITE_COLOR),
          ),
          const Text(
            "Completed",
            // style: TextStyle(color: ThemeConfig.WHITE_COLOR),
          ),
          // const Text(
          //   "cancelled",
          //   // style: TextStyle(color: ThemeConfig.WHITE_COLOR),
          // ),

          // const Text(
          //   "CRP",
          //   // style: TextStyle(color: ThemeConfig.WHITE_COLOR),
          // ),
        ],
      );
  OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int? index = int.parse(args[0]);
    // print(index);

    return DefaultTabController(
      length: 4,
      child: PageLayout(
        appBar: true,
        bottombar: false,
        backArrow: false,
        title: "Orders",
        tabBar: _tabBar,
        // selectedIndex: index ?? 0,
        color: ThemeConfig.PRIMARY_COLOR,
        appbarFunc: () {},
        child: const PendingOrders(),
      ),
    );
  }
}
