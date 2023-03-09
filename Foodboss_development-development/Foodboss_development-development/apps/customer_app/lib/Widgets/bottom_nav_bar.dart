import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/homepage_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildBottomNavigationMenu(
    context, int selectedIndex, HomePageController controller) {

      CartController cartController = Get.put(CartController(),permanent:true);
  final double sizeWidth = MediaQuery.of(context).size.width;
  return Obx(() {

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(
        margin: const EdgeInsets.all(5),
        width: sizeWidth,
        height: 60,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
        //   color: Colors.white,
        // ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildBottomNavItem(() {
                controller.changeTabIndex(0);
// <<<<<<< Loading-screen
              },
                  controller.tabIndex.value == 0
                      ? Icons.home_filled
                      : Icons.home_outlined,
                  controller.tabIndex.value == 0,
                  'Home'),
              buildBottomNavItem(() {
                controller.changeTabIndex(1);
              },
                  controller.tabIndex.value == 1
                      ? Icons.auto_awesome_mosaic_rounded
                      : Icons.auto_awesome_mosaic,
                  controller.tabIndex.value == 1,
                  'Categories'),
              buildBottomNavItem(() {
                // Get.snackbar("title", "message");
                // controller.changeTabIndex(2);
                Get.toNamed('/search-screen');
              },
                  controller.tabIndex.value == 4
                      ? Icons.search_outlined
                      : Icons.search_rounded,
                  controller.tabIndex.value == 4,
                  'Search'),
              buildBottomNavItem(() {
                cartController.fetchCart();
                cartController.fetchOngoingOrders();
                // Get.snackbar("title", "message");
                controller.changeTabIndex(2);
              },
                  controller.tabIndex.value == 2
                      ? Icons.shopping_basket_rounded
                      : Icons.shopping_basket_outlined,
                  controller.tabIndex.value == 2,
                  'Basket'),
              buildBottomNavItem(() {
                controller.changeTabIndex(3);
              },
                  controller.tabIndex.value == 3
                      ? Icons.person
                      : Icons.person_outline,
                  controller.tabIndex.value == 3,
                  'Profile'),
// =======
//               }, Icons.home_outlined, controller.tabIndex.value == 0, 'Home'),
//               buildBottomNavItem(() {
//                 controller.changeTabIndex(1);
//               }, Icons.category_outlined, controller.tabIndex.value == 1,
//                   'Categories'),
//               buildBottomNavItem(() {
//                 // Get.snackbar("title", "message");
//                 Get.toNamed('/search-screen');
//               }, Icons.search, controller.tabIndex.value == 4, 'Search'),
//               buildBottomNavItem(() {
//                 // Get.snackbar("title", "message");
//                 controller.changeTabIndex(2);
//               }, Icons.shopping_basket_outlined, controller.tabIndex.value == 2,
//                   'Basket'),
//               buildBottomNavItem(() {
//                 controller.changeTabIndex(3);
//               }, Icons.person, controller.tabIndex.value == 3, 'Profile'),
// >>>>>>> development
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

Widget buildBottomNavItem(
    VoidCallback op, IconData icon, bool selected, String lable) {
// <<<<<<< Loading-screen
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: op,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: selected
              ? ThemeConfig.primaryColor
              : ThemeConfig.descriptionColor,
        ),
        const SizedBox(
          height: 5.00,
        ),
        Text(
          lable,
          style: TextStyle(
            fontSize: selected ? 10 : 10,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        )
      ],
// =======
//   return GestureDetector(
//     behavior: HitTestBehavior.translucent,
//     onTap: op,
//     child: Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: selected
//                 ? ThemeConfig.primaryColor
//                 : ThemeConfig.descriptionColor,
//           ),
//           const SizedBox(
//             height: 5.00,
//           ),
//           Text(
//             lable,
//             style: TextStyle(
//               fontSize: selected ? 11 : 10,
//               fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//             ),
//           )
//         ],
//       ),
// >>>>>>> development
    ),
  );
}

Widget buildRoundedButton(VoidCallback op, IconData icon) {
  return GestureDetector(
    onTap: op,
    child: Container(
      margin: const EdgeInsets.only(bottom: 30.00, right: 10.00),
      width: 60.00,
      height: 60.00,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.00),
        color: ThemeConfig.secondaryColor,
      ),
      child: Center(
        child: Icon(
          icon,
          color: ThemeConfig.whiteColor,
        ),
      ),
    ),
  );
}
