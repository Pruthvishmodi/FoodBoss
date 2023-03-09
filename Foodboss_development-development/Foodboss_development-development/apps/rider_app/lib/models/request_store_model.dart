class RequestStoreModel {
  String? shopId;
  String? message;
  // String? type;

  RequestStoreModel({this.shopId, this.message});

  RequestStoreModel.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    message = json['message'];
    // type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['message'] = this.message;
    // data['type'] = this.type;
    return data;
  }
}
