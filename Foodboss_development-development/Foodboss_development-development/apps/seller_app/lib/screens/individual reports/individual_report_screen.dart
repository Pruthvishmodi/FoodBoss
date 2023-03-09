import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/reports/report_controller.dart';
import 'package:seller_app/utils/states.dart';

import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/food%20boss%20card/food_boss_card.dart';

import 'package:seller_app/widgets/individual%20report%20card/individual_report_card.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/distructive_text.dart';
import 'package:seller_app/widgets/text_widgets/heading_widget.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:seller_app/widgets/text_widgets/title_widget.dart';

class IndividualReports extends StatelessWidget {
  IndividualReports({Key? key}) : super(key: key);
  var args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    var start = args[0];
    var end = args[1];

    ReportController controllerReport =
        Get.put(ReportController(), permanent: false);
    Size size = MediaQuery.of(context).size;

    return Obx(() {
      if (controllerReport.reportDetailsStates == States.SUCCESS_STATE) {
        var list = controllerReport.reportDetails.value.data;
        return Scaffold(
          appBar: AppBar(
            foregroundColor: ThemeConfig.WHITE_COLOR,
            backgroundColor: ThemeConfig.PRIMARY_COLOR,
            elevation: 0,
            title: Text("${start} to ${end}"),
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: MainLabelText(
                              titleString: '${list!.orders} Orders'),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: MainLabelText(
                              titleString: '\u{20B9} ${list.totalAmount} '),
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
                        children: [
                          Desc(
                              descString:
                                  "${list.totalDeliveredItems} Items Delivered"),
                          SizedBox(height: 3.00),
                          Desc(
                              descString:
                                  "${list.totalReturnedItems} Items returned"),
                        ],
                      ),
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    //     children: const [
                    //       Desc(descString: "${list.} Items Sold "),
                    //       SizedBox(height: 3.00),
                    //       // Desc(descString: "56KG Net Weight"),
                    //     ],
                    //   ),
                    // ),
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
                        children: [
                          MainLabelText(
                              titleString:
                                  '${list.cod!.totalCodOrders} Orders'),
                          SizedBox(height: 10.00),
                          Desc(
                            descString: '${list.cod!.totalCodDelivered} Items',
                          ),
                          SizedBox(height: 10.00),
                          Desc(
                            descString: '${list.cod!.totalCodReturned} Items',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DistructiveText(
                            titleString:
                                '\u{20B9}${list.cod!.totalCodAmount} Revenue in Total',
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
                        children: [
                          MainLabelText(
                              titleString:
                                  '${list.khata!.totalKhataOrders} Orders'),
                          SizedBox(height: 10.00),
                          Desc(
                            descString:
                                '${list.khata!.totalKhataDelivered} Items',
                          ),
                          SizedBox(height: 10.00),
                          Desc(
                            descString:
                                '${list.khata!.totalKhataReturned} Items',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DistructiveText(
                            titleString:
                                '\u{20B9}${list.khata!.totalKhataAmount} Revenue in Total',
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
                        children: [
                          MainLabelText(
                              titleString:
                                  '${list.pod!.totalPodOrders} Orders'),
                          SizedBox(height: 10.00),
                          Desc(
                            descString: '${list.pod!.totalPodDelivered} Items',
                          ),
                          SizedBox(height: 10.00),
                          Desc(
                            descString: '${list.pod!.totalPodReturned} Items',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DistructiveText(
                            titleString:
                                '\u{20B9}${list.pod!.totalPodAmount} Revenue in Total',
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
      } else {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: ThemeConfig.WHITE_COLOR,
            backgroundColor: ThemeConfig.PRIMARY_COLOR,
            elevation: 0,
            title: Text("Report"),
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
