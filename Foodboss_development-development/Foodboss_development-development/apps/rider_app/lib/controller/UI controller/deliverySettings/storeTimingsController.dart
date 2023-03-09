import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreTimingsController extends GetxController {
  var time1 = TimeOfDay(hour: 10, minute: 00).obs;
  var time2 = TimeOfDay(hour: 16, minute: 00).obs;

  get getTime1 => time1.value;
  get getTime2 => time2.value;

  String getTime(c, int i) {
    MaterialLocalizations localizations = MaterialLocalizations.of(c);
    if (i == 1) {
      return localizations.formatTimeOfDay(time1.value,
          alwaysUse24HourFormat: false);
    } else {
      return localizations.formatTimeOfDay(time2.value,
          alwaysUse24HourFormat: false);
    }
  }

  setTime(BuildContext c, int i) async {
    print(getTime(c, i));
    TimeOfDay? time = await showTimePicker(
        context: c,
        initialTime: TimeOfDay(
            hour: int.parse(getTime(c, i).split(':')[0]),
            minute: int.parse(getTime(c, i).split(' ')[0].split(':')[1])),
        builder: (c, Widget? child) {
          return MediaQuery(
              data: MediaQuery.of(c).copyWith(alwaysUse24HourFormat: false),
              child: child ?? Container());
        });

    if (time != null) {
      if (i == 1) {
        time1.value = time;
      } else if (i == 2) {
        time2.value = time;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
