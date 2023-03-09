import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/my_store/store_details_controller.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

List<String> productQuantity = ['Unit', 'g', 'kg', 'L'];

String dropDownValue2 = 'Unit';

class ProductVarients extends StatelessWidget {
  const ProductVarients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreDetailsController controller = Get.find<StoreDetailsController>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => controller.loading.value == false
                  ? LabelText(titleString: "Variants")
                  : Container(
                      width: 100,
                      height: 30,
                      color: ThemeConfig.FORM_COLOR,
                    ),
            ),
            Obx(
              () => controller.loading.value == false
                  ? PrimaryButton(
                      text: "+", op: controller.addVarients, type: "filled")
                  : Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ThemeConfig.FORM_COLOR,
                        borderRadius:
                            BorderRadius.circular(ThemeConfig.BORDERRADIUS_MAX),
                      ),
                    ),
            ),
          ],
        ),
        Obx(
          () => controller.loading.value == false
              ? Column(
                  children: [
                    ...controller.data.value.data != null
                        ? controller.data.value.data!.foodsVariant != null
                            ? controller.data.value.data!.foodsVariant!
                                .map(
                                  (e) => TileValue(
                                    index: controller
                                        .data.value.data!.foodsVariant!
                                        .indexOf(e),
                                    controllerPrice: e.priceController!,
                                    controllerStock: e.quantityController!,
                                  ),
                                )
                                .toList()
                            : []
                        : [],
                  ],
                )
              : Container(),
        )
      ],
    );
  }
}

class TileValue extends StatelessWidget {
  final TextEditingController controllerPrice;
  final TextEditingController controllerStock;
  // final String unit;
  final int index;
  const TileValue({
    Key? key,
    required this.index,
    required this.controllerPrice,
    required this.controllerStock,
    // required this.unit
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreDetailsController controller = Get.find<StoreDetailsController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
              child: SmallRoundedInputField(
            hintText: "price",
            controller: controllerPrice,
            onChange: (val) {
              controller.changePriceVarient(val, index);
            },
          )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: SmallRoundedInputField(
            hintText: "stock",
            controller: controllerStock,
            onChange: (val) {
              controller.changeQuntityVarients(val, index);
            },
          )),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: ThemeConfig.WHITE_COLOR,
                border: Border.all(width: 1, color: ThemeConfig.PRIMARY_COLOR),
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
              ),
              child: Obx(
                () => DropdownButton(
                  isDense: true,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10),
                  underline: Container(
                    height: 0,
                  ),
                  value: controller.data.value.data!.foodsVariant![index].unit
                      .toString(),
                  elevation: 3,
                  style: const TextStyle(
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  items: controller
                      .data.value.data!.foodsVariant![index].listOfUnit!
                      .map((String value) => DropdownMenuItem(
                          value: value,
                          child: SubText(
                            text: value,
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            size: ThemeConfig.NOTIFICATION_SIZE,
                          )))
                      .toList(),
                  onChanged: (String? val) {
                    controller.changeUnitVarient(val!, index);
                    // setState(() {
                    //   dropDownValue2 = value!;
                    // });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          PrimaryButton(
              text: "-",
              op: () {
                controller.removeVarients(
                    controller.data.value.data!.foodsVariant![index]);
              },
              type: "filled"),
        ],
      ),
    );
  }
}
