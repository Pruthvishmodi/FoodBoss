import 'package:customer_app/Models/product_model.dart';

class ProductDetailCall {
  bool? success;
  Product? product;

  ProductDetailCall({this.success, this.product});

  ProductDetailCall.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    product = json['data'] != null ? Product.fromFoodDetailsJson(json['data']) : Product();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.product != null) {
      data['data'] = this.product!.toJson();
    }
    return data;
  }
}