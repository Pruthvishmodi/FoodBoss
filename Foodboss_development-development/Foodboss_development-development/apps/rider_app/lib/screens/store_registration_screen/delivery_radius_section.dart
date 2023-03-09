import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/controller/UI%20controller/deliverySettings/deliveryRadiusController.dart';
import 'package:rider_app/widgets/SubText.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class DeliveryRadiusSection extends StatelessWidget {
  const DeliveryRadiusSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeliveryRadiusController controller =
        Get.put(DeliveryRadiusController(), permanent: false);

    Size size = MediaQuery.of(context).size;
    return Container(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LabelText(titleString: 'Set Delivery Range'),
            SizedBox(
              height: size.height * 0.02,
            ),
            // mappp
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
              child: Container(
                height: size.height * 0.4,
                child: GoogleMap(
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                    ),
                  },
                  zoomControlsEnabled: true,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: controller.initialcameraposition, zoom: 14),
                  mapType: MapType.normal,
                  onMapCreated: (_) => controller.onMapCreated(_),
                  markers: controller.markers,
                  // circles: controller.getCircles,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Slider(
                label:
                    '${controller.sliderValue.value < 10 ? ((controller.sliderValue.value * 100).toInt()).toString() : controller.sliderValue.value < 20 ? ((controller.sliderValue.value - 9).toInt()).toString() : controller.sliderValue.value < 25 ? (((controller.sliderValue.value - 17) * 5).toInt()).toString() : controller.sliderValue.value.toString()} ${controller.sliderValue.value < 10 ? 'm' : 'km'}',
                min: 0,
                max: 23,
                divisions: 23,
                activeColor: ThemeConfig.PRIMARY_COLOR,
                thumbColor: ThemeConfig.PRIMARY_COLOR,
                value: controller.sliderValue.value.toDouble(),
                onChangeEnd: (value) {
                  print('this is problem');
                  // controller.onSliderChange(value);
                },
                onChanged: (value) {
                  print('this is problem');
                  // controller.onSliderChange(value);
                  // setState(() {
                  //   changeZoomValue(value);
                  //   controller.sliderValue.value = value;
                  // });
                }
                ),
            // Container(
            //   alignment: Alignment.center,
            //   child: SubText(
            //       text:
            //           '${controller.sliderValue.value < 10 ? ((controller.sliderValue.value * 100).toInt()).toString() : controller.sliderValue.value < 20 ? ((controller.sliderValue.value - 9).toInt()).toString() : controller.sliderValue.value < 25 ? (((controller.sliderValue.value - 17) * 5).toInt()).toString() : controller.sliderValue.value.toString()} ${controller.sliderValue.value < 10 ? 'm' : 'km'}',
            //       color: ThemeConfig.MAIN_TEXT_COLOR,
            //       size: ThemeConfig.NOTIFICATION_SIZE),
            // ),
          ],
        ),
      ),
    );
  }
}
