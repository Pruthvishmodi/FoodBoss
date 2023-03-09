import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/my_earning_controller.dart';
import 'package:shared_widgets/shared_widgets.dart';

class ReportDatePickerController extends GetxController {
  EarningController earningcontroller =
      Get.put(EarningController(), permanent: false);

  var startDate = 'From'.obs;
  var endDate = 'To'.obs;

  get getStartDate => startDate.value;
  get getEndDate => endDate.value;

  // String getDate(c, int i) {
  //   MaterialLocalizations localizations = MaterialLocalizations.of(c);
  //   // if (i == 1) {
  //   //   return localizations.formatTimeOfDay(time1.value,
  //   //       alwaysUse24HourFormat: true);
  //   // } else {
  //   //   return localizations.formatTimeOfDay(time2.value,
  //   //       alwaysUse24HourFormat: true);
  //   // }
  // }

  setDate(BuildContext c, int i) async {
    final date = await showDatePicker(
        context: c,
        initialDate: DateTime(2022, 6, 1),
        firstDate: DateTime(2010, 1, 1),
        lastDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        builder: (c, Widget? child) {
          return MediaQuery(
              data: MediaQuery.of(c).copyWith(alwaysUse24HourFormat: true),
              child: child ?? Container());
        });

    if (date != null) {
      if (i == 0) {
        startDate.value =
            "${date.year.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString()}";
        earningcontroller.start(startDate.value);
        print(startDate.value);
      } else {
        endDate.value =
            "${date.year.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString()}";
        earningcontroller.end(endDate.value);
        await earningcontroller.sendSupportRequest();

        print(endDate.value);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
