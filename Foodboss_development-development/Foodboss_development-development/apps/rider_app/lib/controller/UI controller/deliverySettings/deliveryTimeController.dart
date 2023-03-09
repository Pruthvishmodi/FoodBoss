import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class DeliveryTimeController extends GetxController {
  var time1 = const TimeOfDay(hour: 10, minute: 00).obs;
  var time2 = const TimeOfDay(hour: 16, minute: 00).obs;

  // var startTime1 = const TimeOfDay(hour: 10, minute: 00);
  // var endTime1 = const TimeOfDay(hour: 16, minute: 00);

  // var startTime2 = const TimeOfDay(hour: 10, minute: 00);
  // var endTime2 = const TimeOfDay(hour: 16, minute: 00);

  // var startTime3 = const TimeOfDay(hour: 10, minute: 00);
  // var endTime3 = const TimeOfDay(hour: 16, minute: 00);

  var deliveryTimes = <DeliveryTime>[].obs;

  List<DeliveryTime> get listOfDeliveryTimes => deliveryTimes.value;

  // var times = 0.obs;

  addNewTime() {
    if (deliveryTimes.value.length < 3) {
      deliveryTimes.value.add(DeliveryTime(
          id: Random.secure().nextInt(10000),
          StartTime: TimeOfDay(hour: 10, minute: 00),
          EndTime: TimeOfDay(hour: 16, minute: 00)));

      print('helo');
      deliveryTimes.refresh();
    } else {
      return;
    }
  }

  removeTime(DeliveryTime time) {
    print('remove');
    deliveryTimes.value.remove(time);
    // deliveryTimes.value.removeAt(
    //     deliveryTimes.value.indexWhere((element) => element.id == id));
        deliveryTimes.refresh();
    // times.value--;
  }

  // get getTime1 => time1.value;
  // get getTime2 => time2.value;

  String getstartTime(BuildContext c, int id) {
    MaterialLocalizations localizations = MaterialLocalizations.of(c);
    String s = localizations
        .formatTimeOfDay(
            deliveryTimes
                .value[deliveryTimes.value
                    .indexWhere((element) => element.id == id)]
                .StartTime,
            alwaysUse24HourFormat: true)
        .toString();
    // deliveryTimes.refresh();
    return s;
  }

  String getendTime(BuildContext c, int id) {
    MaterialLocalizations localizations = MaterialLocalizations.of(c);
    String s = localizations
        .formatTimeOfDay(
            deliveryTimes
                .value[deliveryTimes.value
                    .indexWhere((element) => element.id == id)]
                .EndTime,
            alwaysUse24HourFormat: true)
        .toString();
    // deliveryTimes.refresh();
      
    return s;
  }

  String getTimeFromPicker(
    c,
    int i,
  ) {
    MaterialLocalizations localizations = MaterialLocalizations.of(c);
    if (i == 1) {
      return localizations.formatTimeOfDay(time1.value,
          alwaysUse24HourFormat: true);
    } else {
      return localizations.formatTimeOfDay(time2.value,
          alwaysUse24HourFormat: true);
    }
  }

  setTimetoValue(BuildContext c, int id, int i) async {
    TimeOfDay? time = await showTimePicker(
        context: c,
        initialTime: time1.value,
        builder: (c, Widget? child) {
          return MediaQuery(
              data: 
               MediaQuery.of(c).copyWith(
                 alwaysUse24HourFormat: false
                ),
              child: child ?? Container());
        });

    if (time != null) {
      i == 0
          ? deliveryTimes
              .value[
                  deliveryTimes.value.indexWhere((element) => element.id == id)]
              .StartTime = time
          : deliveryTimes
              .value[
                  deliveryTimes.value.indexWhere((element) => element.id == id)]
              .EndTime = time;
    }
    deliveryTimes.refresh();
    deliveryTimes.value.map((element) => print(element.StartTime));
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class DeliveryTime {
  final int id;
  TimeOfDay StartTime;
  TimeOfDay EndTime;

  DeliveryTime(
      {required this.id, required this.StartTime, required this.EndTime});

  String getstartTime(BuildContext c) {
    MaterialLocalizations localizations = MaterialLocalizations.of(c);
    String s = localizations
        .formatTimeOfDay(StartTime, alwaysUse24HourFormat: true)
        .toString();
    return s;
  }

  String getendTime(BuildContext c) {
    MaterialLocalizations localizations = MaterialLocalizations.of(c);
    String s = localizations
        .formatTimeOfDay(EndTime, alwaysUse24HourFormat: true)
        .toString();
    return s;
  }

  // setStartTime(time) {
  //   StartTime = time;
  // }

  // setEndTime(time) {
  //   EndTime = time;
  // }
}
