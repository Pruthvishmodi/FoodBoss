import 'package:customer_app/Models/product_model.dart';

class CatwiseProductCall {
  bool? success;
  List<Product>? data;
  String? currentPageUrl;
  String? nextPageUrl;
  int? total;

  CatwiseProductCall(
      {this.success,
      this.data,
      this.currentPageUrl,
      this.nextPageUrl,
      this.total});

  CatwiseProductCall.fromJson(Map<String, dynamic> json,{int q=0}) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(Product.fromJson(v,quant: q));
      });
    }
    currentPageUrl = json['current_page_url'];
    nextPageUrl = json['next_page_url'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['current_page_url'] = this.currentPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['total'] = this.total;
    return data;
  }
}