import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/food%20boss%20card/food_boss_card.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/distructive_text.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class ReportCard extends StatelessWidget {
  final String amount;
  final String time;
  final String points;
  const ReportCard(
      {Key? key,
      required this.amount,
      required this.time,
      required this.points})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.00),
        color: ThemeConfig.WHITE_COLOR,
      ),
      margin: const EdgeInsets.only(
        top: 20.00,
        left: 20,
        right: 20,
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
                    Desc(descString: "Total Orders"),
                    LabelText(titleString: points),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    // Get.toNamed("/khata-management/details");
                  },
                  child: const DistructiveText(titleString: "share")),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.00),
                  color: ThemeConfig.FORM_COLOR,
                ),
                padding: const EdgeInsets.all(10),
                child: const MainLabelText(
                  titleString: "\u{20B9}",
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Desc(descString: "July, 2020"),
                    MainLabelText(titleString: "\u{20B9} $amount"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Expanded(
                  child: PrimaryButton(
                    op: () {
                      Get.toNamed("/reports/individual");
                    },
                    text: 'Details',
                    type: "filled",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
