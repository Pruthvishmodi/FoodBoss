import 'package:flutter/material.dart';

import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/widgets/food%20boss%20button/food_boss_button.dart';
import 'package:rider_app/widgets/food%20boss%20card/food_boss_card.dart';

class IndividualReportCard extends StatelessWidget {
  final String type;

  const IndividualReportCard({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("heelo"),
    );
    // return FoodBossCard(
    //     borderRadius: 20,
    //     padding: const EdgeInsets.all(20),
    //     cardColor: Colors.white,
    //     width: MediaQuery.of(context).size.width,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Wrap(
    //           children: [
    //             Text(
    //               "Total $type Orders: 3412",
    //               style: const TextStyle(
    //                   color: ThemeConfig.MAIN_TEXT_COLOR,
    //                   fontSize: ThemeConfig.NOTIFICATION_SIZE,
    //                   fontWeight: FontWeight.normal,
    //                   letterSpacing: 1.00),
    //             ),
    //             Expanded(child: Container()),
    //             Text(
    //               "Total Delivered: 3250",
    //               style: const TextStyle(
    //                   color: ThemeConfig.MAIN_TEXT_COLOR,
    //                   fontSize: ThemeConfig.NOTIFICATION_SIZE,
    //                   fontWeight: FontWeight.normal,
    //                   letterSpacing: 1.00),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 5,
    //         ),
    //         Wrap(
    //           children: [
    //             Text(
    //               "Total Returned: 162",
    //               style: const TextStyle(
    //                   color: ThemeConfig.MAIN_TEXT_COLOR,
    //                   fontSize: ThemeConfig.NOTIFICATION_SIZE,
    //                   fontWeight: FontWeight.normal,
    //                   letterSpacing: 1.00),
    //             ),
    //             Expanded(child: Container()),
    //             Text(
    //               "Total $type Amount: 98,540",
    //               style: const TextStyle(
    //                   color: ThemeConfig.MAIN_TEXT_COLOR,
    //                   fontSize: ThemeConfig.NOTIFICATION_SIZE,
    //                   fontWeight: FontWeight.normal,
    //                   letterSpacing: 1.00),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 15,
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             const Text(
    //               "",
    //             ),
    //             FoodBossButtons(
    //                 text: "View More Details",
    //                 color: Colors.white,
    //                 bradius: 0,
    //                 textcolor: ThemeConfig.PRIMARY_COLOR,
    //                 fsize: ThemeConfig.NOTIFICATION_SIZE,
    //                 op: () {},
    //                 type: '',
    //                 bwidth: 0)
    //           ],
    //         ),
    //       ],
    //     ),
    //     margin: const EdgeInsets.all(10.0),
    //     op: () {});
  }
}
