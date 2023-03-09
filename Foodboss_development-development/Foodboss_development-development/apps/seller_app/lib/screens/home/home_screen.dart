import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/screens/add_orders/add_orders.dart';
import 'package:seller_app/screens/add_orders/layout.dart';
import 'package:seller_app/screens/comming_soon.dart';
import 'package:seller_app/screens/dashboard_screen.dart';
import 'package:seller_app/screens/global_store_screen/global_store_screen.dart';
import 'package:seller_app/screens/my_store_screen/my_store_screen.dart';
import 'package:seller_app/screens/orders%20screen/layout.dart';
import 'package:seller_app/screens/plan_history_screen/layout.dart';
import 'package:seller_app/screens/privacy_screen/layout.dart';
import 'package:seller_app/screens/privacy_screen/privacy_screen.dart';
import 'package:seller_app/screens/profile_screen/layout.dart';
import 'package:seller_app/screens/scan_product_screen/scan_product_screen.dart';
import 'package:seller_app/ui_logic/sceen_controller.dart';
import 'package:seller_app/widgets/bottom_nav_bar.dart';

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
            children: const [
              DashBoardScreen(), 
              OrderPage(),
              MyStoreScreen(),
              PaymentScreen(),
              ProfilePage()
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.store_outlined),
        onPressed: () {
          controller.changeTabIndex(2);
        },
        foregroundColor: ThemeConfig.MAIN_TEXT_COLOR,
        backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavigationMenu(context, 0, controller),
    );
  }
}
