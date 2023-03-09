import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/ui_logic/sceen_controller.dart';
import 'package:rider_app/widgets/bottom_nav_text.dart';

// Widget buildBottomNavigationMenu(
//     context, int selectedIndex, LandingPageController controller) {
//   return Obx(() => BottomNavigationBar(
//         showUnselectedLabels: false,
//         showSelectedLabels: true,
//         selectedLabelStyle: TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR),
//         selectedItemColor: ThemeConfig.MAIN_TEXT_COLOR,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: controller.tabIndex.value,
//         onTap: (index) => controller.changeTabIndex(index),
//         items: [
//           buildBottomItems(Icons.home, "home"),
//           buildBottomItems(Icons.list_alt_outlined, "orders"),
//           buildBottomItems(Icons.money_off_rounded, "payments"),
//           buildBottomItems(Icons.person, "profile"),
//         ],
//       ));
// }
Widget buildBottomNavigationMenu(
    context, int selectedIndex, LandingPageController controller) {
  final double sizeWidth = MediaQuery.of(context).size.width;
  return Obx(() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        width: sizeWidth,
        height: 70,
        color: ThemeConfig.FORM_COLOR,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildBottomNavItem(
                () {
                  controller.changeTabIndex(0);
                },
                Icons.home_filled,
                "Home",
                controller.tabIndex.value == 0,
              ),
              buildBottomNavItem(
                () {
                  controller.changeTabIndex(1);
                },
                Icons.shopping_cart_rounded,
                "Orders",
                controller.tabIndex.value == 1,
              ),
              // const SizedBox(
              //   width: 30.00,
              // ),
              buildBottomNavItem(
                () {
                  controller.changeTabIndex(2);
                },
                Icons.currency_rupee_outlined,
                "My Earnings",
                controller.tabIndex.value == 2,
              ),
              buildBottomNavItem(
                () {
                  controller.changeTabIndex(3);
                },
                Icons.person_outlined,
                "Profile",
                controller.tabIndex.value == 3,
              ),
            ],
          ),
        ),
      ),
    );
  });
}

BottomNavigationBarItem buildBottomItems(IconData icon, String label) {
  return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 20.00,
      ),
      label: label);
}

// class BottomBar extends StatelessWidget {
//   const BottomBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final double sizeWidth = MediaQuery.of(context).size.width;
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         Container(
//           width: sizeWidth,
//           color: ThemeConfig.FORM_COLOR,
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 buildBottomNavItem(() {
//                   Get.toNamed('/dashboard');
//                 }, Icons.home_filled, "Home"),
//                 buildBottomNavItem(() {
//                   Get.toNamed('/orders');
//                 }, Icons.list_alt_outlined, "Orders"),
//                 const SizedBox(
//                   width: 30.00,
//                 ),
//                 buildBottomNavItem(() {
//                   Get.toNamed('/payments');
//                 }, Icons.money_off_outlined, "Payments"),
//                 buildBottomNavItem(() {
//                   Get.toNamed('/profile');
//                 }, Icons.person_outlined, "Profile"),
//               ],
//             ),
//           ),
//         ),
//         buildRoundedButton(() {
//           Get.toNamed('/store');
//         }, Icons.shopping_cart_outlined),
//       ],
//     );
//   }
// }

Widget buildBottomNavItem(
  VoidCallback op,
  IconData icon,
  String label,
  bool selected,
) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: op,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: selected
              ? ThemeConfig.MAIN_TEXT_COLOR
              : ThemeConfig.SECONDARY_TEXT_COLOR,
        ),
        const SizedBox(
          height: 5.00,
        ),
        BottomNavText(
          color: selected
              ? ThemeConfig.MAIN_TEXT_COLOR
              : ThemeConfig.SECONDARY_TEXT_COLOR,
          descString: label,
        )
      ],
    ),
  );
}

Widget buildRoundedButton(VoidCallback op, IconData icon) {
  return GestureDetector(
    onTap: op,
    child: Container(
      margin: EdgeInsets.only(bottom: 30.00, right: 10.00),
      width: 60.00,
      height: 60.00,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.00),
        color: ThemeConfig.DISTRUCTIVE_COLOR,
      ),
      child: Center(
        child: Icon(
          icon,
          color: ThemeConfig.WHITE_COLOR,
        ),
      ),
    ),
  );
}
