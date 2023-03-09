class CollectOrderodel {
  bool? success;
  int? code;
  String? shopId;
  String? orderId;

  CollectOrderodel({this.shopId, this.orderId});

  CollectOrderodel.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    success = json['success'];
    code = json['code'];


    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['success']= this.success;
    data['code']= this.code;

    data['order_id'] = this.orderId;
    return data;
  }
}
