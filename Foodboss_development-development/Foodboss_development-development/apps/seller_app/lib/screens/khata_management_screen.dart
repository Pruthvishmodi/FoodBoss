import 'package:flutter/material.dart';
import 'package:seller_app/config/config.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/screens/individual_khata_user_detail.dart';
import 'package:seller_app/screens/khata_request.dart';
import 'package:seller_app/widgets/customer_details_card.dart';
import 'package:seller_app/widgets/food_boss_button.dart';
import 'package:seller_app/widgets/food_boss_card.dart';

class KhataManagement extends StatelessWidget {
  const KhataManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Conifg.primaryColor,
        elevation: 0,
        title: const Text("Khata Management"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Khata Amount: 15,800",
                    style: TextStyle(
                        color: ThemeConfig.MAIN_TEXT_COLOR,
                        fontSize: ThemeConfig.NOTIFICATION_SIZE,
                        fontWeight: FontWeight.bold),
                  ),
                  FoodBossButtons(
                    text: "New Khata Request(s): 4",
                    color: Conifg.primaryColor,
                    bradius: 20,
                    textcolor: Colors.white,
                    fsize: ThemeConfig.NOTIFICATION_SIZE,
                    op: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KhataRequest()),
                      );
                    },
                    type: 'filled',
                    bwidth: 0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomerDetailsCard(
              name: "Jay Soni",
              address: "Sarthak heavens",
              phoneNumber: 8238010502,
              totalPaidAmount: 3300,
              totalKhataAmount: 5500,
              lastPaidAmount: 2000,
              totalPendingAmount: 2000,
              op: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IndividualKhataUserDetails()),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomerDetailsCard(
              name: "Jay Soni",
              address: "Sarthak heavens",
              phoneNumber: 8238010502,
              totalPaidAmount: 3300,
              totalKhataAmount: 5500,
              lastPaidAmount: 2000,
              totalPendingAmount: 2000,
              op: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IndividualKhataUserDetails()),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        )),
      ),
    );
  }
}
