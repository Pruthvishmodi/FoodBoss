import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/reports/report_controller.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';

import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/UI%20controller/MyReportScreen/reportDatePickerController.dart';
import 'package:seller_app/screens/my%20report%20screen/report_card.dart';

class MyReports extends StatelessWidget {
  const MyReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportDatePickerController controller =
        Get.put(ReportDatePickerController(), permanent: false);
    ReportController controllerReport =
        Get.put(ReportController(), permanent: false);
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.021),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          controllerReport.setDate(context, 0);
                        },
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeConfig.WHITE_COLOR,
                            border: Border.all(
                                width: 1, color: ThemeConfig.PRIMARY_COLOR),
                            borderRadius: BorderRadius.circular(
                                ThemeConfig.BORDERRADIUS_MIN),
                          ),
                          child: Text(controllerReport.getStartDate),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          controllerReport.setDate(context, 1);
                        }, 
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeConfig.WHITE_COLOR,
                            border: Border.all(
                                width: 1, color: ThemeConfig.PRIMARY_COLOR),
                            borderRadius: BorderRadius.circular(
                                ThemeConfig.BORDERRADIUS_MIN),
                          ),
                          child: Text(controllerReport.getEndDate),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          controllerReport.getReportDetails(
                              controllerReport.startDate.toString(),
                              controllerReport.endDate.toString());
                          Get.toNamed(
                            "/reports/individual",
                          arguments: [controllerReport.startDate.toString(),controllerReport.endDate.toString() ]);
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeConfig.PRIMARY_COLOR,
                            border: Border.all(
                                width: 1, color: ThemeConfig.PRIMARY_COLOR),
                            borderRadius: BorderRadius.circular(
                                ThemeConfig.BORDERRADIUS_MIN),
                          ),
                          child: const Icon(
                            Icons.search,
                            color: ThemeConfig.WHITE_COLOR,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.021),
            Expanded(
              child: Obx(() {
                if (controllerReport.reportListStates.value ==
                    States.SUCCESS_STATE) {
                  print(controllerReport.listReport.value.reportList!.length);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        controllerReport.listReport.value.reportList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var list =
                          controllerReport.listReport.value.reportList![index];
                      return Container(
                        // width: size.width * 0.45,
                        child: ReportCard(
                            end: list.endDate.toString(),
                            start: list.startDate.toString(),
                            month: list.month.toString(),
                            year: list.year.toString(),
                            amount: list.amount.toString(),
                            time: list.endDate.toString(),
                            points: list.orders.toString()),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: const CircularProgressIndicator(),
                  );
                }
              }),
            ),

            // const SizedBox(
            //   height: 30,
            // ),
            // Row(children: [
            //   Expanded(
            //     child: Column(children: [
            //       ...[1, 2, 3, 4]
            //           .map((e) =>
            //               const PlanBuyCard(price: "201", orders: "30 Orders"))
            //           .toList(),
            //     ]),
            //   ),
            //   Expanded(
            //     child: Column(children: [
            //       ...[1, 2, 3, 4]
            //           .map((e) =>
            //               const PlanBuyCard(price: "201", orders: "30 Orders"))
            //           .toList(),
            //     ]),
            //   ),
            // ])
            // Row(
            //   children: [

            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
