import 'package:rider_app/models/order/new_order_model.dart';
import 'package:rider_app/models/order/new_order_store_model.dart';
import 'package:rider_app/models/privacy_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class NewOrderCall {
  static getNewOrder() async {
    var response = await Request.getData(Urls.NEWORDERURL, true);
    // print(response);
    // print(response['success']);
    if (response.statusCode == 200) {
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var newOrder = NewOrderModel.fromJson(response.data);
      return newOrder;
    } else {
      return null;
    }
  }
  static getNewOrderbyStore(int id) async {
    var response = await Request.getData(Urls.NEWORDERBYSTOREURL(id), true);
    // print(response);
    // print(response['success']);
    if (response.statusCode == 200) {
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var newOrder = NewOrderByStoreModel.fromJson(response.data);
      return newOrder;
    } else {
      return null;
    }
  }
}
