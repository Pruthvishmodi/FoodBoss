import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/UI%20controller/deliverySettings/storeTimingsController.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:seller_app/widgets/main_label.dart';

class StoreTimingsSection extends StatelessWidget {
  StoreTimingsSection({Key? key}) : super(key: key);
  List<String> time = ['Start Time', '10:00 AM', '11:00 AM', '12:00 AM'];
  List<String> time2 = ['End Time', '10:00 AM', '11:00 AM', '12:00 AM'];
  String dropDownValue = 'Start Time';
  String dropDownValue2 = 'End Time';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    StoreTimingsController controller = Get.find<StoreTimingsController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LabelText(
          titleString: 'Store Timings',
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Obx(
                () => Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      //getTime funtion
                      controller.setTime(context, 1);
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: ThemeConfig.WHITE_COLOR,
                        border: Border.all(
                            width: 1, color: ThemeConfig.PRIMARY_COLOR),
                        borderRadius:
                            BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                      ),
                      child: Text(controller.getTime(context, 1)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Obx(
                () => Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      //getTime funtion
                      controller.setTime(context, 2);
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: ThemeConfig.WHITE_COLOR,
                        border: Border.all(
                            width: 1, color: ThemeConfig.PRIMARY_COLOR),
                        borderRadius:
                            BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                      ),
                      child: Text(controller.getTime(context, 2)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
