import 'dart:developer';

import 'package:flutter/cupertino.dart';

class ItemModel {
  bool? success;
  ItemData? data;

  ItemModel({this.success, this.data});

  ItemModel.fromJson(Map<String, dynamic> json) {
    print(json['data']);
    success = json['success'];
    data = json['data'] != null
        ? ItemData.fromJson(json['data'])
        : ItemData(data: <ListItemData>[]);
  }
}

class ItemData {
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;
  List<ListItemData>? data;

  ItemData(
      {this.data,
      this.currentPage,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  ItemData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ListItemData>[];

      json['data'].forEach((v) {
        print(v['is_added_my_store']);

        if (v['is_added_my_store'] != null && v['is_added_my_store'] == false) {
          data!.add(ListItemData.fromJson(v));
        }
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class ListItemData {
  int? id;
  String? name;
  int? price;
  int? discountPrice;
  int? packageItemsCount;
  int? weight;
  String? unit;
  int? categoryId;
  int? mainCategoryId;
  int? subcategoryId;
  int? dupId;
  int? quantity;
  bool? hasMedia;
  bool? isRemoveMrp;

  bool? isSelected;
  bool? isAddedMyStore;
  List<Media>? media;
  TextEditingController? controllerPrice;
  TextEditingController? controllerStock;
  ListItemData(
      {this.id,
      this.isAddedMyStore,
      this.isRemoveMrp,
      this.quantity,
      this.name,
      this.controllerPrice,
      this.controllerStock,
      this.isSelected = false,
      this.price,
      this.discountPrice,
      this.packageItemsCount,
      this.weight,
      this.unit,
      this.categoryId,
      this.mainCategoryId,
      this.subcategoryId,
      this.dupId,
      this.hasMedia,
      this.media});

  ListItemData.fromJson(Map<String, dynamic> json) {
    isSelected = false;
    controllerPrice = TextEditingController();
    controllerStock = TextEditingController();
    controllerStock!.text = "1000";
    quantity = 1000;
    // data['is_remove_mrp'] = this.isRemoveMrp;
    if (json['is_remove_mrp'] != null) {
      isRemoveMrp = json['is_remove_mrp'];
    }
    if (json['id'] != null) {
      id = json['id'].round();
    }
    if (json['is_added_my_store'] != null) {
      isAddedMyStore = json['is_added_my_store'];
    }
    name = json['name'];
    if (json['price'] != null) {
      price = json['price'].round();
    }
    if (json['discount_price'] != null) {
      discountPrice = json['discount_price'].round();
      controllerPrice!.text = discountPrice.toString();
    }
    if (json['package_items_count'] != null) {
      packageItemsCount = json['package_items_count'].round();
    }
    if (json['weight'] != null) {
      weight = json['weight'].round();
    }
    unit = json['unit'];
    if (json['category_id'] != null) {
      categoryId = json['category_id'].round();
    }
    if (json['main_category_id'] != null) {
      mainCategoryId = json['main_category_id'].round();
    }
    if (json['subcategory_id'] != null) {
      subcategoryId = json['subcategory_id'].round();
    }
    if (json['dup_id'] != null) {
      dupId = json['dup_id'].round();
    }
    hasMedia = json['has_media'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
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
    if (json['id'] != null) {
      id = json['id'].round();
    }
    url = json['url'];
    thumb = json['thumb'];
    icon = json['icon'];
    formatedSize = json['formated_size'];
  }
}

class SelectedItems {
  List<ListItemData> litsOfItems;
  SelectedItems({required this.litsOfItems});
  toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    List<int> foodId = [];
    List<int> quantity = [];
    List<int> price = [];
    List<int> discountedPrice = [];
    litsOfItems.forEach((e) {
      log("price in toJson ${e.price}");
      foodId.add(e.id!);
      if (e.quantity != null) {
        quantity.add(e.quantity!);
      } else {
        quantity.add(1000);
      }
      if (e.price != null) {
        // quantity.add(e.packageItemsCount!);
        price.add(e.discountPrice!);
      } else {
        // quantity.add(1000);
        price.add(120);
      }
      if (e.discountPrice != null) {
        // quantity.add(e.packageItemsCount!);
        // price.add(e.price!);
        discountedPrice.add(e.discountPrice!);
      } else {
        // quantity.add(1000);
        // price.add(120);
        discountedPrice.add(200);
      }
    });
    data['food_id'] = foodId;
    data['quantity'] = quantity;
    data['price'] = price;
    data['discount_price'] = discountedPrice;
    log(data.toString());
    return data;
  }
}
