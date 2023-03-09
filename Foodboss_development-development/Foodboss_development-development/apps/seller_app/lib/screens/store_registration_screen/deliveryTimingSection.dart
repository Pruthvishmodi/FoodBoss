import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/UI%20controller/deliverySettings/deliveryTimeController.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/label_widget.dart';

class DeliveryTimingSection extends StatelessWidget {
  DeliveryTimingSection({Key? key}) : super(key: key);
  int deliveryTimings = 1;

  DeliveryTimeController controller = Get.find<DeliveryTimeController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LabelText(titleString: 'Delivery Timings'),
            PrimaryButton(
                text: '+',
                op: () {
                  controller.addNewTime();
                },
                type: 'filled')
          ],
        ),
        SizedBox(height: size.height * 0.02),
        Obx(
          () => SizedBox(
            height: 60 * controller.deliveryTimes.value.length.toDouble(),
            child: controller.deliveryTimes.value.isEmpty
                ? const SizedBox(
                    height: 0,
                  )
                : Obx(() => ListView.builder(
                      itemCount: controller.listOfDeliveryTimes.length,
                      itemBuilder: (ctx, index) {
                        return DeliveryTimingsSection(
                            context, controller.listOfDeliveryTimes[index]);
                      },
                    )),
          ),
        ),
      ],
    );
  }

  Container DeliveryTimingsSection(
    BuildContext context,
    DeliveryTime time,
  ) {
    print(time.id);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () async {
                //             TimeOfDay? time =  await showTimePicker(
                // context: context,
                // initialTime: TimeOfDay(hour: 10, minute: 00),
                // builder: (c, Widget? child) {
                //   return Theme(
                //       data: ThemeData(
                //         primaryColor: ThemeConfig.PRIMARY_COLOR,
                //       ),
                //       child: child ?? Container());
                // });
                // // print("time.toString()");
                // print(time.toString());
                controller.setTimetoValue(context, time.id, 0);
              },
              child: Container(
                height: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: ThemeConfig.WHITE_COLOR,
                  border:
                      Border.all(width: 1, color: ThemeConfig.PRIMARY_COLOR),
                  borderRadius:
                      BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                ),
                child:
                    Obx(() => Text(controller.getstartTime(context, time.id))),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                controller.setTimetoValue(context, time.id, 1);
              },
              child: Container(
                height: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: ThemeConfig.WHITE_COLOR,
                  border:
                      Border.all(width: 1, color: ThemeConfig.PRIMARY_COLOR),
                  borderRadius:
                      BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                ),
                child: Obx(() => Text(controller.getendTime(context, time.id))),
              ),
            ),
          ),
          // index == deliveryTimings - 1
          //     ?
          Expanded(
              child: IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              if (deliveryTimings < 3) {
                controller.removeTime(time);
                // setState(() {
                //   deliveryTimings = deliveryTimings + 1;
                // });
              }
            },
          ))
          // : Expanded(
          //     child: IconButton(
          //     icon: const Icon(Icons.remove),
          //     onPressed: () {
          //       if (deliveryTimings > 0) {
          //         // setState(() {
          //         //   deliveryTimings = deliveryTimings - 1;
          //         // });
          //       }
          //     },
          //   ))
        ],
      ),
    );
  }
}
