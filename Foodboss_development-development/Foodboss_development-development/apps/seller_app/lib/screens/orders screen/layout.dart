import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:seller_app/controller/business_controller/orders/orderlist_controller.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/screens/orders%20screen/orders.dart';

class OrderPage extends StatelessWidget {
  TabBar  _tabBar(OrderListController ctrl) => TabBar(
        padding: const EdgeInsets.all(5),
        isScrollable: true,
        labelColor: ThemeConfig.PRIMARY_COLOR,
        unselectedLabelColor: ThemeConfig.WHITE_COLOR,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MAX),
          color: ThemeConfig.WHITE_COLOR,
        ),
        tabs: ctrl.status.value.data!=null ? ctrl.status.value.data!.map((e) => Container(height: 40,alignment: Alignment.center, child: Text(e.status.toString()))).toList() : <Widget>[]
        //   Container(
        //       height: 40,
        //       child: const Center(
        //           child: Text(
        //         "Pending",
        //         // style: TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR),
        //       ))),
        //   const Text(
        //     "Packed",
        //     // style: TextStyle(color: ThemeConfig.WHITE_COLOR),
        //   ),
        //   const Text(
        //     "Shipped",
        //     // style: TextStyle(color: ThemeConfig.WHITE_COLOR),
        //   ),
        //   const Text(
        //     "Completed",
        //     // style: TextStyle(color: ThemeConfig.WHITE_COLOR),
        //   ),
        //   const Text(
        //     "Rider Payment & CRP",
        //     // style: TextStyle(color: ThemeConfig.WHITE_COLOR),
        //   ),
        // ]),
      );
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderListController ctrl = Get.find<OrderListController>();
    return Obx(()=>DefaultTabController(
        length: ctrl.status.value.data!=null?ctrl.status.value.data!.length:0,
        child: PageLayout(
          appBar: true,
          bottombar: false,
          backArrow: false,
          title: "Orders",
          tabBar: _tabBar(ctrl),
          selectedIndex: 0,
          color: ThemeConfig.PRIMARY_COLOR,
          appbarFunc: () {},
          child: const PendingOrders(),
        ),
      ),
    );
  }
}
