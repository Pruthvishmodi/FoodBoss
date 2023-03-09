class SellerPayCodeModel {
  String? shopId;
  String? code;
  // String? type;

  SellerPayCodeModel({this.shopId, this.code});

  SellerPayCodeModel.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    code = json['code'];
    // type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['code'] = this.code;
    // data['type'] = this.type;
    return data;
  }
}
