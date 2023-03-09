import 'package:customer_app/Models/shop_model.dart';

class GetStoreListFromSearch {
  bool? success;
  List<ShopModel>? data;

  GetStoreListFromSearch({this.success, this.data});

  GetStoreListFromSearch.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <ShopModel>[];
      json['data'].forEach((v) {
        data!.add(ShopModel.forNearbySearch(v));
      });
    }
  }
}