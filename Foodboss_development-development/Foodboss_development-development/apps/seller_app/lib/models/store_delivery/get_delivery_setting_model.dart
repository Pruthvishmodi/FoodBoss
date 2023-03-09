class GetDeliverySettings {
  bool? success = false;
  List<Data>? data = [];

  GetDeliverySettings({this.success, this.data});

  GetDeliverySettings.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = <Data>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? userId = 0;
  int? restaurantId = 0;
  OpenDays? openDays = OpenDays();
  List<DeliveryTimings>? deliveryTimings = [];
  List<DeliveryRange>? deliveryRange = [];
  Restaurants? restaurants = Restaurants();

  Data(
      {this.userId = 0,
      this.restaurantId = 0,
      this.openDays,
      this.deliveryTimings,
      this.deliveryRange,
      this.restaurants});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] ?? 0;
    restaurantId = json['restaurant_id'] ?? 0;
    openDays = json['open_days'] != null
        ? OpenDays.fromJson(json['open_days'])
        : OpenDays();
    deliveryTimings = <DeliveryTimings>[];
    if (json['delivery_timings'] != null) {
      json['delivery_timings'].forEach((v) {
        deliveryTimings!.add(DeliveryTimings.fromJson(v));
      });
    }
    deliveryRange = <DeliveryRange>[];
    if (json['delivery_range'] != null) {
      json['delivery_range'].forEach((v) {
        deliveryRange!.add(DeliveryRange.fromJson(v));
      });
    }
    restaurants = json['restaurants'] != null
        ? Restaurants.fromJson(json['restaurants'])
        : Restaurants();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['restaurant_id'] = this.restaurantId;
    if (this.openDays != null) {
      data['open_days'] = this.openDays!.toJson();
    }
    if (this.deliveryTimings != null) {
      data['delivery_timings'] =
          this.deliveryTimings!.map((v) => v.toJson()).toList();
    }
    if (this.deliveryRange != null) {
      data['delivery_range'] =
          this.deliveryRange!.map((v) => v.toJson()).toList();
    }
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants!.toJson();
    }
    return data;
  }
}

class OpenDays {
  bool? sunday = false;
  bool? monday = true;
  bool? tuesday = true;
  bool? wednesday = true;
  bool? thursday = true;
  bool? friday = true;
  bool? saturday = false;

  OpenDays(
      {this.sunday = false,
      this.monday = true,
      this.tuesday = true,
      this.wednesday = true,
      this.thursday = true,
      this.friday = true,
      this.saturday = false});

  OpenDays.fromJson(Map<String, dynamic> json) {
    sunday = json['sunday'] ?? false;
    monday = json['monday'] ?? true;
    tuesday = json['tuesday'] ?? true;
    wednesday = json['wednesday'] ?? true;
    thursday = json['thursday'] ?? true;
    friday = json['friday'] ?? true;
    saturday = json['saturday'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sunday'] = this.sunday;
    data['monday'] = this.monday;
    data['tuesday'] = this.tuesday;
    data['wednesday'] = this.wednesday;
    data['thursday'] = this.thursday;
    data['friday'] = this.friday;
    data['saturday'] = this.saturday;
    return data;
  }
}

class DeliveryTimings {
  int? id = 0;
  int? shopId = 0;
  String? startTime = "10:00 AM";
  String? endTime = "4:00 PM";
  String? createdAt = "4:00 PM";

  DeliveryTimings(
      {this.id = 0,
      this.shopId = 0,
      this.startTime = "10:00 AM",
      this.endTime = "4:00 PM",
      this.createdAt = "4:00 PM"});

  DeliveryTimings.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    shopId = json['shop_id'] ?? 0;
    startTime = json['start_time'] ?? "10:00 AM";
    endTime = json['end_time'] ?? "4:00 PM";
    createdAt = json['created_at'] ?? "4:00 PM";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class DeliveryRange {
  int? id = 0;
  int? restaurantId = 0;
  int? range = 100;
  String? price = "0";
  String? createdAt;
  String? updatedAt;

  DeliveryRange(
      {this.id = 0,
      this.restaurantId = 0,
      this.range = 100,
      this.price = "0",
      this.createdAt,
      this.updatedAt});

  DeliveryRange.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    restaurantId = json['restaurant_id'] ?? 0;
    range = json['range'] ?? 100;
    price = json['price'] ?? "0";
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['range'] = this.range;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Restaurants {
  int? id = 0;
  String? openedAt = "10:00 AM";
  String? closedAt = "10:00 AM";
  int? deliveryRadious = 100;
  String? minimumOrderPrice = '0';
  String? latitude = '0';
  String? longitude = '0';
  // List<Null>? customFields;
  bool? hasMedia = false;
  // Null? rate;
  String? image = '';
  // List<Null>? media;

  Restaurants({
    this.id = 0,
    this.openedAt = "10:00 AM",
    this.closedAt = "10:00 AM",
    this.deliveryRadious = 100,
    this.minimumOrderPrice = "0",
    // this.customFields,
    this.hasMedia = false,
    // this.rate,
    this.image = '',
    // this.media
  });

  Restaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    openedAt = json['opened_at'] ?? "10:00 AM";
    closedAt = json['closed_at'] ?? "10:00 AM";
    deliveryRadious = json['delivery_radious'] ?? 100;
    minimumOrderPrice = json['minimum_order_price'] ?? "0";
    latitude = json['latitude'] ?? "0";
    longitude = json['longitude'] ?? "0";
    // if (json['custom_fields'] != null) {
    //   customFields = <Null>[];
    //   json['custom_fields'].forEach((v) {
    //     customFields!.add(new Null.fromJson(v));
    //   });
    // }
    hasMedia = json['has_media'] ?? false;
    // rate = json['rate'];
    image = json['image'] ?? '';
    // if (json['media'] != null) {
    //   media = <Null>[];
    //   json['media'].forEach((v) {
    //     media!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['opened_at'] = this.openedAt;
    data['closed_at'] = this.closedAt;
    data['delivery_radious'] = this.deliveryRadious;
    data['minimum_order_price'] = this.minimumOrderPrice;
    // if (this.customFields != null) {
    //   data['custom_fields'] =
    //       this.customFields!.map((v) => v.toJson()).toList();
    // }
    data['has_media'] = this.hasMedia;
    // data['rate'] = this.rate;
    data['image'] = this.image;
    // if (this.media != null) {
    //   data['media'] = this.media!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
