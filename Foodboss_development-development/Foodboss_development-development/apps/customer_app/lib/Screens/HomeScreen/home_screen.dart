import 'package:customer_app/Controller/UI%20Controllers/homepage_controller.dart';
import 'package:customer_app/Screens/CategoryScreen/catreogry_screen.dart';
import 'package:customer_app/Screens/HomeScreen/router.dart';
import 'package:customer_app/Screens/MainScreen/main_screen.dart';
import 'package:customer_app/Screens/ProfileScreen/profile_screen.dart';
import 'package:customer_app/Screens/ShoppingCart/store_wise_cart.dart';
import 'package:customer_app/Widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomePageController controller =
      Get.put(HomePageController(), permanent: false);

  @override
  void initState() {
    DynamicRouter().initDynamicLinks();
    print('object');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you want to exit?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Obx(() => IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  MainScreen(),
                  CategoryScreen(),
                  StoreWiseCart(),
                  ProfileScreen()
                ],
              )),
        ),
        bottomNavigationBar: buildBottomNavigationMenu(context, 0, controller),
      ),
    );
  }
}
