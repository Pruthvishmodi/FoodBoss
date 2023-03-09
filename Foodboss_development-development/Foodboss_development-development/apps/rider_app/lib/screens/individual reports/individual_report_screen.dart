import 'package:flutter/material.dart';


import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/food%20boss%20card/food_boss_card.dart';

import 'package:rider_app/widgets/individual%20report%20card/individual_report_card.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/distructive_text.dart';
import 'package:rider_app/widgets/text_widgets/heading_widget.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:rider_app/widgets/text_widgets/title_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class IndividualReports extends StatelessWidget {
  const IndividualReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeConfig.WHITE_COLOR,
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        elevation: 0,
        title: const Text("January 2022 Report"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 550),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     TitleText(titleString: '3650 Orders'),
              //     TitleText(titleString: '\u{20B9} 1,65,555 '),

              //   ],
              // )
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const MainLabelText(titleString: '3650 Orders'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const MainLabelText(titleString: '\u{20B9} 1,65,555 '),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Desc(descString: "3595 Items Delivered"),
                      SizedBox(height: 3.00),
                      Desc(descString: "55 Items returned"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Desc(descString: "17,564 Items Sold "),
                      SizedBox(height: 3.00),
                      // Desc(descString: "56KG Net Weight"),
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),

              FoodBossCard(
      list: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MainLabelText(titleString: 'COD'),
            SizedBox(height: 10.00),
            Desc(
              descString: 'Delivered',
            ),
            SizedBox(height: 10.00),
            Desc(
              descString: 'Returned',
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            MainLabelText(titleString: '3412 Orders'),
            SizedBox(height: 10.00),
            Desc(
              descString: '3250 Items',
            ),
            SizedBox(height: 10.00),
            Desc(
              descString: '162 Items',
            ),
          ],
        ),
        Row(
          children: const [
             DistructiveText(
               titleString: '\u{20B9}98,540 Revenue in Total',
             ),
            
          ],
        ),
      ],
    ),
    
              FoodBossCard(
      list: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MainLabelText(titleString: 'KHATA'),
            SizedBox(height: 10.00),
            Desc(
              descString: 'Delivered',
            ),
            SizedBox(height: 10.00),
            Desc(
              descString: 'Returned',
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            MainLabelText(titleString: '23 Orders'),
            SizedBox(height: 10.00),
            Desc(
              descString: '23 Items',
            ),
            SizedBox(height: 10.00),
            Desc(
              descString: '0 Items',
            ),
          ],
        ),
        Row(
          children: const [
             DistructiveText(
               titleString: '\u{20B9}6,540 Revenue in Total',
             ),
            
          ],
        ),
      ],
    ),
    FoodBossCard(
      list: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MainLabelText(titleString: 'POD'),
            SizedBox(height: 10.00),
            Desc(
              descString: 'Delivered',
            ),
            SizedBox(height: 10.00),
            Desc(
              descString: 'Returned',
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            MainLabelText(titleString: '3412 Orders'),
            SizedBox(height: 10.00),
            Desc(
              descString: '3250 Items',
            ),
            SizedBox(height: 10.00),
            Desc(
              descString: '162 Items',
            ),
          ],
        ),
        Row(
          children: const [
             DistructiveText(
               titleString: '\u{20B9}98,540 Revenue in Total',
             ),
            
          ],
        ),
      ],
    ),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         alignment: Alignment.centerLeft,
            //         child: const MainLabelText(titleString: 'COD:'),
            //       ),
            //       Container(
            //         alignment: Alignment.centerLeft,
            //         child: const MainLabelText(titleString: '3412 Orders'),
            //       ),
            //     ],
            //   ),
            //   const SizedBox(
            //     height: 10,
            //   ),
            //   Row(children: [
            //     Expanded(
            //       flex: 1,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: const [
            //           Desc(descString: "Delivered:"),
            //           SizedBox(height: 3.00),
            //           Desc(descString: "Returned:"),
            //         ],
            //       ),
            //     ),
            //     Expanded(
            //       flex: 1,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         children: const [
            //           Desc(descString: "3,250 Items"),
            //           SizedBox(height: 3.00),
            //           Desc(descString: "162 Items"),
            //         ],
            //       ),
            //     ),
            //   ]),
            //   const SizedBox(height: 3.00),
            //   const LabelText(titleString: '\u{20B9}6,540 Revenue in Total'),

            //   const SizedBox(
            //     height: 30,
            //   ),
            //  Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         alignment: Alignment.centerLeft,
            //         child: const MainLabelText(titleString: 'KHATA:'),
            //       ),
            //       Container(
            //         alignment: Alignment.centerLeft,
            //         child: const MainLabelText(titleString: '23 Orders'),
            //       ),
            //     ],
            //   ),
            //   const SizedBox(
            //     height: 10,
            //   ),
            //   Row(children: [
            //     Expanded(
            //       flex: 1,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: const [
            //           Desc(descString: "Delivered:"),
            //           SizedBox(height: 3.00),
            //           Desc(descString: "Returned:"),
            //         ],
            //       ),
            //     ),
            //     Expanded(
            //       flex: 1,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         children: const [
            //           Desc(descString: "23 Items"),
            //           SizedBox(height: 3.00),
            //           Desc(descString: "0 Items"),
            //         ],
            //       ),
            //     ),
            //   ]),
            //   const SizedBox(height: 3.00),
            //   const LabelText(titleString: '\u{20B9}6,540 Revenue in Total'),
            ],
          ),
        )),
      ),
    );
  }
}
