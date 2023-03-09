import 'package:rider_app/models/order/completed_order_model.dart';
import 'package:rider_app/models/order/new_order_model.dart';
import 'package:rider_app/models/privacy_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class CompletedOrderCAll {
  static getCompletedOrder() async {
    var response = await Request.getData(Urls.COMPLETEDORDERURL, true);
    // print(response);
    // print(response['success']);
    if (response.statusCode == 200) {
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var completedOrder = CompletedOrderModel.fromJson(response.data);
      return completedOrder;
    } else {
      return null;
    }
  }
}
