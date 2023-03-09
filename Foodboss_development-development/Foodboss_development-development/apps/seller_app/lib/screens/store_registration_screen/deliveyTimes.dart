import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/UI%20controller/deliverySettings/deliveryRadiusController.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

List<String> ranges = [
  '100 m',
  '200 m',
  '300 m',
  '400 m',
  '500 m',
  '600 m',
  '700 m',
  '800 m',
  '900 m',
  '1 km',
  '2 km',
  '3 km',
  '4 km',
  '5 km',
  '6 km',
  '7 km',
  '8 km',
  '9 km',
  '10 km',
  '15 km',
  '20 km',
  '25 km',
  '30 km',
];
String rangeValue = '500 m';

class DeliveryTimes extends StatelessWidget {
  const DeliveryTimes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapDeliveryController controller = Get.find<MapDeliveryController>();
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
              const LabelText(titleString: 'Delivery Range'),
              PrimaryButton(
                  text: '+',
                  op: () {
                    controller.getRanges();
                    controller.addDelivery(
                        controller.rangesDelivery.value.length == 0
                            ? 1
                            : controller.rangesDelivery.value.keys.last + 1);
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

List<DeliveryTile> getTiles(MapDeliveryController controller) {
  List<DeliveryTile> tiles = [];
  controller.rangesDelivery.value.forEach((key, value) {
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
    MapDeliveryController controller = Get.find<MapDeliveryController>();
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
            borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
          ),
          child: Obx(() => controller.ranges1.isNotEmpty
              ? DropdownButton(
                  isDense: true,
                  isExpanded: true,
                  borderRadius:
                      BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                  underline: Container(
                    height: 0,
                  ),
                  value: controller.rangesDelivery.value[id]!.range,
                  elevation: 3,
                  menuMaxHeight: 300,
                  style: const TextStyle(
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  items: controller.ranges1
                      .map((String value) => DropdownMenuItem(
                          value: value,
                          child: SubText(
                            text: value,
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            size: ThemeConfig.NOTIFICATION_SIZE,
                          )))
                      .toList(),
                  onChanged: (String? val) {
                    if (controller.rangesDelivery.value[id] != null) {
                      if (val != null) {
                        if (controller.rangesDelivery.length > 1) {
                          if (controller.rangesDelivery.value[id - 1] != null) {
                            if (int.parse(controller
                                    .rangesDelivery.value[id - 1]!.range) >=
                                int.parse(val)) {
                              CustomSnackbar.errorSnackbar2(
                                  "range should not be greater than upper range and lesser than lower range");
                            } else {
                              if (controller.rangesDelivery.value[id + 1] !=
                                  null) {
                                if (int.parse(controller
                                        .rangesDelivery.value[id + 1]!.range) <=
                                    int.parse(val)) {
                                  CustomSnackbar.errorSnackbar2(
                                      "range should not be greater than upper range and lesser than lower range");
                                }
                              }
                              controller.rangesDelivery.value[id]!.range = val;
                            }
                          } else {
                            controller.rangesDelivery.value[id]!.range = val;
                          }
                        } else {
                          printError(info: "here len");
                          controller.rangesDelivery.value[id]!.range = val;
                        }
                      }
                    }
                    controller.rangesDelivery.refresh();
                    // setState(() {
                    //   rangeValue = value!;
                    // });
                  },
                )
              : SizedBox()),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 2,
        child: SmallRoundedInputField(
            hintText: controller.rangesDelivery.value[id]!.price == ''
                ? 'Delivery Fee'
                : controller.rangesDelivery.value[id]!.price,
            // controller: controller.ranges.value[id] != null
            //     ? controller.ranges.value[id]!.controller
            //     : null,
            textType: TextInputType.number,
            // labelText: 'P',
            onChange: (value) {
              controller.rangesDelivery.value[id]!.price = value;
            }),
      ),
      controller.rangesDelivery.value.length == 0
          ? Expanded(
              child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // if (deliveryRange < 3) {
                //   setState(() {
                //     deliveryRange = deliveryRange + 1;

                controller.addDelivery(
                    controller.rangesDelivery.value.length == 0
                        ? 1
                        : controller.rangesDelivery.value.keys.last + 1);
                //   });
                // }
              },
            ))
          : controller.rangesDelivery.value.length <= 0
              ? Expanded(
                  child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // if (deliveryRange < 3) {
                    //   setState(() {
                    //     deliveryRange = deliveryRange + 1;

                    controller.addDelivery(
                        controller.rangesDelivery.value.keys.last + 1);
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
