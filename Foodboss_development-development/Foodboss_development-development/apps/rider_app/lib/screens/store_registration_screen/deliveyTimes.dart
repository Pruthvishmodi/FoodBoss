import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/UI%20controller/deliverySettings/deliveryRadiusController.dart';
import 'package:rider_app/widgets/SmallRoundedInputField.dart';
import 'package:rider_app/widgets/SubText.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

List<String> ranges = [
  '500 m',
  '1 km',
  '1.5 km',
  '2 km',
  '3 km',
  '5 km',
  '10 km',
  '15 km',
  '30 km'
];
String rangeValue = '500 m';

class DeliveryTimes extends StatelessWidget {
  const DeliveryTimes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddSettingsController controller = Get.find<AddSettingsController>();
    // InitialController controllerAdd =
    //     Get.put(InitialController(), permanent: false);
    // return ListView.builder(
    //   itemCount: 2,
    //   itemBuilder: (context, index) {
    //     return DeliveryTile();
    //   },
    // );
    return Obx(
      () => Column(
        children: [
          // DeliveryTile(
          //   id: 0,
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LabelText(titleString: 'Delivery Timings'),
              PrimaryButton(
                  text: '+',
                  op: () {
                    controller.addDelivery(controller.ranges.value.length == 0
                        ? 1
                        : controller.ranges.value.keys.last + 1);
                  },
                  type: 'filled')
            ],
          ),
          ...getTiles(controller).toList(),
        ],
      ),
    );
  }
}

List<DeliveryTile> getTiles(AddSettingsController controller) {
  List<DeliveryTile> tiles = [];
  controller.ranges.value.forEach((key, value) {
    tiles.add(DeliveryTile(
      id: key,
    ));
  });
  return tiles;
}

class DeliveryTile extends StatelessWidget {
  final int id;
  const DeliveryTile({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddSettingsController controller = Get.find<AddSettingsController>();
    return Row(children: [
      Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            color: ThemeConfig.WHITE_COLOR,
            border: Border.all(width: 1, color: ThemeConfig.PRIMARY_COLOR),
            borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MAX),
          ),
          child: DropdownButton(
            isDense: true,
            isExpanded: true,
            borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
            underline: Container(
              height: 0,
            ),
            value: controller.ranges.value[id] != null
                ? controller.ranges.value[id]!.range
                : "500 m",
            elevation: 3,
            style: const TextStyle(
              color: ThemeConfig.PRIMARY_COLOR,
            ),
            items: ranges
                .map((String value) => DropdownMenuItem(
                    value: value,
                    child: SubText(
                      text: value,
                      color: ThemeConfig.MAIN_TEXT_COLOR,
                      size: ThemeConfig.NOTIFICATION_SIZE,
                    )))
                .toList(),
            onChanged: (String? val) {
              if (controller.ranges.value[id] != null) {
                if (val != null) {
                  controller.ranges.value[id]!.range = val;
                }
              }
              controller.ranges.refresh();
              // setState(() {
              //   rangeValue = value!;
              // });
            },
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 2,
        child: SmallRoundedInputField(
            hintText: 'Price',
            controller: controller.ranges.value[id] != null
                ? controller.ranges.value[id]!.controller
                : null,
            textType: TextInputType.number,
            // labelText: 'P',
            onChange: (value) {
              // controller.ranges.value[id]!.price = value;
            }),
      ),
      controller.ranges.value.length == 0
          ? Expanded(
              child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // if (deliveryRange < 3) {
                //   setState(() {
                //     deliveryRange = deliveryRange + 1;

                controller.addDelivery(controller.ranges.value.length == 0
                    ? 1
                    : controller.ranges.value.keys.last + 1);
                //   });
                // }
              },
            ))
          : controller.ranges.value.length <= 0
              ? Expanded(
                  child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // if (deliveryRange < 3) {
                    //   setState(() {
                    //     deliveryRange = deliveryRange + 1;

                    controller
                        .addDelivery(controller.ranges.value.keys.last + 1);
                    //   });
                    // }
                  },
                ))
              : Expanded(
                  child: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    controller.removeDelivery(id);
                  },
                ))
    ]);
  }
}
