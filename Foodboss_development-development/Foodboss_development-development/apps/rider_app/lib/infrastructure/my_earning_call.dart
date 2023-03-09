import 'package:rider_app/models/earning/my_earning_list_model.dart';
import 'package:rider_app/models/earning/my_earning_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class EarningCall {
  static sendMyEarningTime(MyEarningModel request) async {
    print('abcd ${request.toJson()}');
    var response =
        await Request.postData(Urls.MYEARNINGREQUEST, request.toJson(), true);
    print(response);
    if (response.statusCode == 200) {
      print('data added');
      return MyEarningListModel.fromJson(response.data);
    } else {
      return false;
    }
  }
}
