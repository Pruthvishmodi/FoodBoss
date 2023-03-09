import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:rider_app/controller/UI%20controller/map_adress.dart/change_adress.dart';
import 'package:shared_widgets/shared_widgets.dart';

class MapPartScreen extends StatelessWidget {
  const MapPartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapAdressController controller = Get.find<MapAdressController>();
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: ThemeConfig.OUTLINE_COLOR,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: ThemeConfig.PRIMARY_COLOR,
                    child: Obx(
                      () {
                        if(controller.loading.value == true){
                          return Center(child: CircularProgressIndicator(),);
                        }else{
                          return GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: controller.center.value,
                          zoom: 19,
                        ),
                        onCameraMove: (val) {
                          controller.onCameraMove(val);
                        },
                        onCameraIdle: controller.getLocationstring,
                        // markers: controller.markers,
                        mapType: MapType.normal,
                        onMapCreated: controller.onMapCreated,
                        myLocationEnabled: true,
                        zoomControlsEnabled: true,
                        // onTap: controller.handleTap,
                      );
                        }
                      },
                    ),
                  ),
                  const Image(
                    image: AssetImage('assets/images/locationIcon.png'),
                    width: 30,
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
