import 'package:flutter/material.dart';
import 'package:seller_app/config/config.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/food_boss_button.dart';
import 'package:seller_app/widgets/food_boss_card.dart';

class PendingCard extends StatelessWidget {
  final double orderId;
  final double amount;
  final String buttonText;
  final String type;
  final String date;
  final String time;
  final double items;
  final bool isCheckbox;
  final bool? isButton;
  final bool? isButton2;
  final bool isCheck = false;

  const PendingCard(
      {Key? key,
      required this.orderId,
      required this.amount,
      required this.date,
      required this.time,
      required this.items,
      required this.type,
      required this.buttonText,
      required this.isCheckbox,
      this.isButton,
      this.isButton2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FoodBossCard(
        borderRadius: 0,
        padding: const EdgeInsets.all(20),
        cardColor: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            isCheckbox == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(""),
                      Checkbox(
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(
                              width: 1.0, color: ThemeConfig.PRIMARY_COLOR),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        splashRadius: 10,
                        checkColor: Colors.white,
                        focusColor: Conifg.primaryColor,
                        activeColor: Conifg.primaryColor,
                        onChanged: (bool? value) {
                          isCheck == value;
                        },
                        value: isCheck,
                      )
                    ],
                  )
                : Row(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order: #$orderId",
                  style: const TextStyle(
                      color: ThemeConfig.MAIN_TEXT_COLOR,
                      fontSize: ThemeConfig.TITLE_SIZE,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.00),
                ),
                Text(
                  "Rs.$amount",
                  style: const TextStyle(
                      color: ThemeConfig.MAIN_TEXT_COLOR,
                      fontSize: ThemeConfig.TITLE_SIZE,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.00),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$date - $time",
                  style: const TextStyle(
                      color: ThemeConfig.SECONDARY_TEXT_COLOR,
                      fontSize: ThemeConfig.DESCRIPTION_SIZE,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.00),
                ),
                Text(
                  "$items items",
                  style: const TextStyle(
                      color: ThemeConfig.SECONDARY_TEXT_COLOR,
                      fontSize: ThemeConfig.SUB_TITLE_SIZE,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.00),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ignore: unnecessary_string_interpolations
                    Text(
                      "$type",
                      style: const TextStyle(
                          color: ThemeConfig.DISTRUCTIVE_COLOR,
                          fontSize: ThemeConfig.TITLE_SIZE,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.00),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                    flex: 1,
                    child: FoodBossButtons(
                        height: 40,
                        text: buttonText,
                        color: Conifg.primaryColor,
                        bradius: 50,
                        textcolor: Colors.white,
                        fsize: ThemeConfig.TITLE_SIZE,
                        op: () {},
                        type: 'filled',
                        bwidth: 0)),
                Expanded(
                    flex: 1,
                    child: FoodBossButtons(
                        height: 40,
                        text: "Summary",
                        color: Conifg.primaryColor,
                        bradius: 50,
                        textcolor: Conifg.primaryColor,
                        fsize: ThemeConfig.TITLE_SIZE,
                        op: () {},
                        type: 'outlined',
                        bwidth: 2))
              ],
            )
          ],
        ),
        op: () {},
        margin: const EdgeInsets.all(10));
  }
}
