import 'package:flutter/material.dart';
import 'package:rider_app/config/config.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/widgets/food_boss_card.dart';
import 'package:rider_app/widgets/individual_report_card.dart';


class IndividualReports extends StatelessWidget {
  const IndividualReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(backgroundColor: Conifg.primaryColor,elevation: 0,
       title: const Text("January 2022 Report"),
     ),
     body: SingleChildScrollView(
       child: SafeArea(
         child: Column(
           children: [
             Row(),
             const SizedBox(
               height: 20.0,
             ),
             FoodBossCard(borderRadius: 20, padding: const EdgeInsets.all(20),  cardColor: Colors.white, width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text("Total Order: 3650",
                       style: TextStyle(
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            fontSize: ThemeConfig.HEADING_SIZE,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text("Total Delivered: 3595",
                      // ignore: unnecessary_const
                      style: const TextStyle(
                            color: ThemeConfig.SECONDARY_TEXT_COLOR,
                            fontSize: ThemeConfig.DESCRIPTION_SIZE,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.00),
                      ),
                      const Text("Total Returned: 55",
                      style: TextStyle(
                            color: ThemeConfig.SECONDARY_TEXT_COLOR,
                            fontSize: ThemeConfig.DESCRIPTION_SIZE,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.00),
                      ),

                    ],
                  ),
                 
                  const SizedBox(height: 3,),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text("Total Items Sold",
                      style: TextStyle(
                            color: ThemeConfig.SECONDARY_TEXT_COLOR,
                            fontSize: ThemeConfig.DESCRIPTION_SIZE,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.00),
                      ),
                      const Text("In Number: 17,564 Pcs",
                      style: TextStyle(
                            color: ThemeConfig.SECONDARY_TEXT_COLOR,
                            fontSize: ThemeConfig.DESCRIPTION_SIZE,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.00),
                      ),
                    ],
                  ),
                 
                  const SizedBox(height: 3,),
                   Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text("In Weight: 56KG",
                      style: TextStyle(
                            color: ThemeConfig.SECONDARY_TEXT_COLOR,
                            fontSize: ThemeConfig.DESCRIPTION_SIZE,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.00),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        
                      ),
                      const Text("Total Amount: 1,00,000",
                      style: TextStyle(
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            fontSize: ThemeConfig.DESCRIPTION_SIZE,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              
              margin: const EdgeInsets.all(10.0), op: (){}),
             
              


              




              IndividualReportCard(type: 'COD'),
              IndividualReportCard(type: "Prepaid"),
              IndividualReportCard(type: 'Khata'),








const SizedBox(height: 10,),


             
            ],
         )),
     ),
    );
  }
}
