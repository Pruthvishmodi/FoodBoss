class MyStoreListModel {
  bool? success;
  List<Data>? data;

  MyStoreListModel({this.success, this.data});

  MyStoreListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? latitude;
  String? longitude;
  String? deliveryCharge;
  String? image;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.latitude,
      this.longitude,
      this.deliveryCharge,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    deliveryCharge = json['delivery_charge'] ?? '0';
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['delivery_charge'] = this.deliveryCharge;
    data['image'] = this.image;
    return data;
  }
}
