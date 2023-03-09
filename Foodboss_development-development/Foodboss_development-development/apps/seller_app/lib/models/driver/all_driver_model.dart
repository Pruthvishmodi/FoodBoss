import 'package:seller_app/models/driver/my_driver_model.dart';

class AllDriverModel {
  bool? success;
  List<MyDriver>? data=<MyDriver>[];

  AllDriverModel({this.success=false, this.data});

  AllDriverModel.fromJson(Map<String, dynamic> json) {
    success = json['success']??false;
    data = <MyDriver>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add( MyDriver.fromJson(v));
      });
    }
  }

}

class AllDrivers {
  int? riderId;
  String? riderName;
  String? phone;
  bool? available;
  Null? vehicleNumber;
  bool? hasMedia;
  List<ImagePath>? imagePath;
  int? totalOrders;
  Null? startDeliveryTimings;
  Null? endDeliveryTimings;
  int? deliveryRadious;
  Null? area;
  String? ulatitude;
  bool isTrusted = false;

  AllDrivers(
      {this.riderId,
      this.riderName,
      this.phone,
      this.available,
      this.vehicleNumber,
      this.hasMedia,
      this.imagePath,
      this.totalOrders,
      this.startDeliveryTimings,
      this.endDeliveryTimings,
      this.deliveryRadious,
      this.area,
      this.ulatitude});

  AllDrivers.fromJson(Map<String, dynamic> json) {
    riderId = json['rider_id'];
    riderName = json['rider_name'];
    phone = json['phone'];
    available = json['available'];
    vehicleNumber = json['vehicle_number'];
    hasMedia = json['has_media'];
    if (json['image_path'] != null) {
      imagePath = <ImagePath>[];
      json['image_path'].forEach((v) {
        imagePath!.add(new ImagePath.fromJson(v));
      });
    }
    totalOrders = json['total_orders'];
    startDeliveryTimings = json['start_delivery_timings'];
    endDeliveryTimings = json['end_delivery_timings'];
    deliveryRadious = json['delivery_radious'];
    area = json['area'];
    ulatitude = json['ulatitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rider_id'] = this.riderId;
    data['rider_name'] = this.riderName;
    data['phone'] = this.phone;
    data['available'] = this.available;
    data['vehicle_number'] = this.vehicleNumber;
    data['has_media'] = this.hasMedia;
    if (this.imagePath != null) {
      data['image_path'] = this.imagePath!.map((v) => v.toJson()).toList();
    }
    data['total_orders'] = this.totalOrders;
    data['start_delivery_timings'] = this.startDeliveryTimings;
    data['end_delivery_timings'] = this.endDeliveryTimings;
    data['delivery_radious'] = this.deliveryRadious;
    data['area'] = this.area;
    data['ulatitude'] = this.ulatitude;
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
  // CustomProperties? customProperties;
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
      // this.customProperties,
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
    // if (json['manipulations'] != null) {
    //   manipulations = <Null>[];
    //   json['manipulations'].forEach((v) {
    //     manipulations!.add(new Null.fromJson(v));
    //   });
    // }
    // customProperties = json['custom_properties'] != null
    //     ? new CustomProperties.fromJson(json['custom_properties'])
    //     : null;
    // if (json['responsive_images'] != null) {
    //   responsiveImages = <Null>[];
    //   json['responsive_images'].forEach((v) {
    //     responsiveImages!.add(new Null.fromJson(v));
    //   });
    // }
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
    // if (this.manipulations != null) {
    //   data['manipulations'] =
    //       this.manipulations!.map((v) => v.toJson()).toList();
    // }
    // if (this.customProperties != null) {
    //   data['custom_properties'] = this.customProperties!.toJson();
    // }
    // if (this.responsiveImages != null) {
    //   data['responsive_images'] =
    //       this.responsiveImages!.map((v) => v.toJson()).toList();
    // }
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

