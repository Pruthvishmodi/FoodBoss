class MyKhataList {
  bool? success;
  List<Khata>? data;

  MyKhataList({this.success, this.data});

  MyKhataList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['success'] == false) {
      data = [];
    } else {
      if (json['data'] != null) {
        data = <Khata>[];
        json['data'].forEach((v) {
          data!.add(new Khata.fromJson(v));
        });
      }
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

class Khata {
  int? id;
  int? khataId;
  String? shopName;
  String? address;
  String? latitude;
  String? longitude;
  String? phone;
  String? totalAmount;
  String? shopImage;
  String? usedAmount;
  List<PaymentHistory>? paymentHistory;

  Khata(
      {this.id,
      this.khataId,
      this.shopName,
      this.address,
      this.latitude,
      this.longitude,
      this.phone,
      this.totalAmount,
      this.usedAmount});

  Khata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    khataId = json['khata_id'];
    shopName = json['shop_name'];
    shopImage = json['shop_image'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
    totalAmount = json['total_amount'];
    usedAmount = json['used_amount'];
  }

  Khata.fromDetailsJson(Map<String, dynamic> json) {
    id = json['id'];
    khataId = json['khata_id'];
    shopImage = json['shop_image'];
    shopName = json['shop_name'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
    totalAmount = json['total_amount'];
    usedAmount = json['used_amount'];
    if (json['payment_history'] != null) {
      paymentHistory = <PaymentHistory>[];
      json['payment_history'].forEach((v) {
        paymentHistory!.add(new PaymentHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['khata_id'] = this.khataId;
    data['shop_name'] = this.shopName;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['phone'] = this.phone;
    data['total_amount'] = this.totalAmount;
    data['used_amount'] = this.usedAmount;
    return data;
  }
}

class PaymentHistory {
  int? id;
  int? khataId;
  String? amount;
  int? amountType;
  String? createdAt;
  String? updatedAt;

  PaymentHistory(
      {this.id,
      this.khataId,
      this.amount,
      this.amountType,
      this.createdAt,
      this.updatedAt});

  PaymentHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    khataId = json['khata_id'];
    amount = json['amount'];
    amountType = json['amount_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['khata_id'] = this.khataId;
    data['amount'] = this.amount;
    data['amount_type'] = this.amountType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
