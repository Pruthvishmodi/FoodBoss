import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/screens/order%20summary/order_summary_screen.dart';
import 'package:rider_app/shimmers/card_shimmer.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/distructive_text.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';

class PlanBuyCard extends StatelessWidget {
  final String price;
  final String orders;
  const PlanBuyCard({Key? key, required this.price, required this.orders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.00),
        color: ThemeConfig.WHITE_COLOR,
      ),
      padding: const EdgeInsets.all(20.00),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Divider(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.00),
                  color: ThemeConfig.FORM_COLOR,
                ),
                padding: EdgeInsets.all(10),
                child: MainLabelText(
                  titleString: "\u{20B9}",
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(titleString: "$orders"),
                    Desc(descString: "\u{20B9} $price"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Expanded(
          //       // flex: 1,
          //       child: DistructiveButton(
          //         text: "BUY",
          //         op: () {},
          //         type: "filled",
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
