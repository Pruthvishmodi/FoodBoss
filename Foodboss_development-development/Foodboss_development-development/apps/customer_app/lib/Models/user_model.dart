import 'package:customer_app/Models/khata_model.dart';
import 'package:customer_app/Models/order_model.dart';
import 'package:customer_app/Models/reviews_model.dart';

class UserModel {
  String? userId;
  String? name;
  String? photoUrl;
  String? token;
  String? phoneNumber;
  bool? isLogedin;
  List<Reviews>? reviews;
  List<Khatas>? khatas;
  List<Orders>? orders;

  UserModel(
      {this.userId,
      this.photoUrl,
      this.isLogedin = false,
      this.token,
      this.reviews,
      this.khatas,
      this.phoneNumber,
      this.orders
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    photoUrl = json['photo_url'];
    token = json['token'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    if (json['khatas'] != null) {
      khatas = <Khatas>[];
      json['khatas'].forEach((v) {
        khatas!.add(Khatas.fromJson(v));
      });
    }
    phoneNumber = json['phone number'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userId;
    data['photo_url'] = photoUrl;
    data['token'] = token;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    if (khatas != null) {
      data['khatas'] = khatas!.map((v) => v.toJson()).toList();
    }
    data['phone number'] = phoneNumber;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
