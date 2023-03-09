class RemoveDriverReqestModel {
  String? riderId;

  RemoveDriverReqestModel({this.riderId});

  RemoveDriverReqestModel.fromJson(Map<String, dynamic> json) {
    riderId = json['rider_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rider_id'] = this.riderId;
    return data;
  }
}
