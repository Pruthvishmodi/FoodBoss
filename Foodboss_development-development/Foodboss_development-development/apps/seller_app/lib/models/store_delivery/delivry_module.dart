class DeliveryModelMain {
  String? openedAt;
  String? closedAt;
  String? minimumOrderPrice;
  String? deliveryRadious;
  List<DeliveryRanges>? deliveryRange;
  OpenDay? openDays;
  List<DeliveryTiming>? deliveryTimings;

  DeliveryModelMain(
      {this.openedAt,
      this.closedAt,
      this.minimumOrderPrice,
      this.deliveryRadious,
      this.deliveryRange,
      this.openDays,
      this.deliveryTimings});

  DeliveryModelMain.fromJson(Map<String, dynamic> json) {
    openedAt = json['opened_at'];
    closedAt = json['closed_at'];
    minimumOrderPrice = json['minimum_order_price'];
    deliveryRadious = json['delivery_radious'];
    if (json['delivery_range'] != null) {
      deliveryRange = <DeliveryRanges>[];
      json['delivery_range'].forEach((v) {
        deliveryRange!.add(new DeliveryRanges.fromJson(v));
      });
    }
    openDays = json['open_days'] != null
        ? new OpenDay.fromJson(json['open_days'])
        : null;
    if (json['delivery_timings'] != null) {
      deliveryTimings = <DeliveryTiming>[];
      json['delivery_timings'].forEach((v) {
        deliveryTimings!.add(new DeliveryTiming.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['opened_at'] = openedAt;
    data['closed_at'] = closedAt;
    data['minimum_order_price'] = minimumOrderPrice;
    data['delivery_radious'] = deliveryRadious;
    if (deliveryRange != null) {
      data['delivery_range'] = deliveryRange!.map((v) => v.toJson()).toList();
    }
    if (openDays != null) {
      data['open_days'] = openDays!.toJson();
    }
    if (deliveryTimings != null) {
      data['delivery_timings'] =
          deliveryTimings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryRanges {
  String? range;
  String? amount;

  DeliveryRanges({this.range, this.amount});

  DeliveryRanges.fromJson(Map<String, dynamic> json) {
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

class OpenDay {
  bool? sunday;
  bool? monday;
  bool? tuesday;
  bool? wednesday;
  bool? thursday;
  bool? friday;
  bool? saturday;

  OpenDay(
      {this.sunday,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday});

  OpenDay.fromJson(Map<String, dynamic> json) {
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
    data['sunday'] = sunday;
    data['monday'] = monday;
    data['tuesday'] = tuesday;
    data['wednesday'] = wednesday;
    data['thursday'] = thursday;
    data['friday'] = friday;
    data['saturday'] = saturday;
    return data;
  }
}

class DeliveryTiming {
  String? startTime;
  String? endTime;

  DeliveryTiming({this.startTime, this.endTime});

  DeliveryTiming.fromJson(Map<String, dynamic> json) {
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
