import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/screens/add_orders/add_orders.dart';

import 'package:rider_app/widgets/food%20boss%20card/food_boss_card.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:rider_app/widgets/text_widgets/title_subtitle.dart';
import 'package:shared_widgets/shared_widgets.dart';

class PreviousPlan extends StatelessWidget {
  const PreviousPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         foregroundColor: ThemeConfig.WHITE_COLOR,
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        elevation: 0,
        title: const Text("Plan history"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 550.00),

                child: Column(
          children:  const [
                // TitleSubTitle(title: '332', subtitle: 'Orders left'),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20.0,left: 20.0, right: 20.0),
                //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
                //     Column(crossAxisAlignment: CrossAxisAlignment.start,
                //       children: const [
                //         MainLabelText( titleString: '12',),
                //         Desc( descString: 'Orders Left',),
                //       ],
                //     ),
                //     Column(crossAxisAlignment: CrossAxisAlignment.end,
                //       children: const [
                //         MainLabelText( titleString: '\u{20B9} 550',),
                //         Desc( descString: 'Previous Plan',),
                //       ],
                //     ),

                //   ],),
                // ),

                // const Padding(
                //   padding: EdgeInsets.only(left: 20.0, right: 20.0),
                //   child: Divider(),
                // ),
                
                PlanCard(amount: "\u{20B9} 210", time: "July 2020", points: "30 Orders", rate: '7',),
                PlanCard(amount: "\u{20B9} 500", time: "July 2020", points: "100 Orders", rate: '5',),
                PlanCard(amount: "\u{20B9} 800", time: "July 2020", points: "160 Orders", rate: '5',),
                PlanCard(amount: "\u{20B9} 210", time: "July 2020", points: "30 Orders", rate: '7',),
          ],
        ),
              ),
            )),
      ),
      //   floatingActionButton: FloatingActionButton(
      //   backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
      //   onPressed: () {
      //     Get.to(const AddOrders());
      //   },
      //   child: const Icon(Icons.add, color: ThemeConfig.WHITE_COLOR),
      // ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String amount;
  final String time;
  final String points;
  final String rate;
  const PlanCard(
      {Key? key,
      required this.amount,
      required this.time,
      required this.points, required this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FoodBossCard(
      list: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainLabelText(titleString: points),
            const SizedBox(height: 10.00),
             const Desc(
              descString: "Plan",
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MainLabelText(titleString: amount),
            const SizedBox(height: 10.00),
            Desc(
              descString: time,
            ),
          ],
        ),
        Row(
          children: [
            Expanded(flex: 1,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
              Desc(
                descString: "Payment Mode",
              ),
              SizedBox(height: 10.00),
              Desc(
                descString: "Reference Number",
              ),
                      ],
                    ),
            ),
        Expanded(flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Desc(
                descString: "UPI",
              ),
              SizedBox(height: 10.00),
              Desc(
                descString: 'BD5346DDJG',
              ),
            ],
          ),
        ),
          ],
        ),
      ],
    );
  }
}
