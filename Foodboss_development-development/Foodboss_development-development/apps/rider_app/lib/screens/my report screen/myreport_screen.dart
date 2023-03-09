import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:rider_app/controller/UI%20controller/MyReportScreen/reportDatePickerController.dart';
import 'package:rider_app/screens/my%20report%20screen/report_card.dart';
import 'package:rider_app/widgets/TextFieldContainer.dart';
import 'package:shared_widgets/shared_widgets.dart';

class MyReports extends StatelessWidget {
  const MyReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportDatePickerController controller = Get.put(ReportDatePickerController(),permanent: false);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
                    height: 10,
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
              child: Obx( () =>Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          controller.setDate(context, 0);
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
                                  borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MAX),
                                ),
                                child:  Text(controller.getStartDate),
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          controller.setDate(context, 1);
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
                                  borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MAX),
                                ),
                                child:  Text(controller.getEndDate),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const ReportCard(
                amount: "10,00,000", time: "July 2020", points: "350"),
            const ReportCard(
                amount: "10,00,000", time: "July 2020", points: "350"),
            const ReportCard(
                amount: "10,00,000", time: "July 2020", points: "350"),
            const ReportCard(
                amount: "10,00,000", time: "July 2020", points: "350"),
            const ReportCard(
                amount: "10,00,000", time: "July 2020", points: "350"),
            const ReportCard(
                amount: "10,00,000", time: "July 2020", points: "350"),
            const ReportCard(
                amount: "10,00,000", time: "July 2020", points: "350"),
            const ReportCard(
                amount: "10,00,000", time: "July 2020", points: "350"),
            const ReportCard(
                amount: "10,00,000", time: "July 2020", points: "350"),
            const ReportCard(
                amount: "10,00,000", time: "July 2020", points: "350"),
            const ReportCard(
                amount: "10,00,000", time: "July 2020", points: "350"),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
