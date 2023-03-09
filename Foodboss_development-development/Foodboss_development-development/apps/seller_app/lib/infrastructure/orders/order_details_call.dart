// import 'package:seller_app/models/dashboard_model.dart';
// import 'package:seller_app/models/orders/order_details_model.dart';
// import 'package:seller_app/models/plan_history.dart';

// import 'package:seller_app/utils/requests.dart';
// import 'package:seller_app/utils/urls.dart';

// class OrderDetailsCall {
//   static getOrderDetials() async {
//     var response = await Request.getData(Urls.ORDER_BY_STATUS, true);
//     // print(response);
//     // print(response['success']);
//     if (response.statusCode == 200) {
//       // final Map<String ,dynamic> responseData = json.decode(response.data);
//       var dashboard = OrderDetailsStatusModel.fromJson(response.data);
//       print(response.data);
//       return dashboard;
//     } else {
//       return null;
//     }
//   }
// }
