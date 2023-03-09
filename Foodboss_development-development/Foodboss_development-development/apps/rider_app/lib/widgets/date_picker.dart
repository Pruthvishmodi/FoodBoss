import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class StoreTimingsController extends GetxController{

  var selectedDate = DateTime.now().obs;
  var selectedDate2 = DateTime.now().obs;

  // var date2 = TimeOfDay(hour: 16, minute: 00).obs;



   get getDate1 => selectedDate.value;
  get getDate2 => selectedDate2.value;


  // String getTime(c,int i){
  // MaterialLocalizations localizations = MaterialLocalizations.of(c);
  //   if(i == 1){
  //       return localizations.formatTimeOfDay(selectedDate.value,alwaysUse24HourFormat: true);
  //     }else {
  //       return localizations.formatTimeOfDay(selectedDate2.value,alwaysUse24HourFormat: true);
  //     }
  // }

  _setDate(BuildContext c, int i) async{
    DateTime? dateTime = await showDatePicker(context: c, initialDate: selectedDate.value, firstDate: DateTime(2020), lastDate: DateTime(2022));

    if (dateTime != null && dateTime != selectedDate.value) {
      
        selectedDate.value = dateTime;
  
    }
  }

  @override
  void onInit() {
    
    super.onInit();
  }
}