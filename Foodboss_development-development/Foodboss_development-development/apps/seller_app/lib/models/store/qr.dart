import 'package:flutter/cupertino.dart';

class QrModel {
  bool? success;
  Data? data;

  QrModel({this.success, this.data});

  QrModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? price;
  int? discountPrice;
  TextEditingController? controllerPrice;
  int? quantity;
  TextEditingController? controllerStock;
  int? categoryId;
  int? mainCategoryId;
  int? subcategoryId;
  bool? hasMedia;
  List<Media>? media;

  Data(
      {this.id,
      this.name,
      this.price,
      this.discountPrice,
      this.categoryId,
      this.quantity,
      this.controllerPrice,
      this.controllerStock,
      this.mainCategoryId,
      this.subcategoryId,
      this.hasMedia,
      this.media});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = 1000;
    controllerPrice = TextEditingController();
    controllerStock = TextEditingController();
    name = json['name'];
    price = json['price'];
    discountPrice = json['discount_price'];
    controllerPrice!.text = discountPrice.toString();
    controllerStock!.text = quantity.toString();
    categoryId = json['category_id'];
    mainCategoryId = json['main_category_id'];
    subcategoryId = json['subcategory_id'];

    hasMedia = json['has_media'];

    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['category_id'] = categoryId;
    data['main_category_id'] = mainCategoryId;
    data['subcategory_id'] = subcategoryId;

    data['has_media'] = hasMedia;

    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  int? id;
  String? url;
  String? thumb;
  String? icon;
  String? formatedSize;

  Media({this.id, this.url, this.thumb, this.icon, this.formatedSize});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    thumb = json['thumb'];
    icon = json['icon'];
    formatedSize = json['formated_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['url'] = url;
    data['thumb'] = thumb;
    data['icon'] = icon;
    data['formated_size'] = formatedSize;
    return data;
  }
}

class GeneratedConversions {
  bool? thumb;
  bool? icon;

  GeneratedConversions({this.thumb, this.icon});

  GeneratedConversions.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumb'] = this.thumb;
    data['icon'] = this.icon;
    return data;
  }
}
