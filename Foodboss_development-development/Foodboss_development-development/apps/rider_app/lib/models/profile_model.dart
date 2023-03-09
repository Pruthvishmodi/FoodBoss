class GetProfileModel {
  bool? success;
  Driver? data;

  GetProfileModel({this.success, this.data});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Driver.fromJson(json['data']) : null;
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

class Driver {
  int? id;
  String? driverName;
  String? driverImage;
  String? driverNumber;
  String? area;
  String? start;
  String? end;
  String? vehicleNo;
  String? licenceNo;
  String? licenceImage;

  Driver(
      {this.id,
      this.driverName,
      this.driverImage,
      this.driverNumber,
      this.area,
      this.start,
      this.end,
      this.vehicleNo,
      this.licenceNo,
      this.licenceImage});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverName = json['driver_name'];
    driverImage = json['driver_image'];
    driverNumber = json['driver_number'];
    area = json['area'];
    start = json['start'];
    end = json['end'];
    vehicleNo = json['vehicle_no'];
    licenceNo = json['licence_no'];
    licenceImage = json['licence_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driver_name'] = this.driverName;
    data['driver_image'] = this.driverImage;
    data['driver_number'] = this.driverNumber;
    data['area'] = this.area;
    data['start'] = this.start;
    data['end'] = this.end;
    data['vehicle_no'] = this.vehicleNo;
    data['licence_no'] = this.licenceNo;
    data['licence_image'] = this.licenceImage;
    return data;
  }
}
