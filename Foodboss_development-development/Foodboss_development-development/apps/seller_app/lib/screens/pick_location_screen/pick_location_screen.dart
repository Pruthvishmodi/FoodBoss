import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/UI%20controller/map_adress.dart/change_adress.dart';
import 'package:seller_app/screens/pick_location_screen/address_part.dart';
import 'package:seller_app/screens/pick_location_screen/map_screen_part.dart';

class PickLocationScreen extends StatelessWidget {
  const PickLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapAdressController controller = Get.put(
      MapAdressController(),
      permanent: false,
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          // height: size.height,
          child: Column(
            children: const [
              MapPartScreen(),
              AddressPart(),
            ],
          ),
        ),
      ),
    );
  }
}
