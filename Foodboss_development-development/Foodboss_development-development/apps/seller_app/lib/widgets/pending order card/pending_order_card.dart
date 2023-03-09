import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/food%20boss%20card/food_boss_card.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/distructive_text.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';

class PendingCard extends StatelessWidget {
  final String orderId;
  final String time;
  final String amount;
  final String items;
  final String type;
  const PendingCard(
      {Key? key,
      required this.orderId,
      required this.time,
      required this.amount,
      required this.items,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FoodBossCard(
      list: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainLabelText(titleString: "Order #$orderId"),
            const SizedBox(height: 10.00),
            Desc(
              descString: time,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MainLabelText(titleString: "Rs. $amount"),
            const SizedBox(height: 10.00),
            Desc(descString: "$items items"),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: DistructiveText(
                titleString: type,
              ),
            ),
            Expanded(
                flex: 8,
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        op: () {},
                        text: 'Cancel',
                        type: "filled",
                      ),
                    ),
                    const SizedBox(width: 10.00),
                    Expanded(
                      child: PrimaryButton(
                        op: () {
                          Get.toNamed('/ordersummary');
                        },
                        text: 'Summary',
                        type: "outlined",
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
