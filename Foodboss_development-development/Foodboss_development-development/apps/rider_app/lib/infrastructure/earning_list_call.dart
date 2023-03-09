import 'package:rider_app/models/earning/my_earning_list_model.dart';
import 'package:rider_app/models/privacy_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class MyEarningListCall {
  static getEarningList() async {
    var response = await Request.getData(Urls.MYEARNINGREQUEST, false);
    // print(response);
    // print(response['success']);
    if (response.statusCode == 200) {
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var privacy = MyEarningListModel.fromJson(response.data);
      return privacy;
    } else {
      return null;
    }
  }
}
