import 'package:customer_app/Models/product_model.dart';

class RandomProducts {
  bool? success;
  List<Product>? products;

  RandomProducts({this.success, this.products});

  RandomProducts.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      products = <Product>[];
      json['data'].forEach((v) {
        products!.add(Product.fromRandomProducts(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.products != null) {
      data['data'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

