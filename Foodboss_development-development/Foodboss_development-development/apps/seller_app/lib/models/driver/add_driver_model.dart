class AddDriverRequestModel {
  String? riderId;
  String? charges;
  String? isTrusted;

  AddDriverRequestModel({this.riderId, this.charges, this.isTrusted});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rider_id'] = this.riderId;
    data['charges'] = this.charges;
    data['is_trusted'] = this.isTrusted;
    return data;
  }
}