class Khatas {
  Khata? khata;

  Khatas({this.khata});

  Khatas.fromJson(Map<String, dynamic> json) {
    khata = json['khata'] != null ? Khata.fromJson(json['khata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (khata != null) {
      data['khata'] = khata!.toJson();
    }
    return data;
  }
}

class Khata {
  String? id;
  String? shopId;
  int? limit;
  int? usedAmount;

  Khata({this.id, this.shopId, this.limit, this.usedAmount});

  Khata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    limit = json['limit'];
    usedAmount = json['used amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['shop_id'] = shopId;
    data['limit'] = limit;
    data['used amount'] = usedAmount;
    return data;
  }
}