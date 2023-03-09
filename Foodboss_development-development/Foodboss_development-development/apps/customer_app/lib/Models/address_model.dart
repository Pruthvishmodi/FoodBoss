class AddressesModel {
  bool? success;
  List<Address>? addressess;

  AddressesModel({this.success, this.addressess});

  AddressesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      addressess = <Address>[];
      json['data'].forEach((v) {
        addressess!.add(Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (addressess != null) {
      data['data'] = addressess!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  int? id;
  String? fullName;
  String? addressLine1;
  String? addressLine2;
  String? area;
  String? city;
  String? state;
  String? country;
  String? zip;
  double? latitude;
  double? longitude;
  bool? isDefault;
  int? userId;
  String? label;

  Address(
      {this.id,
      this.fullName,
      this.addressLine1,
      this.addressLine2,
      this.area,
      this.city,
      this.state,
      this.country,
      this.zip,
      this.latitude,
      this.longitude,
      this.isDefault,
      this.userId,
      this.label
      });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isDefault = json['is_default'];
    userId = json['user_id'];
    label = json['address_label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
  data['id'] = id;
    data['full_name'] = fullName;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['area'] = area;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['zip'] = zip;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['is_default'] = isDefault;
    data['user_id'] = userId;
    data['address_label'] = label;
    return data;
  }
}
