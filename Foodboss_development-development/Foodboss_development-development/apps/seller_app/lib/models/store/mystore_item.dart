class MyStoreItems {
  bool? success;
  // ListItemMyStoreData? data;
  List<ItemMyStoreData>? data;
  String? nextPageUrl;

  MyStoreItems({this.success, this.data, this.nextPageUrl});

  MyStoreItems.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    nextPageUrl = json['next_page_url'];
    data = <ItemMyStoreData>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add(ItemMyStoreData.fromJson(v));
      });
    }
    // data = json['data'] != null
    //     ? ListItemMyStoreData.fromJson(json['data'])
    //     : ListItemMyStoreData(data: <ItemMyStoreData>[]);
  }
}

class ListItemMyStoreData {
  int? currentPage;
  List<ItemMyStoreData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  ListItemMyStoreData(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  ListItemMyStoreData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ItemMyStoreData>[];
      json['data'].forEach((v) {
        data!.add(ItemMyStoreData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class ItemMyStoreData {
  int? id;
  String? name;

  // String? description;
  // int? packageItemsCount;
  // int? weight;
  // String? unit;
  // bool? featured;
  // bool? deliverable;
  // int? categoryId;
  int? mainCategoryId;
  bool? isRemoveMrp;

  // int? subcategoryId;
  int? isAvailable;
  int? quantity;
  String? price;
  String? discountPrice;
  bool? hasMedia;
  List<Media>? media;
  // List<Varients>? varients;
  ItemMyStoreData(
      {this.id,
      this.quantity = 1000,
      this.name,
      // this.description,
      // this.packageItemsCount,
      // this.weight,
      // this.unit,
      // this.featured,
      // this.deliverable,
      // this.categoryId,
      // this.mainCategoryId,
      // this.subcategoryId,
      this.isAvailable,
      this.isRemoveMrp,

      this.price,
      // this.varients,
      this.discountPrice,
      this.hasMedia,
      this.media});

  ItemMyStoreData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // description = json['description'];
    // if (json['package_items_count'] != null) {
    //   packageItemsCount = json['package_items_count']!.toInt();
    // }
    // if (json['weight'] != null) {
    //   weight = json['weight']!.toInt();
    // }
    quantity = json['quantity'];
    isRemoveMrp = json['is_remove_mrp'];

    // varients = [];
    // varients!.add(Varients(
    //     unit: json['unit'].toString(),
    //     quantity: json['weight'].toString(),
    //     price: json['price'].toString()));
    // unit = json['unit'];
    // featured = json['featured'];
    // deliverable = json['deliverable'];
    // if (json['category_id'] != null) {
    //   categoryId = json['category_id']!.toInt();
    // }
    if (json['main_category_id'] != null) {
      mainCategoryId = json['main_category_id'];
    }
    // if (json['subcategory_id'] != null) {
    //   subcategoryId = json['subcategory_id']!.toInt();
    // }
    isAvailable = json['is_available'];
    if (json['price'] != null) {
      price = json['price'];
    }
    if (json['discount_price'] != null) {
      discountPrice = json['discount_price'];
    }
    hasMedia = json['has_media'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }
  toJson() {
    Map<String, dynamic> json = Map<String, dynamic>();
    // json['food_id'] = id.toString();
    // json['quantity'] = quantity.toString();
    // json['price'] = price.toString();
    // json['discount_price'] = discountPrice.toString();
    // json['is_available'] = isAvailable;
    // List<Map<String, dynamic>> x = varients!.map((e) => e.toJson()).toList();
    // if (varients != null) {
    //   json['variants'] = varients!.map((e) => e.toJson()).toList();
    // }
    return json;
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
      id = json['id'];
    }
    url = json['url'];
    thumb = json['thumb'];
    icon = json['icon'];
    formatedSize = json['formated_size'];
  }
}

class Varients {
  String? price;
  String? quantity;
  String? unit;
  Varients({this.price, this.quantity, this.unit});
  toJson() {
    Map<String, dynamic> json = Map<String, dynamic>();
    json['price'] = price.toString();
    json['quantity'] = price.toString();
    json['unit'] = price.toString();
    return json;
  }
}
