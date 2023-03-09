import 'package:customer_app/Models/product_model.dart';

class GetFavFoodCall {
  bool? success;
  List<Product>? products;

  GetFavFoodCall({this.success, this.products});

  GetFavFoodCall.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      products = <Product>[];
      json['data'].forEach((v) {
        products!.add(Product.fromFavFoodCall(v));
      });
    }
  }

  
}