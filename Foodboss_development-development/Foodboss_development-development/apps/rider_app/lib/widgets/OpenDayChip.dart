import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/controller/UI%20controller/deliverySettings/openDaysController.dart';
import 'package:rider_app/widgets/SubText.dart';

class OpendayChip extends StatelessWidget {

  String day;
  OpendayChip(this.day);

  @override

  Widget build(BuildContext context) {
    OpenDaysController controller = Get.put(OpenDaysController(),permanent: false);
    return Obx( () =>GestureDetector(
        onTap: () {
          controller.changeDayState(day);
        },
        child:  Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Chip(
            label: SubText(
                text: day,
                color: controller.getDayState(day)? ThemeConfig.WHITE_COLOR : ThemeConfig.PRIMARY_COLOR,
                size: ThemeConfig.NOTIFICATION_SIZE),
            backgroundColor: controller.getDayState(day) ? ThemeConfig.PRIMARY_COLOR : ThemeConfig.WHITE_COLOR,
            side: BorderSide(color: controller.getDayState(day) ? ThemeConfig.PRIMARY_COLOR : ThemeConfig.PRIMARY_COLOR,width: 1),
            padding: const EdgeInsets.all(5),
          ),
        ),
      ),
    );
  }
}
