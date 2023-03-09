import 'package:rider_app/models/order/new_order_model.dart';
import 'package:rider_app/models/order/shipped_order_model.dart';
import 'package:rider_app/models/privacy_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class ShippedOrderCAll {
  static getShippedOrder() async {
    var response = await Request.getData(Urls.SHIPPEDORDERURL, true);
    // print(response);
    // print(response['success']);
    if (response.statusCode == 200) {
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var shippedOrder = ShippedOrderModel.fromJson(response.data);
      return shippedOrder;
    } else {
      return null;
    }
  }
}
