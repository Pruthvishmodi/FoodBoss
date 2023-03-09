class RemoveCustomerModel {
  String? clientId;

  RemoveCustomerModel({this.clientId});

  RemoveCustomerModel.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    return data;
  }
}
