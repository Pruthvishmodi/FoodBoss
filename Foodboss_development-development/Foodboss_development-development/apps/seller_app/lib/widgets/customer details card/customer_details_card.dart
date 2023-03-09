import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/khata_controller.dart';
import 'package:seller_app/models/get_my_users_khata_list_model.dart';
import 'package:seller_app/widgets/animate_linear_indicator.dart';

import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/TextFieldContainer.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/food%20boss%20card/food_boss_card.dart';
import 'package:seller_app/widgets/form_input.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/distructive_text.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerCard extends StatelessWidget {
  final KhataUser khata;
  final int index;
  const CustomerCard({
    Key? key,
    required this.khata,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    KhataController khataController = Get.find<KhataController>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.00),
        color: ThemeConfig.WHITE_COLOR,
      ),
      margin: const EdgeInsets.only(
        top: 20.00,
      ),
      padding: const EdgeInsets.all(20.00),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(titleString: khata.customerName!),
                    GestureDetector(
                      onTap: () => launch("tel://${khata.phone!}"),
                      child: Desc(descString: "+91 ${khata.phone!}"),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    khataController.getKhataDetail(khata.id!);
                    Get.toNamed("/khata-management/details");
                  },
                  child: const DistructiveText(titleString: "details")),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5.00),
              //     color: ThemeConfig.FORM_COLOR,
              //   ),
              //   padding: const EdgeInsets.all(10),
              //   child: const MainLabelText(
              //     titleString: "\u{20B9}",
              //   ),
              // ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Desc(descString: "Pending"),
                  const SizedBox(width: 5),
                  LabelText(titleString: "\u{20B9} ${khata.totalUsedAmount}"),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Desc(descString: "Total"),
                  const SizedBox(width: 5),
                  LabelText(titleString: "\u{20B9} ${khata.totalKhataAmount}"),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedLinearProgressIndicator(
            animatedDuration: const Duration(milliseconds: 300),
            maxValue: double.parse(khata.totalKhataAmount!),
            currentValue: double.parse(khata.totalUsedAmount!),
            size: 30,
            backgroundColor: ThemeConfig.FORM_COLOR,
            progressColor: ThemeConfig.PRIMARY_COLOR,
            // border: Border.all(
            //     width: 1, color: ThemeConfig.secondaryColor),
            borderRadius: BorderRadius.circular(5),

            // displayText: '',
            // displayTextStyle: const TextStyle(
            //   color: ThemeConfig.whiteColor,
            //   fontSize: ThemeConfig.descriptionSize,
            // ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Obx(
                  () => SmallRoundedInputField(
                    // controller: textEditingController,
                    hintText: khataController
                                .myKhatas.value.khatas![index].newAmount ==
                            null
                        ? "Amount"
                        : khataController
                            .myKhatas.value.khatas![index].newAmount!,
                    textType: TextInputType.number,
                    onChange: (val) =>
                        khataController.onChangeNewAmount(val, khata.id),
                    onSubmit: (val) {
                      if (khataController
                                  .myKhatas.value.khatas![index].newAmount !=
                              null ||
                          khataController
                                  .myKhatas.value.khatas![index].newAmount !=
                              '') {
                        FocusScope.of(context).unfocus();
                        khataController.quickEditKhata(
                            khata.id.toString(), khata.newAmount!);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: PrimaryButton(
                  op: () {
                    if (khataController
                                .myKhatas.value.khatas![index].newAmount !=
                            null ||
                        khataController
                                .myKhatas.value.khatas![index].newAmount !=
                            '') {
                      FocusScope.of(context).unfocus();
                      khataController.quickEditKhata(
                          khata.id.toString(), khata.newAmount!);
                      khataController.onChangeNewAmount('', khata.id!);
                    }
                  },
                  text: 'Paid',
                  type: "filled",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
