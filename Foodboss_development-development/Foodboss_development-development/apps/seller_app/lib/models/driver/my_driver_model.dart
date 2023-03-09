class MyDriverModel {
  bool? success;
  List<MyDriver>? data;

  MyDriverModel({this.success, this.data});

  MyDriverModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <MyDriver>[];
      json['data'].forEach((v) {
        data!.add(new MyDriver.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyDriver {
  int? riderId;
  String? riderName;
  String? phone;
  bool? available;
  String? vehicleNumber;
  bool? hasMedia;
  String? licenceNumber;
  String? licenceImage;
  List<ImagePath>? imagePath;
  int? totalOrders;
  String? startDeliveryTimings;
  String? endDeliveryTimings;
  bool? isTrusted;
  int? deliveryRadious;
  String? area;
  String? ulatitude;
  String? ulongitude;
  String? deliveryCharge;

  MyDriver(
      {this.riderId,
      this.riderName,
      this.phone,
      this.available,
      this.vehicleNumber,
      this.hasMedia,
      this.licenceNumber,
      this.licenceImage,
      this.imagePath,
      this.totalOrders,
      this.startDeliveryTimings,
      this.endDeliveryTimings,
      this.isTrusted,
      this.deliveryRadious,
      this.area,
      this.ulatitude,
      this.ulongitude,
      this.deliveryCharge});

  MyDriver.fromJson(Map<String, dynamic> json) {
    riderId = json['rider_id'];
    riderName = json['rider_name'];
    phone = json['phone'];
    available = json['available'];
    vehicleNumber = json['vehicle_number'];
    hasMedia = json['has_media'];
    licenceNumber = json['licence_number'];
    licenceImage = json['licence_image'];
    if (json['image_path'] != null) {
      imagePath = <ImagePath>[];
      json['image_path'].forEach((v) {
        imagePath!.add(new ImagePath.fromJson(v));
      });
    }
    totalOrders = json['total_orders'];
    startDeliveryTimings = json['start_delivery_timings'];
    endDeliveryTimings = json['end_delivery_timings'];
    isTrusted = json['is_trusted'];
    deliveryRadious = json['delivery_radious'];
    area = json['area'];
    ulatitude = json['ulatitude'];
    ulongitude = json['ulongitude'];
    deliveryCharge = json['delivery_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rider_id'] = this.riderId;
    data['rider_name'] = this.riderName;
    data['phone'] = this.phone;
    data['available'] = this.available;
    data['vehicle_number'] = this.vehicleNumber;
    data['has_media'] = this.hasMedia;
    data['licence_number'] = this.licenceNumber;
    data['licence_image'] = this.licenceImage;
    if (this.imagePath != null) {
      data['image_path'] = this.imagePath!.map((v) => v.toJson()).toList();
    }
    data['total_orders'] = this.totalOrders;
    data['start_delivery_timings'] = this.startDeliveryTimings;
    data['end_delivery_timings'] = this.endDeliveryTimings;
    data['is_trusted'] = this.isTrusted;
    data['delivery_radious'] = this.deliveryRadious;
    data['area'] = this.area;
    data['ulatitude'] = this.ulatitude;
    data['ulongitude'] = this.ulongitude;
    data['delivery_charge'] = this.deliveryCharge;
    return data;
  }
}

class ImagePath {
  int? id;
  String? modelType;
  int? modelId;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  int? size;
  // List<Null>? manipulations;
  CustomProperties? customProperties;
  // List<Null>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? url;
  String? thumb;
  String? icon;
  String? formatedSize;

  ImagePath(
      {this.id,
      this.modelType,
      this.modelId,
      this.collectionName,
      this.name,
      this.fileName,
      this.mimeType,
      this.disk,
      this.size,
      // this.manipulations,
      this.customProperties,
      // this.responsiveImages,
      this.orderColumn,
      this.createdAt,
      this.updatedAt,
      this.url,
      this.thumb,
      this.icon,
      this.formatedSize});

  ImagePath.fromJson(Map<String, dynamic> json) {
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
