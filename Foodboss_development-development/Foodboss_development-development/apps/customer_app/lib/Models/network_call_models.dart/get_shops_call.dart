import 'package:customer_app/Models/shop_model.dart';

class GetShopsCall {
  bool? success;
  List<ShopModel>? data;

  GetShopsCall({this.success, this.data});

  GetShopsCall.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <ShopModel>[];
      json['data'].forEach((v) {
        data!.add(ShopModel.fromCategories(v));
      });
    }
  }
}