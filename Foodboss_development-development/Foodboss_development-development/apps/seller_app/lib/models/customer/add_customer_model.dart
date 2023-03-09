class AddCustomerModel {
  String? clientId;
  String? deliveryCharge;
  String? isBlock;

  AddCustomerModel({this.clientId, this.deliveryCharge, this.isBlock});

  AddCustomerModel.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    deliveryCharge = json['delivery_charge'];
    isBlock = json['is_block'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['delivery_charge'] = this.deliveryCharge;
    data['is_block'] = this.isBlock;
    return data;
  }
}
