import 'package:customer_app/Models/shop_model.dart';

class GetFavStoreCall {
  bool? success;
  List<ShopModel>? stores;

  GetFavStoreCall({this.success, this.stores});

  GetFavStoreCall.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      stores = <ShopModel>[];
      json['data'].forEach((v) {
        stores!.add(ShopModel.fromFavStoreCall(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (stores != null) {
      data['data'] = stores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}