import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class ReportDatePickerController extends GetxController {
  var startDate = 'From'.obs;
  var endDate = 'To'.obs;

  get getStartDate => startDate.value;
  get getEndDate => endDate.value;
  setDate(BuildContext c, int i) async {
    final date = await showDatePicker(
        context: c,
        initialDate: DateTime(2010,1,1),
        firstDate: DateTime(2010,1,1),
        lastDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.year,
        builder: (c, Widget? child) {
          return Theme(
              data: ThemeData(
                primaryColor: ThemeConfig.PRIMARY_COLOR,
              ),
              child: child ?? Container());
        });

    if (date != null) {
      if(i ==0){
        startDate.value = "${date.day.toString()}-${date.month.toString().padLeft(2,'0')}-${date.year.toString().padLeft(2,'0')}";
      }else{
        endDate.value = "${date.day.toString()}-${date.month.toString().padLeft(2,'0')}-${date.year.toString().padLeft(2,'0')}";
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
