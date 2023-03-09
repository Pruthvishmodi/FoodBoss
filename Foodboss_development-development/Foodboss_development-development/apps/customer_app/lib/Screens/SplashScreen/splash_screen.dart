import 'dart:async';

import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/login_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/map_address_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/store_product_ui_controller.dart';
import 'package:customer_app/Widgets/Icon%20tile/icon_tile.dart';
import 'package:customer_app/Widgets/Text%20widgets/heading_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    UserController userController = Get.put(UserController(),permanent: true);
    MapAdressController mapAdressController = Get.put(MapAdressController(),permanent: true);
  LoginController loginController = Get.put(LoginController(),permanent: false);
  CartController cartController = Get.put(CartController(),permanent: true);
  // StoreProductController storeProductController = Get.put(StoreProductController(),permanent: true);
  // StoreProductUiController storeProductUiController = Get.put(StoreProductUiController(),permanent: true);
  @override
  void initState() {
    super.initState();
    loginController.onSplashScreen();
    // cartController.fetchCart();
    // Timer(
    //   const Duration(seconds: 3),
    //   () => Get.offNamed('/home'),
    // );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

        backgroundColor: ThemeConfig.whiteColor,

        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/background.png'),fit: BoxFit.cover)
          ),
          alignment: Alignment.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/fblogo.png',
                  height: 150,
                  width: 150,
                ),
                // GestureDetector(
                //       behavior: HitTestBehavior.translucent,
                //       onTap: () {
                //         loginController.onLogout();
                //       },
                //       child: Row(
                //         children: const [
                //           iconTile(
                //               icon: Icons.person_outline_outlined,
                //               color: ThemeConfig.descriptionColor),
                //           SizedBox(width: 20),
                //           LabelText(text: 'Logout')
                //         ],
                //       ),
                //     ),
                // const SizedBox(
                //   height: 20,
                // ),
                // const HeadingText(
                //   text: 'Food Boss',
                // ),
              ],
            ),
          ),
        ),

      
    );

  }
}
