class GenerateCode {
  int? orderId;
  String? code;
  ReturnItems? returnItems;

  GenerateCode({this.orderId, this.code, this.returnItems});

  GenerateCode.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    code = json['code'];
    returnItems = json['return_items'] != null
        ? new ReturnItems.fromJson(json['return_items'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['code'] = this.code;
    if (this.returnItems != null) {
      data['return_items'] = this.returnItems!.toJson();
    }
    return data;
  }
}

class ReturnItems {
  List<int>? id;

  ReturnItems({this.id});

  ReturnItems.fromJson(Map<String, dynamic> json) {
    id = json['id'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
