import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class StoreTimingsController extends GetxController {
  var time1 = const TimeOfDay(hour: 10, minute: 00).obs;
  var time2 = const TimeOfDay(hour: 16, minute: 00).obs;

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
    var times = i == 1 ? time1.value : time2.value;
    TimeOfDay? time = await showTimePicker(
        context: c,
        initialTime: times,
        builder: (c, Widget? child) {
          return MediaQuery(
              data: 
               MediaQuery.of(c).copyWith(
                 alwaysUse24HourFormat: false
                ),
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
