import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/controller/UI%20controller/map_adress.dart/change_adress.dart';
import 'package:rider_app/screens/address_add_screen/address_add_screen.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:rider_app/screens/pick_location_screen/address_part.dart';
import 'package:rider_app/screens/pick_location_screen/map_screen_part.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';

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
