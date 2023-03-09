class SetKhataLimitModel {
  String? customerId;
  String? khataLimit;
  String? khataAccept;

  SetKhataLimitModel({this.customerId, this.khataLimit,this.khataAccept});

  SetKhataLimitModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    khataLimit = json['khata_limit'];
    khataAccept = json['khata_accept'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['khata_limit'] = this.khataLimit;
    data['khata_accept'] = this.khataAccept;
    return data;
  }
}
