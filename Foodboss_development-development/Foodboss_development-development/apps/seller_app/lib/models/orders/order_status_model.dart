class OrderStatus {
  bool? success;
  List<StatusData>? data;

  OrderStatus({this.success, this.data});

  OrderStatus.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <StatusData>[];
      json['data'].forEach((v) {
        data!.add(StatusData.fromJson(v));
      });
    }
  }
}

class StatusData {
  int? id;
  String? status;

  StatusData(
      {this.id,
      this.status,});

  StatusData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
  }
}