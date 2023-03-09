class PurchasePlanModel {
  String? planId;
  String? paymentMode;
  String? referenceNo;

  PurchasePlanModel({this.planId, this.paymentMode, this.referenceNo});

  PurchasePlanModel.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    paymentMode = json['payment_mode'];
    referenceNo = json['reference_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_id'] = this.planId;
    data['payment_mode'] = this.paymentMode;
    data['reference_no'] = this.referenceNo;
    return data;
  }
}