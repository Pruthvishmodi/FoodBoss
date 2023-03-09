class GetMyUserKhata {
  bool? success;
  List<KhataUser>? khatas;

  GetMyUserKhata({this.success, this.khatas});

  GetMyUserKhata.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      khatas = <KhataUser>[];
      json['data'].forEach((v) {
        khatas!.add(new KhataUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.khatas != null) {
      data['data'] = this.khatas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KhataUser {
  int? id;
  String? customerName;
  String? phone;
  bool? blocked;
  String? totalKhataAmount;
  String? totalUsedAmount;
  String? newAmount;

  KhataUser(
      {this.id,
      this.customerName,
      this.phone,
      this.blocked,
      this.totalKhataAmount,
      this.totalUsedAmount});

  KhataUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customer_name'];
    phone = json['phone'];
    blocked = json['blocked'];
    totalKhataAmount = json['total_khata_amount'];
    totalUsedAmount = json['total_used_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_name'] = this.customerName;
    data['phone'] = this.phone;
    data['blocked'] = this.blocked;
    data['total_khata_amount'] = this.totalKhataAmount;
    data['total_used_amount'] = this.totalUsedAmount;
    return data;
  }
}
