class NewOrderByStoreModel {
  bool? success;
  StoreData? data;

  NewOrderByStoreModel({this.success, this.data});

  NewOrderByStoreModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new StoreData.fromJson(json['data']) : null;
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

class StoreData {
  int? totalNewOrders;
  List<NewOrders>? newOrders;

  StoreData({this.totalNewOrders, this.newOrders});

  StoreData.fromJson(Map<String, dynamic> json) {
    totalNewOrders = json['total_new_orders'];
    if (json['new_orders'] != null) {
      newOrders = <NewOrders>[];
      json['new_orders'].forEach((v) {
        newOrders!.add(new NewOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_new_orders'] = this.totalNewOrders;
    if (this.newOrders != null) {
      data['new_orders'] = this.newOrders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewOrders {
  String? date;
  int? orderId;
  String? time;
  String? area;
  String? address;
  String? latitude;
  String? longitude;
  int? totalItems;
  int? amountToCollect;
  String? paymentMethod;
  String? deliveredDate;
  String? deliveredTime;
  CustomerDetails? customerDetails;
  List<Items>? items;

  NewOrders(
      {this.date,
      this.orderId,
      this.time,
      this.area,
      this.address,
      this.latitude,
      this.longitude,
      this.totalItems,
      this.amountToCollect,
      this.paymentMethod,
      this.deliveredDate,
      this.deliveredTime,
      this.customerDetails,
      this.items});

  NewOrders.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    orderId = json['order_id'];
    time = json['time'];
    area = json['area'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    totalItems = json['total_items'];
    amountToCollect = json['amount_to_collect'];
    paymentMethod = json['payment_method'];
    deliveredDate = json['delivered_date'];
    deliveredTime = json['delivered_time'];
    customerDetails = json['customer_details'] != null
        ? new CustomerDetails.fromJson(json['customer_details'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['order_id'] = this.orderId;
    data['time'] = this.time;
    data['area'] = this.area;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['total_items'] = this.totalItems;
    data['amount_to_collect'] = this.amountToCollect;
    data['payment_method'] = this.paymentMethod;
    data['delivered_date'] = this.deliveredDate;
    data['delivered_time'] = this.deliveredTime;
    if (this.customerDetails != null) {
      data['customer_details'] = this.customerDetails!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerDetails {
  String? customerName;
  String? customerAddress;
  String? customerNumber;

  CustomerDetails(
      {this.customerName, this.customerAddress, this.customerNumber});

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    customerName = json['Customer_name'];
    customerAddress = json['Customer_address'];
    customerNumber = json['Customer_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Customer_name'] = this.customerName;
    data['Customer_address'] = this.customerAddress;
    data['Customer_number'] = this.customerNumber;
    return data;
  }
}

class Items {
  int? id;
  String? name;
  int? price;
  int? quantity;
  String? unit;
  double? weight;

  List<Null>? customFields;
  bool? hasMedia;
  List<Media>? media;

  Items(
      {this.id,
      this.name,
      this.price,
      this.quantity,
      this.unit,
      this.weight,
      this.customFields,
      this.hasMedia,
      this.media});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    unit = json['unit'];
    quantity = json['quantity'];
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
