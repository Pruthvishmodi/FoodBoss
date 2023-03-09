class Verified {
  bool? success;
  List<Data>? data;

  Verified({this.success, this.data});

  Verified.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = <Data>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['success'] = success;
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? apiToken;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.apiToken,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    apiToken = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
