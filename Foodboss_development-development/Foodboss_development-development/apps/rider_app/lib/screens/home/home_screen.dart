import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/screens/delivery_boy_details/delivery_boy_details.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/screens/add_orders/add_orders.dart';
import 'package:rider_app/screens/add_orders/layout.dart';
import 'package:rider_app/screens/comming_soon.dart';
import 'package:rider_app/screens/dashboard_screen.dart';
import 'package:rider_app/screens/global_store_screen/global_store_screen.dart';
import 'package:rider_app/screens/my_store_screen/my_store_screen.dart';
import 'package:rider_app/screens/orders%20screen/layout.dart';
import 'package:rider_app/screens/plan_history_screen/layout.dart';
import 'package:rider_app/screens/privacy_screen/layout.dart';
import 'package:rider_app/screens/privacy_screen/privacy_screen.dart';
import 'package:rider_app/screens/profile_screen/layout.dart';
import 'package:rider_app/screens/scan_product_screen/scan_product_screen.dart';
import 'package:rider_app/ui_logic/sceen_controller.dart';
import 'package:rider_app/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  final LandingPageController controller =
      Get.put(LandingPageController(), permanent: false);
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // body:
      body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              DashBoardScreen(),
              OrderPage(),
              // MyStoreScreen(),
              PaymentScreen(),
              DeliveryBoyDetails()
            ],
          )),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.store_outlined),
      //   onPressed: () {
      //     controller.changeTabIndex(2);
      //   },
      //   foregroundColor: ThemeConfig.MAIN_TEXT_COLOR,
      //   backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavigationMenu(context, 0, controller),
    );
  }
}
