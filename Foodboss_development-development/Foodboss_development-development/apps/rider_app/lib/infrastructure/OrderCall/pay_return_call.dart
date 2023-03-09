import 'package:rider_app/models/order/completed_order_model.dart';
import 'package:rider_app/models/order/new_order_model.dart';
import 'package:rider_app/models/order/pay_return_model.dart';
import 'package:rider_app/models/privacy_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class PayReturnCall {
  static getPayReturnOrder() async {
    var response = await Request.getData(Urls.PAYRETURNURL, true);
    // print(response);
    // print(response['success']);
    if (response.statusCode == 200) {
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var payReturnOrder = PayReturnModel.fromJson(response.data);
      return payReturnOrder;
    } else {
      return null;
    }
  }
}
