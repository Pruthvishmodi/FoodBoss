import 'package:rider_app/models/SupportRequestModel.dart';
import 'package:rider_app/models/help_category_model.dart';
import 'package:rider_app/models/earning/my_earning_model.dart';
import 'package:rider_app/models/order/shipped_code_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class ShippedCodeCall {
  static sendMyCode(ShippedCodeModel request) async {
    var response =
        await Request.postData(Urls.SHIPPEDCODEURL, request.toJson(), true);
    print(response);
    if (response.statusCode == 200) { 
      print('data added');
      return true;
    } else {
      return false;
    }
  }
}
