import 'package:flutter/material.dart';
import 'package:seller_app/config/config.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/food_boss_button.dart';
import 'package:seller_app/widgets/food_boss_card.dart';

class CustomerDetailsCard extends StatelessWidget {
  final String name;
  final String address;
  final VoidCallback op;
  final double phoneNumber;
  final double totalPaidAmount;
  final double totalKhataAmount;
  final double lastPaidAmount;
  final double totalPendingAmount;

  const CustomerDetailsCard(
      {Key? key,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.totalPaidAmount,
      required this.totalKhataAmount,
      required this.lastPaidAmount,
      required this.totalPendingAmount,
      required this.op})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FoodBossCard(
        borderRadius: 20,
        padding: const EdgeInsets.all(20),
        cardColor: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Customer Details:",
                  style: TextStyle(
                      color: ThemeConfig.MAIN_TEXT_COLOR,
                      fontSize: ThemeConfig.HEADING_SIZE,
                      fontWeight: FontWeight.bold),
                ),
                FoodBossButtons(
                    text: "View More Details",
                    color: Colors.white,
                    bradius: 0,
                    textcolor: Conifg.primaryColor,
                    fsize: ThemeConfig.NOTIFICATION_SIZE,
                    op: op,
                    type: '',
                    bwidth: 0)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "$name",
                  style: const TextStyle(
                      color: ThemeConfig.MAIN_TEXT_COLOR,
                      fontSize: ThemeConfig.DESCRIPTION_SIZE,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.00),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  constraints: const BoxConstraints(minWidth: 100, maxWidth: 300),
                  child: Text(
                    "$address",
                    style: const TextStyle(
                        color: ThemeConfig.MAIN_TEXT_COLOR,
                        fontSize: ThemeConfig.DESCRIPTION_SIZE,
                      fontWeight: FontWeight.normal,
                        letterSpacing: 1.00),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "$phoneNumber",
                  style: const TextStyle(
                      color: ThemeConfig.MAIN_TEXT_COLOR,
                      fontSize: ThemeConfig.DESCRIPTION_SIZE,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.00),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "",
                  
                ),
                Text(
                  "Total Pending Amount: $totalPendingAmount",
                  style: const TextStyle(
                      color: ThemeConfig.MAIN_TEXT_COLOR,
                      fontSize: ThemeConfig.DESCRIPTION_SIZE,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.00),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    // margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: ThemeConfig.FORM_COLOR,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: const SmallRoundedInputField(hintText: 'Amount')
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                    flex: 2,
                    child: FoodBossButtons(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        text: "Paid",
                        color: Conifg.primaryColor,
                        bradius: 29,
                        textcolor: Colors.white,
                        fsize: ThemeConfig.DESCRIPTION_SIZE,
                        op: () {},
                        type: 'filled',
                        bwidth: 0)),
              ],
            )
          ],
        ),
        margin: const EdgeInsets.all(10.0),
        op: () {});
  }
}
