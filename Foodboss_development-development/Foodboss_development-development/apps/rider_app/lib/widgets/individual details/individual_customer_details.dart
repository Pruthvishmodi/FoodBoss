import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/widgets/food%20boss%20card/food_boss_card.dart';

class IndividualDetails extends StatelessWidget {
  final String name;

  final String address;
  final double phoneNumber;
  const IndividualDetails({
    Key? key,
    required this.name,
    required this.address,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hello'),
    );
    // return  FoodBossCard(borderRadius: 20, padding: const EdgeInsets.all(20),  cardColor: Colors.white, width: MediaQuery.of(context).size.width,
    //           child: Column(
    //             children: [
    //               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 // ignore: prefer_const_literals_to_create_immutables
    //                 children: [
    //                   // ignore: prefer_const_constructors
    //                   Text("Customer Details",
    //                    // ignore: prefer_const_constructors
    //                    style: TextStyle(
    //                         color: ThemeConfig.MAIN_TEXT_COLOR,
    //                         fontSize: ThemeConfig.HEADING_SIZE,
    //                         fontWeight: FontWeight.normal),
    //                   ),

    //                    ],
    //               ),
    //                 const SizedBox(height: 10,),
    //               Row(
    //                 children: [
    //                   Text("Name: $name",
    //                   // ignore: prefer_const_constructors
    //                   style: TextStyle(
    //                         color: ThemeConfig.MAIN_TEXT_COLOR,
    //                         fontSize: ThemeConfig.DESCRIPTION_SIZE,
    //                         fontWeight: FontWeight.normal,
    //                         letterSpacing: 1.00),
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(height: 5,),
    //                Row(
    //                 children: [
    //                   Container(
    //                     width:  MediaQuery.of(context).size.width*.80,
    //                     constraints: const BoxConstraints(minWidth: 100, maxWidth: 400),
    //                     child: Text("Address: $address",
    //                     maxLines: 5,
    //                     style: const TextStyle(
    //                           color: ThemeConfig.MAIN_TEXT_COLOR,
    //                           fontSize: ThemeConfig.DESCRIPTION_SIZE,
    //                           fontWeight: FontWeight.normal,
    //                           letterSpacing: 1.00),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(height: 5,),
    //                Row(
    //                 children: [
    //                   Text("Phone Number: $phoneNumber",
    //                   style: const TextStyle(
    //                         color: ThemeConfig.MAIN_TEXT_COLOR,
    //                         fontSize: ThemeConfig.DESCRIPTION_SIZE,
    //                         fontWeight: FontWeight.normal,
    //                         letterSpacing: 1.00),
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(height: 5,),

    //            const Divider(),

    //            const SizedBox(height: 5,),

    //            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //              // ignore: prefer_const_literals_to_create_immutables
    //              children: [
    //                const Text("Start Date: 20/02/2021"),
    //                const Text("End Date:20/03/2021")

    //              ],

    //            ),

    //            const SizedBox(
    //              height: 10,
    //            ),

    //             Row(
    //               // ignore: prefer_const_literals_to_create_immutables
    //               children: [
    //                 const Text("Total Khata Amount:5,500")
    //               ],
    //             ),

    //             const SizedBox(height: 10,),

    //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               // ignore: prefer_const_literals_to_create_immutables
    //               children: [
    //                 const Text("Total Paid Amount:3,500"),
    //                 const Text("Last Paid Amount:2,500"),
    //               ],
    //             ),

    //             const SizedBox(
    //              height: 20,
    //            ),
    //            Row(
    //              // ignore: prefer_const_literals_to_create_immutables
    //              children: [
    //                const Text("Previous Payments:",
    //                style: TextStyle(
    //                         color: ThemeConfig.MAIN_TEXT_COLOR,
    //                         fontSize: ThemeConfig.HEADING_SIZE,
    //                         fontWeight: FontWeight.bold),
    //                )
    //              ],
    //            ),
    //             const SizedBox(height: 10,),
    //            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //              // ignore: prefer_const_literals_to_create_immutables
    //              children: [
    //                const Text("05/09/2020",style: TextStyle(
    //                         color: ThemeConfig.SECONDARY_TEXT_COLOR,
    //                         fontSize: ThemeConfig.DESCRIPTION_SIZE,
    //                         fontWeight: FontWeight.normal),),
    //                const Text("500",style: TextStyle(
    //                         color: ThemeConfig.SECONDARY_TEXT_COLOR,
    //                         fontSize: ThemeConfig.DESCRIPTION_SIZE,
    //                         fontWeight: FontWeight.normal),),

    //              ],
    //            ),

    //             const SizedBox(height: 5,),
    //            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //              // ignore: prefer_const_literals_to_create_immutables
    //              children: [
    //                const Text("10/09/2020",style: TextStyle(
    //                         color: ThemeConfig.SECONDARY_TEXT_COLOR,
    //                         fontSize: ThemeConfig.DESCRIPTION_SIZE,
    //                         fontWeight: FontWeight.normal),),
    //                const Text("800",style: TextStyle(
    //                         color: ThemeConfig.SECONDARY_TEXT_COLOR,
    //                         fontSize: ThemeConfig.DESCRIPTION_SIZE,
    //                         fontWeight: FontWeight.normal),),

    //              ],
    //            ),

    //             ],
    //           ),

    //           margin: const EdgeInsets.all(10.0), op: (){});
  }
}
