class PurchasePlanModel {
  String? planId;
  String? cashfreeToken;
  

  PurchasePlanModel({this.planId, this.cashfreeToken});

  PurchasePlanModel.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    cashfreeToken = json['cashfree_token'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_id'] = this.planId;
    data['cashfree_token'] = this.cashfreeToken;
    
    return data;
  }
}