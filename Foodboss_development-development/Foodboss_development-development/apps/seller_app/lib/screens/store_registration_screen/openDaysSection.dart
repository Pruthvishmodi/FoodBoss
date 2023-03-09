import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/UI%20controller/deliverySettings/openDaysController.dart';
import 'package:seller_app/widgets/OpenDayChip.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:seller_app/widgets/label_widget.dart';

class OpenDaysSection extends StatelessWidget {
  const OpenDaysSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OpenDaysController controller = Get.find<OpenDaysController>();

    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LabelText(titleString: 'Open Days'),
        SizedBox(
          height: size.height * 0.02,
        ),
        Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: controller.days.keys.map((e) => OpendayChip(e)).toList(),
        ),
      ],
    );
  }
}
