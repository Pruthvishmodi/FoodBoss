import 'package:get/get.dart';

class OpenDaysController extends GetxController {
  var days = {
    'Sunday': false,
    'Monday': true,
    'Tuesday': true,
    'Wednesday': true,
    'Thursday': true,
    'Friday': true,
    'Saturday': false,
  }.obs;

  get getDays => days.value;

  bool getDayState(day) {
    return days[day]!;
  }

  changeDayState(String day) {
    if (days.containsKey(day)) {
      days[day] = !days[day]!;
    } else {
      return;
    }
  }
}
// class DayDataType{
//   String dayName;
//   bool isSelected;
//   DayDataType(this.dayName,this.isSelected);
// }