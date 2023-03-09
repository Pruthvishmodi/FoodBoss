import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Widgets/Text%20widgets/heading_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OrderCompletedAnimation extends StatefulWidget {
  const OrderCompletedAnimation({Key? key}) : super(key: key);

  @override
  State<OrderCompletedAnimation> createState() =>
      _OrderCompletedAnimationState();
}

class _OrderCompletedAnimationState extends State<OrderCompletedAnimation> {
  CartController cartController = Get.find<CartController>();
  var args = Get.arguments;

//   Future<AudioPlayer> playLocalAsset() async {
//     AudioCache cache = new AudioCache();
//     // return await cache.play("yes.mp3");
// }

  playLocalAsset() {
    var player = AudioPlayer();
    player.play(
      AssetSource('audio/order-complete.mpeg'),
    );
  }

  @override
  void initState() {
    super.initState();
    playLocalAsset();
    Timer(
      const Duration(seconds: 3),
      () {
        cartController.fetchOrderDetails(args[0]);
        Get.offNamed('/ongoing-orders', arguments: [args[0]]);
        // Get.offNamed('/home');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeConfig.whiteColor,
      body: Container(
        height: size.height,
        width: size.width,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(image: AssetImage('assets/images/background.png'),fit: BoxFit.cover)
        // ),
        color: ThemeConfig.whiteColor,
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/images/order-complete.json',
                // height: 250,
                width: double.infinity,
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
              const SizedBox(
                height: 20,
              ),
              const HeadingText(
                text: 'Order Placed!',
              ),
              const SizedBox(
                height: 10,
              ),
              const LabelText(text: 'Thanks for shopping!!!')
            ],
          ),
        ),
      ),
    );
  }
}
