class PlanHistoryModel {
  bool? success;
  List<Data>? data;

  PlanHistoryModel({this.success, this.data});

  PlanHistoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  int? userId;
  int? planId;
  int? orders;
  String? amount;
  String? paymentMode;
  String? referenceNo;
  String? createdAt;
  String? updatedAt;
  List<Null>? customFields;

  Data(
      {this.id,
      this.userId,
      this.planId,
      this.orders,
      this.amount,
      this.paymentMode,
      this.referenceNo,
      this.createdAt,
      this.updatedAt,
      this.customFields});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    planId = json['plan_id'];
    orders = json['orders'];
    amount = json['amount'];
    paymentMode = json['payment_mode'];
    referenceNo = json['reference_no'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['plan_id'] = this.planId;
    data['orders'] = this.orders;
    data['amount'] = this.amount;
    data['payment_mode'] = this.paymentMode;
    data['reference_no'] = this.referenceNo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    
    return data;
  }
}
