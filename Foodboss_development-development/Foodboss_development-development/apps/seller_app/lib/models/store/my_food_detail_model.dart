import 'dart:developer';

import 'package:flutter/cupertino.dart';

class MyStoreItemDetails {
  bool? success;
  ProductDetailsData? data;

  MyStoreItemDetails({this.success, this.data});

  MyStoreItemDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? ProductDetailsData.fromJson(json['data'])
        : ProductDetailsData();
  }
}

class ProductImage {
  int? id;
  String? url;
  ProductImage(this.id, this.url);
  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }
}

class ProductDetailsData {
  int? id;
  String? name;
  String? description;
  String? ingredients;
  double? weight;
  String? unit;
  int? mainCategoryId;
  bool? isAvailable;
  bool? isRemoveMrp;

  int? price;
  List<FoodsVariant>? foodsVariant;
  List<ProductImage>? images;
  FoodsUsers? foodsUsers;
  bool? hasMedia;
  List<Media>? media;
  List<String>? photos = <String>[];

  ProductDetailsData(
      {this.id,
      this.ingredients,
      this.name,
      this.description,
      this.weight,
      this.unit,
      this.mainCategoryId,
      this.isAvailable,
      this.isRemoveMrp,
      this.price,
      this.foodsVariant,
      this.photos,
      this.images,
      this.foodsUsers,
      this.hasMedia,
      this.media});

  ProductDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isRemoveMrp = json['is_remove_mrp'];
    ingredients = json['ingredients'];
    weight = double.parse(json['weight'].toString());
    unit = json['unit'];
    isAvailable = json['is_available'] == 0 ? false : true;
    price = json['price'];
    var variant = <FoodsVariant>[];
    var imagesc = <ProductImage>[];
    if (json['food_gallery'] != null) {
      json['food_gallery'].forEach((v) {
        // photos!.add(v['url']);
        imagesc.add(ProductImage.fromJson(v));
      });
    }
    if (json['images'] != null) {
      json['images'].forEach((v) {
        // photos!.add(v['url']);
        imagesc.add(ProductImage.fromJson(v));
      });
    }
    images = imagesc;
    if (json['foods_variant'] != null) {
      json['foods_variant'].forEach((v) {
        variant.add(FoodsVariant.fromJson(v));
      });
    }
    foodsVariant = variant;
    foodsUsers = json['foods_users'] != null
        ? FoodsUsers.fromJson(json['foods_users'])
        : FoodsUsers();
    hasMedia = json['has_media'];
    var newMedia = <Media>[];
    if (json['media'] != null) {
      json['media'].forEach((v) {
        newMedia.add(Media.fromJson(v));
      });
    }
    media = newMedia;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    log(isAvailable.toString());
    data['food_id'] = id;
    data['is_available'] = isAvailable;
    data['is_remove_mrp'] = isRemoveMrp;
    data['price'] = price;
    if (foodsVariant != null) {
      data['variants'] = foodsVariant!.map((v) => v.toJson()).toList();
    } else {
      data['variants'] = [];
    }
    if (foodsUsers != null) {
      data['quantity'] = foodsUsers!.quantity;
      data['discount_price'] = foodsUsers!.discountPrice;
    } else {
      data['quantity'] = "";
      data['discount_price'] = "";
    }
    return data;
  }
}

class FoodsVariant {
  String? price;
  int? quantity;
  String? unit;
  TextEditingController? priceController;
  TextEditingController? quantityController;
  List<String>? listOfUnit;

  FoodsVariant({
    this.price,
    this.quantity,
    this.listOfUnit,
    this.unit,
    this.priceController,
    this.quantityController,
  });

  FoodsVariant.fromJson(Map<String, dynamic> json) {
    priceController = TextEditingController(text: json['price'].toString());
    quantityController =
        TextEditingController(text: json['quantity'].toString());
    price = json['price'];
    quantity = json['quantity'];

    // List<String> listOption = ['Kg', 'g', 'mg', 'L', 'ml', 'pcs', 'pc'];
    // if (json['unit'] == 'kg') {
    //   listOption.add('gm');
    // }
    listOfUnit = ['Kg', 'g', 'mg', 'L', 'ml', 'pcs', 'pc'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['price'] = price;
    data['quantity'] = quantity;
    data['unit'] = unit;
    return data;
  }
}

class FoodsUsers {
  int? quantity;
  String? price;
  TextEditingController? priceController;
  TextEditingController? stockController;
  String? discountPrice;
  bool? isAvailable;

  FoodsUsers({
    this.quantity,
    this.price,
    this.discountPrice,
    this.isAvailable,
    this.priceController,
    this.stockController,
  });

  FoodsUsers.fromJson(Map<String, dynamic> json) {
    priceController =
        TextEditingController(text: json['discount_price'].toString());
    stockController = TextEditingController(text: json['quantity'].toString());

    quantity = json['quantity'];
    price = json['price'];
    discountPrice = json['discount_price'];
    isAvailable = json['is_available'] == 0 ? false : true;
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
}
