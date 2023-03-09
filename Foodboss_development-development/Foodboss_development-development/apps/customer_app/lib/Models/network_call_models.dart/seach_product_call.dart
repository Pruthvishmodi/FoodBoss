import 'package:customer_app/Models/product_model.dart';

class SearchProductCall {
  bool? success;
  List<Product>? products;
  String? currentPageUrl;
  String? nextPageUrl;
  int? total;

  SearchProductCall(
      {this.success,
      this.products,
      this.currentPageUrl,
      this.nextPageUrl,
      this.total});

  SearchProductCall.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      products = <Product>[];
      json['data'].forEach((v) {
        products!.add(Product.fromSearchProducts(v));
      });
    }
    currentPageUrl = json['current_page_url'];
    nextPageUrl = json['next_page_url'];
    total = json['total'];
  }

  SearchProductCall.fromSearchJson(Map<String, dynamic> json) {
    success = json['success'];
    // error = json['error'];
    if (json['data'] != null) {
      products = <Product>[];
      json['data'].forEach((v) {
        products!.add(new Product.fromTestSeachJson(v));
      });
    }
  }


}