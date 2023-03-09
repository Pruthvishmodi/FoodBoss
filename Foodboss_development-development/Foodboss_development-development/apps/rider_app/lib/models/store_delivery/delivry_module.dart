class DeliveryModelMain {
  String? openedAt;
  String? closedAt;
  // String? minimumOrderPrice;
  String? deliveryRadious;
  // List<DeliveryRange>? deliveryRange;
  OpenDays? openDays;
  // List<DeliveryTimings>? deliveryTimings;

  DeliveryModelMain(
      {this.openedAt,
      this.closedAt,
      // this.minimumOrderPrice,
      this.deliveryRadious,
      // this.deliveryRange,
      this.openDays,
      // this.deliveryTimings
      });

  DeliveryModelMain.fromJson(Map<String, dynamic> json) {
    openedAt = json['opened_at'];
    closedAt = json['closed_at'];
    // minimumOrderPrice = json['minimum_order_price'];
    deliveryRadious = json['delivery_radious'];
    // if (json['delivery_range'] != null) {
    //   deliveryRange = <DeliveryRange>[];
    //   json['delivery_range'].forEach((v) {
    //     deliveryRange!.add(new DeliveryRange.fromJson(v));
    //   });
    // }
    openDays = json['open_days'] != null
        ? new OpenDays.fromJson(json['open_days'])
        : null;
    // if (json['delivery_timings'] != null) {
    //   deliveryTimings = <DeliveryTimings>[];
    //   json['delivery_timings'].forEach((v) {
    //     deliveryTimings!.add(new DeliveryTimings.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    var dt = DeliveryTimings(startTime: openedAt,endTime: closedAt);
    data['delivery_timings'] = dt.toJson();
    // data['delivery_timings[start_time]'] = openedAt;
    // data['delivery_timings[end_time]'] = closedAt;
    
    int radius = double.parse(deliveryRadious!).toInt();
    // data['minimum_order_price'] = minimumOrderPrice;
    data['delivery_radious'] = radius;
    // if (deliveryRange != null) {
    //   data['delivery_range'] = deliveryRange!.map((v) => v.toJson()).toList();
    // }
    if (openDays != null) {
      data['open_days'] = openDays!.toJson();
    }
    // if (deliveryTimings != null) {
    //   data['delivery_timings'] =
    //       deliveryTimings!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class DeliveryRange {
  String? range;
  String? amount;

  DeliveryRange({this.range, this.amount});

  DeliveryRange.fromJson(Map<String, dynamic> json) {
    range = json['range'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['range'] = range;
    data['amount'] = amount;
    return data;
  }
}

class OpenDays {
  bool? sunday;
  bool? monday;
  bool? tuesday;
  bool? wednesday;
  bool? thursday;
  bool? friday;
  bool? saturday;

  OpenDays(
      {this.sunday,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday});

  OpenDays.fromJson(Map<String, dynamic> json) {
    sunday = json['sunday'];
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sunday'] = sunday.toString();
    data['monday'] = monday.toString();
    data['tuesday'] = tuesday.toString();
    data['wednesday'] = wednesday.toString();
    data['thursday'] = thursday.toString();
    data['friday'] = friday.toString();
    data['saturday'] = saturday.toString();
    return data;
  }
}

class DeliveryTimings {
  String? startTime;
  String? endTime;

  DeliveryTimings({this.startTime, this.endTime});

  DeliveryTimings.fromJson(Map<String, dynamic> json) {
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