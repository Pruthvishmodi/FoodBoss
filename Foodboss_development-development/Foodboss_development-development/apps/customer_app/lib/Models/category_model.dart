import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Models/shop_model.dart';

class Categories {
  bool? success;
  List<Category>? data;
  String? currentPageUrl;
  String? nextPageUrl;
  int? total;

  Categories(
      {this.success,
      this.data,
      this.currentPageUrl,
      this.nextPageUrl,
      this.total});

  Categories.fromStoreId(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Category>[];
      json['data'].forEach((v) {
        data!.add(Category.fromStoreId(v));
      });
    }
  }

  Categories.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Category>[];
      json['data'].forEach((v) {
        data!.add(Category.fromJson(v));
      });
    }
    currentPageUrl = json['current_page_url'];
    nextPageUrl = json['next_page_url'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['current_page_url'] = currentPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['total'] = total;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? photo;
  List<Product>? Products;
  List<Product>? filteredProducts;
  List<ShopModel>? listOfShops;
  String? nextPageUrl;

  Category({this.id, this.name, this.photo, this.listOfShops});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }

  Category.fromStoreId(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}
