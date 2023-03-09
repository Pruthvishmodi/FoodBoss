import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/my_store/store_details_controller.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreDetailsController controller = Get.find<StoreDetailsController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => controller.loading.value == false
            ? Obx(() => controller.data.value.data!.isRemoveMrp == false
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Obx(
                          () => controller.loading.value == false
                              ? const LabelText(
                                  titleString: "Market Price",
                                )
                              : const SizedBox(
                                  width: 0,
                                ),
                        ),
                        Obx(
                          () => SizedBox(
                            width: controller.loading.value == false ? 10 : 0,
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => controller.loading.value == false
                                ? SmallRoundedInputField(
                                  tailingIcon: Icons.currency_rupee,
                                    hintText: controller.data.value.data != null
                                        ? controller.data.value.data!.foodsUsers!.price.toString()
                                        : '',
                                    textType: TextInputType.number,
                                    onChange: (value) =>
                                        controller.changeMRP(value),
                                  )
                                : Container(
                                    height: 20, color: ThemeConfig.FORM_COLOR),
                          ),
                        ),
                        // Expanded(
                        //   child: Obx(
                        //     () => controller.loading.value == false
                        //         ? Desc(
                        //             descString: controller.data.value.data !=
                        //                     null
                        //                 ? '\u{20B9} ${controller.data.value.data!.price.toString()}'
                        //                 : "")
                        //         : Container(
                        //             height: 20, color: ThemeConfig.FORM_COLOR),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                : Container())
            : Container()),
        Obx(
          () => controller.loading.value == false
              ? const LabelText(
                  titleString: "Description",
                )
              : Container(
                  width: 100,
                  height: 20,
                  color: ThemeConfig.FORM_COLOR,
                ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Obx(
                () => controller.loading.value == false
                    ? Html(
                        style: {
                            // "*": Style(
                            //   margin: EdgeInsets.zero,
                            //   padding: EdgeInsets.zero,
                            // ),
                            "*": Style(
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero,
                                color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                lineHeight: LineHeight.percent(110))
                          },
                        data: controller.data.value.data != null
                            ? controller.data.value.data!.description != null
                                ? controller.data.value.data!.description
                                    .toString()
                                : "<p>No Product Description Provided</p>"
                            : "")
                    : Container(
                        height: 200,
                        color: ThemeConfig.FORM_COLOR,
                      ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Obx(
          () => controller.loading.value == false
              ? const LabelText(
                  titleString: "Ingredients",
                )
              : Container(
                  width: 100,
                  height: 20,
                  color: ThemeConfig.FORM_COLOR,
                ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Obx(
                () => controller.loading.value == false
                    ? Html(
                        style: {
                            // "*": Style(
                            //   margin: EdgeInsets.zero,
                            //   padding: EdgeInsets.zero,
                            // ),
                            "*": Style(
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero,
                                color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                lineHeight: LineHeight.percent(110))
                          },
                        data: controller.data.value.data != null
                            ? controller.data.value.data!.ingredients != null
                                ? controller.data.value.data!.ingredients!
                                    .toString()
                                : "<p>No Ingredients provided</p>"
                            : "")
                    : Container(
                        height: 200,
                        color: ThemeConfig.FORM_COLOR,
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
