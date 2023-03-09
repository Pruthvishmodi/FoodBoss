class MyEarningListModel {
  bool? success;
  Data? data;

  MyEarningListModel({this.success, this.data});

  MyEarningListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? earning;
  List<Stores>? stores;

  Data({this.earning, this.stores});

  Data.fromJson(Map<String, dynamic> json) {
    earning = int.parse(json['earning'].toString());
    if (json['stores'] != null) {
      stores = <Stores>[];
      json['stores'].forEach((v) {
        stores!.add(new Stores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['earning'] = this.earning;
    if (this.stores != null) {
      data['stores'] = this.stores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stores {
  String? shopName;
  String? storeAddress;
  String? phone;
  String? lat;
  int? totalOrder;
  int? earning;
  String? lang;
  String? shopImage;

  Stores(
      {this.shopName,
      this.storeAddress,
      this.phone,
      this.lat,
      this.totalOrder,
      this.earning,
      this.lang,
      this.shopImage});

  Stores.fromJson(Map<String, dynamic> json) {
    shopName = json['shop_name'];
    storeAddress = json['store_address'];
    phone = json['phone'];
    lat = json['lat'];
    totalOrder = json['total_order'];
    earning = int.parse(json['earning'].toString());
    lang = json['lang'];
    shopImage = json['shop_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_name'] = this.shopName;
    data['store_address'] = this.storeAddress;
    data['phone'] = this.phone;
    data['lat'] = this.lat;
    data['total_order'] = this.totalOrder;
    data['earning'] = this.earning;
    data['lang'] = this.lang;
    data['shop_image'] = this.shopImage;
    return data;
  }
}
