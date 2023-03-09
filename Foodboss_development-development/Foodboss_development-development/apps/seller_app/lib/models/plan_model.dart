class PlanModel {
  bool? success;
  Data? data;

  PlanModel({this.success, this.data});

  PlanModel.fromJson(Map<String, dynamic> json) {
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
  String? prdersLeft;
  List<Plans>? plans;

  Data({this.prdersLeft, this.plans});

  Data.fromJson(Map<String, dynamic> json) {
    prdersLeft = json['prders_left'];
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(new Plans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prders_left'] = this.prdersLeft;
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plans {
  int? id;
  String? name;
  String? specialText;
  String? amount;
  int? orders;
  String? perOrderRate;
  String? createdAt;
  String? updatedAt;
  List<Null>? customFields;

  Plans(
      {this.id,
      this.name,
      this.specialText,
      this.amount,
      this.orders,
      this.perOrderRate,
      this.createdAt,
      this.updatedAt,
      this.customFields});

  Plans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    specialText = json['special_text'];
    amount = json['amount'];
    orders = json['orders'];
    perOrderRate = json['per_order_rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['special_text'] = this.specialText;
    data['amount'] = this.amount;
    data['orders'] = this.orders;
    data['per_order_rate'] = this.perOrderRate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    return data;
  }
}
