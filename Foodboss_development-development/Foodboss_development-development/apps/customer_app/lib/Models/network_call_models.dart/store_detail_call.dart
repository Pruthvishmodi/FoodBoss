import 'package:customer_app/Models/shop_model.dart';

class StoreDetailCall {
  bool? success;
  ShopModel? data;

  StoreDetailCall({this.success, this.data});

  StoreDetailCall.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? ShopModel.fromStoreDetailCall(json['data'])
        : null;
  }

  StoreDetailCall.fromRouteJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? ShopModel.fromRouterCall(json['data']) : null;
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
