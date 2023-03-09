import 'package:customer_app/Models/network_call_models.dart/ongoing_order_call.dart';

class GetOrderDetails {
  bool? success;
  OrderModel? data;

  GetOrderDetails({this.success, this.data});

  GetOrderDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? OrderModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}