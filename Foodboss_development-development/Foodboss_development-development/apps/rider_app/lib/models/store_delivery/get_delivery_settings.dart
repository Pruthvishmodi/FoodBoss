import 'package:rider_app/models/store_delivery/delivry_module.dart';

class GetDeliverySettings {
  bool? success;
  Data? data;

  GetDeliverySettings({this.success, this.data});

  GetDeliverySettings.fromJson(Map<String, dynamic> json) {
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
  OpenDays? openDays;
  String? latitude;
  String? longitude;
  StoreTimings? storeTimings;
  DeliveryRadius? deliveryRadius;

  Data({this.openDays, this.storeTimings, this.deliveryRadius});

  Data.fromJson(Map<String, dynamic> json) {
    openDays = json['open_days'] != null
        ? new OpenDays.fromJson(json['open_days'])
        : null;
    latitude = json['latitude'] ?? '';
    print('afeidef ${json['longitude ']}');
    longitude = json['longitude '] ?? '';

    storeTimings = json['store_timings'] != null
        ? new StoreTimings.fromJson(json['store_timings'])
        : null;
    deliveryRadius = json['delivery_radius'] != null
        ? new DeliveryRadius.fromJson(json['delivery_radius'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.openDays != null) {
      data['open_days'] = this.openDays!.toJson();
    }

    if (this.storeTimings != null) {
      data['store_timings'] = this.storeTimings!.toJson();
    }
    if (this.deliveryRadius != null) {
      data['delivery_radius'] = this.deliveryRadius!.toJson();
    }
    return data;
  }
}

class StoreTimings {
  String? startTime;
  String? endTime;

  StoreTimings({this.startTime, this.endTime});

  StoreTimings.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}

class DeliveryRadius {
  int? range;

  DeliveryRadius({required this.range});

  DeliveryRadius.fromJson(Map<String, dynamic> json) {
    // print(json['range']);
    range = json['range'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['range'] = this.range;
    return data;
  }
}
