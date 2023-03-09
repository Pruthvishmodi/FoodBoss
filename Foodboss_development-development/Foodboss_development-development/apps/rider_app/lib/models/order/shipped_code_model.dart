class ShippedCodeModel {
  String? orderId;
  String? code;
  String? type;

  ShippedCodeModel({this.orderId, this.code, this.type});

  ShippedCodeModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    code = json['code'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['code'] = this.code;
    data['type'] = this.type;
    return data;
  }
}
