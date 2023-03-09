import 'package:customer_app/Models/product_model.dart';

class CartModel {
  bool? success;
  List<Store>? store;

  CartModel({this.success, this.store});

  CartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      store = <Store>[];
      json['data'].forEach((v) {
        store!.add(Store.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (store != null) {
      data['data'] = store!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Store {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? minimunOrderValue;
  String? fcmToken;
  String? let;
  String? lang;
  String? ratings;
  String? photo;
  double? distance;
  List<Product>? items;
  int? totalItems;
  int? totalPrice;
  int? totalDiscoutPrice;
  int? khataLimit;
  String? deliveryCharges;
  bool? isKhataAvailable;
  Store(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.let,
      this.lang,
      this.ratings,
      this.photo,
      this.distance,
      this.fcmToken,
      this.items,
      this.totalItems,
      this.totalPrice});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    minimunOrderValue = json['store_minimum_order'];
    let = json['let'];
    lang = json['lang'];
    fcmToken = json['fcmToken'];
    ratings = json['ratings'];
    photo = json['photo'];
    distance = json['distance'];
    deliveryCharges = json['delivery_charges'].toString();
    isKhataAvailable = json['IsKhataAvailable'];
    khataLimit = json['KhataLimit'];
    if (json['items'] != null) {
      items = <Product>[];
      json['items'].forEach((v) {
        items!.add(new Product.fromCartJson(v));
      });
    }
    totalItems = json['total_items'];
    totalPrice = json['total_price'];
    totalDiscoutPrice = json['total_discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['let'] = this.let;
    data['lang'] = this.lang;
    data['ratings'] = this.ratings;
    data['photo'] = this.photo;
    data['distance'] = this.distance;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['total_items'] = this.totalItems;
    data['total_price'] = this.totalPrice;
    return data;
  }
}
