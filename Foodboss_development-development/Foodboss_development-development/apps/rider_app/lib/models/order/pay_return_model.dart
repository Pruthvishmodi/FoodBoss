class PayReturnModel {
  bool? success;
  Data? data;

  PayReturnModel({this.success, this.data});

  PayReturnModel.fromJson(Map<String, dynamic> json) {
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
  int? totalShippedOrder;
  List<PayReturnOrders>? newOrders;

  Data({this.totalShippedOrder, this.newOrders});

  Data.fromJson(Map<String, dynamic> json) {
    totalShippedOrder = json['total_shipped_order'];
    if (json['new_orders'] != null) {
      newOrders = <PayReturnOrders>[];
      json['new_orders'].forEach((v) {
        newOrders!.add(new PayReturnOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_shipped_order'] = this.totalShippedOrder;
    if (this.newOrders != null) {
      data['new_orders'] = this.newOrders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PayReturnOrders {
  int? totalOrder;
  int? deliveredOrder;
  int? returnedOrder;
  String? date;
  String? area;
  String? pickupAddress;
  String? latitude;
  String? longitude;
  int? totalItems;
  int? returnItem;
  int? deliveredItems;
  int? amountCollectedOld;
  int? amountCollectedNew;
  int? amountCollectedCodNew;

  int? shopId;
  String? shopName;
  String? shopPhoneNumber;
  String? paymentMethod;
  List<ReturnItems>? returnItems;

  PayReturnOrders(
      {this.totalOrder,
      this.deliveredOrder,
      this.returnedOrder,
      this.date,
      this.area,
      this.pickupAddress,
      this.latitude,
      this.longitude,
      this.totalItems,
      this.returnItem,
      this.deliveredItems,
      this.amountCollectedOld,
      this.amountCollectedNew,
      this.amountCollectedCodNew,
      this.shopId,
      this.shopName,
      this.shopPhoneNumber,
      this.paymentMethod,
      this.returnItems});

  PayReturnOrders.fromJson(Map<String, dynamic> json) {
    totalOrder = json['total_order'];
    deliveredOrder = json['delivered_order'];
    returnedOrder = json['returned_order'];
    date = json['date'];
    area = json['area'];
    pickupAddress = json['pickup_address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    totalItems = json['total_items'];
    returnItem = json['return_item'];
    deliveredItems = json['delivered_items'];
    amountCollectedOld = json['amount_collected_old'];
    amountCollectedNew = json['amount_collected_new'];
    amountCollectedCodNew = json['amount_collected_cod_new'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopPhoneNumber = json['shop_phone_number'];
    paymentMethod = json['payment_method'];
    if (json['return_items'] != null) {
      returnItems = <ReturnItems>[];
      json['return_items'].forEach((v) {
        returnItems!.add(new ReturnItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_order'] = this.totalOrder;
    data['delivered_order'] = this.deliveredOrder;
    data['returned_order'] = this.returnedOrder;
    data['date'] = this.date;
    data['area'] = this.area;
    data['pickup_address'] = this.pickupAddress;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['total_items'] = this.totalItems;
    data['return_item'] = this.returnItem;
    data['delivered_items'] = this.deliveredItems;
    data['amount_collected_old'] = this.amountCollectedOld;
    data['amount_collected_new'] = this.amountCollectedNew;
    data['amount_collected_cod_new'] = this.amountCollectedCodNew;
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['shop_phone_number'] = this.shopPhoneNumber;
    data['payment_method'] = this.paymentMethod;
    if (this.returnItems != null) {
      data['return_items'] = this.returnItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReturnItems {
  int? id;
  String? name;
  int? price;
  int? quantity;
  double? weight;
  String? unit;

  List<Null>? customFields;
  bool? hasMedia;
  List<Media>? media;

  ReturnItems(
      {this.id,
      this.name,
      this.price,
      this.quantity,
      this.unit,
      this.weight,
      this.customFields,
      this.hasMedia,
      this.media});

  ReturnItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    unit = json['unit'];
    weight = double.parse(json['weight'].toString());

    hasMedia = json['has_media'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    data['weight'] = this.weight;

    data['has_media'] = this.hasMedia;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  int? id;
  String? modelType;
  int? modelId;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  int? size;
  List<Null>? manipulations;
  CustomProperties? customProperties;
  List<Null>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? url;
  String? thumb;
  String? icon;
  String? formatedSize;

  Media(
      {this.id,
      this.modelType,
      this.modelId,
      this.collectionName,
      this.name,
      this.fileName,
      this.mimeType,
      this.disk,
      this.size,
      this.manipulations,
      this.customProperties,
      this.responsiveImages,
      this.orderColumn,
      this.createdAt,
      this.updatedAt,
      this.url,
      this.thumb,
      this.icon,
      this.formatedSize});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    collectionName = json['collection_name'];
    name = json['name'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    disk = json['disk'];
    size = json['size'];

    customProperties = json['custom_properties'] != null
        ? new CustomProperties.fromJson(json['custom_properties'])
        : null;

    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    url = json['url'];
    thumb = json['thumb'];
    icon = json['icon'];
    formatedSize = json['formated_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model_type'] = this.modelType;
    data['model_id'] = this.modelId;
    data['collection_name'] = this.collectionName;
    data['name'] = this.name;
    data['file_name'] = this.fileName;
    data['mime_type'] = this.mimeType;
    data['disk'] = this.disk;
    data['size'] = this.size;

    if (this.customProperties != null) {
      data['custom_properties'] = this.customProperties!.toJson();
    }

    data['order_column'] = this.orderColumn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    data['thumb'] = this.thumb;
    data['icon'] = this.icon;
    data['formated_size'] = this.formatedSize;
    return data;
  }
}

class CustomProperties {
  String? uuid;
  int? userId;
  GeneratedConversions? generatedConversions;

  CustomProperties({this.uuid, this.userId, this.generatedConversions});

  CustomProperties.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    userId = json['user_id'];
    generatedConversions = json['generated_conversions'] != null
        ? new GeneratedConversions.fromJson(json['generated_conversions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['user_id'] = this.userId;
    if (this.generatedConversions != null) {
      data['generated_conversions'] = this.generatedConversions!.toJson();
    }
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
