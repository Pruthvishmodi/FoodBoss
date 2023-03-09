import 'package:flutter/material.dart';

import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/food%20boss%20button/food_boss_button.dart';
import 'package:seller_app/widgets/food%20boss%20card/food_boss_card.dart';
import 'package:seller_app/widgets/product%20list/product_list.dart';

class OrderSummaryPdf extends StatelessWidget {
  final String type;
  const OrderSummaryPdf({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        elevation: 0,
        title: const Text("Order Summary"),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text("Order Status: "),
                        Text(
                          "Pending",
                          style:
                              TextStyle(color: ThemeConfig.DISTRUCTIVE_COLOR),
                        ),
                      ],
                    ),
                    FoodBossButtons(
                        width: 40,
                        height: 40,
                        text: "",
                        isIcon: true,
                        icon: Icons.more_vert,
                        color: Colors.grey.shade50,
                        bradius: 40,
                        textcolor: Colors.black,
                        fsize: ThemeConfig.TITLE_SIZE,
                        op: () {},
                        type: 'filled',
                        bwidth: 0)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Order: #48126725",
                            style: TextStyle(
                                color: ThemeConfig.MAIN_TEXT_COLOR,
                                fontSize: ThemeConfig.TITLE_SIZE,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.00),
                          ),
                          Text(
                            "Rs.5000",
                            style: TextStyle(
                                color: ThemeConfig.MAIN_TEXT_COLOR,
                                fontSize: ThemeConfig.TITLE_SIZE,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.00),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "16/08/2021 - 4:33 PM",
                            style: TextStyle(
                                color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                fontSize: ThemeConfig.DESCRIPTION_SIZE,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1.00),
                          ),
                          Text(
                            "14 items",
                            style: TextStyle(
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
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: unnecessary_string_interpolations
                            Text(
                              "Time Slot:",
                              style: TextStyle(
                                  color: ThemeConfig.MAIN_TEXT_COLOR,
                                  fontSize: const AdaptiveTextSize()
                                      .getadaptiveTextSize(context,
                                          ThemeConfig.NOTIFICATION_SIZE),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.00),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "01 September 2020, 10:00Am-11:00Am",
                              style: TextStyle(
                                  color: ThemeConfig.DISTRUCTIVE_COLOR,
                                  fontSize: const AdaptiveTextSize()
                                      .getadaptiveTextSize(context,
                                          ThemeConfig.NOTIFICATION_SIZE),
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1.00),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              // FoodBossCard(
              //     borderRadius: 20,
              //     padding: const EdgeInsets.all(20),
              //     cardColor: Colors.white,
              //     width: MediaQuery.of(context).size.width,
              //     child: Column(
              //       children: const [
              //         //product list

              //         ProductList(),

              //         ProductList(),

              //         ProductList(),

              //         SizedBox(
              //           height: 15,
              //         ),

              //       ],
              //     ),
              //     op: () {},
              //     margin: const EdgeInsets.all(8)),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Customer Comments:",
                          // ignore: unnecessary_const
                          style: const TextStyle(
                              color: ThemeConfig.MAIN_TEXT_COLOR,
                              fontSize: ThemeConfig.SUB_TITLE_SIZE,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.00),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //                 Container(
                        //   decoration: BoxDecoration(border: Border.all(width: 1,color: ThemeConfig.PRIMARY_COLOR)),
                        //   child: Expanded(
                        //     child: Text(
                        //       "Are you facing any issues while using our mobile application ? ",
                        //       textAlign: TextAlign.left,
                        //       overflow: TextOverflow.ellipsis,
                        //       style: TextStyle(fontSize: const AdaptiveTextSize().getadaptiveTextSize(context, ThemeConfig.NOTIFICATION_SIZE,),color: ThemeConfig.MAIN_TEXT_COLOR),
                        //       maxLines: 2,
                        //     ),
                        //   ),
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width * .90,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            // ignore: unnecessary_const
                            child: Text(
                              "If something is not available than please contact me immediately.",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                  fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1.00),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Order Total: ",
                      style: TextStyle(
                          color: ThemeConfig.SECONDARY_TEXT_COLOR,
                          fontSize: ThemeConfig.SUB_TITLE_SIZE,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.00),
                    ),
                    const Text(
                      "Rs15.43",
                      style: TextStyle(
                          color: ThemeConfig.SECONDARY_TEXT_COLOR,
                          fontSize: ThemeConfig.SUB_TITLE_SIZE,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.00),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Delivery Charges:",
                      style: TextStyle(
                          color: ThemeConfig.SECONDARY_TEXT_COLOR,
                          fontSize: ThemeConfig.SUB_TITLE_SIZE,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.00),
                    ),
                    const Text(
                      "Free",
                      style: TextStyle(
                          color: ThemeConfig.SECONDARY_TEXT_COLOR,
                          fontSize: ThemeConfig.SUB_TITLE_SIZE,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.00),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Divider(),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Total:",
                      style: TextStyle(
                          color: ThemeConfig.MAIN_TEXT_COLOR,
                          fontSize: ThemeConfig.SUB_TITLE_SIZE,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.00),
                    ),
                    const Text(
                      "Rs847",
                      style: TextStyle(
                          color: ThemeConfig.MAIN_TEXT_COLOR,
                          fontSize: ThemeConfig.HEADING_SIZE,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.00),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
