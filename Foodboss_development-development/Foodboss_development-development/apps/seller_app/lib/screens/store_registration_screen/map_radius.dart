import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seller_app/controller/UI%20controller/deliverySettings/deliveryRadiusController.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:shared_widgets/Config/theme_config.dart';

import '../../widgets/text_widgets/label_widget.dart';

class MapRadius extends StatelessWidget {
  const MapRadius({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MapDeliveryController controller = Get.find<MapDeliveryController>();
    // controller.onSliderChange(controller.sliderValue.value);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LabelText(titleString: 'Set Delivery Range'),
        SizedBox(
          height: size.height * 0.02,
        ),
        Row(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
                    child: Container(
                      // width: 100,
                      height: 300,
                      child: Obx(
                        () => GoogleMap(
                          // gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                          //   Factory<OneSequenceGestureRecognizer>(
                          //     () => EagerGestureRecognizer(),
                          //   ),
                          // },
                          onMapCreated: (_) {
                            controller.onMapCreated(_);
                          },
                          // zoomControlsEnabled: true,
                          // mapType: MapType.satellite,
                          myLocationButtonEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target: controller.initialcameraposition.value,
                            zoom:  17.222392421336448,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  Container(
                    width: 210,
                    height: 210,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(width: 3.0,color: ThemeConfig.PRIMARY_COLOR),
                    ),
                  ),
                  
                  Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/images/locationIcon.png'),
                        width: 25,
                        height: 40,
                      ),
                      SizedBox(height: 40,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Obx(
          () => Slider(
            label:
                // '${controller.sliderValue.value < 10 ? ((controller.sliderValue.value * 100).toInt()).toString() : controller.sliderValue.value < 20 ? ((controller.sliderValue.value - 9).toInt()).toString() : controller.sliderValue.value < 25 ? (((controller.sliderValue.value - 17) * 5).toInt()).toString() : controller.sliderValue.value.toString()} ${controller.sliderValue.value < 10 ? 'm' : 'km'}',
                '${controller.sliderValue.value<9?controller.ranges[controller.sliderValue.value]:(controller.ranges[controller.sliderValue.value]!/1000).toInt()} ${controller.sliderValue.value<9?'m':'km'}',
            min: 0,
            max: 22,
            divisions: 22,
            value: controller.sliderValue.value.toDouble(),
            activeColor: ThemeConfig.PRIMARY_COLOR,
            onChanged: (double val) {
              controller.onSliderChange(val);
              controller.changeZoomValue(val);
            },
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Obx(
            () => SubText(
                text:
                    // '${controller.sliderValue.value < 10 ? ((controller.sliderValue.value * 100).toInt()).toString() : controller.sliderValue.value < 20 ? ((controller.sliderValue.value - 9).toInt()).toString() : controller.sliderValue.value < 25 ? (((controller.sliderValue.value - 17) * 5).toInt()).toString() : controller.sliderValue.value.toString()} ${controller.sliderValue.value < 10 ? 'm' : 'km'}',
                    '${controller.sliderValue.value<9?controller.ranges[controller.sliderValue.value]:(controller.ranges[controller.sliderValue.value]!/1000).toInt()} ${controller.sliderValue.value<9?'m':'km'}',
                color: ThemeConfig.MAIN_TEXT_COLOR,
                size: ThemeConfig.NOTIFICATION_SIZE),
          ),
        ),
      ],
    );
  }
}
