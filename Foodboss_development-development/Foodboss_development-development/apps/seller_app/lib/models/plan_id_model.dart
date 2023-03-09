class OrderId {
  String? planId;

  OrderId({this.planId});

  OrderId.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_id'] = this.planId;
    return data;
  }
}