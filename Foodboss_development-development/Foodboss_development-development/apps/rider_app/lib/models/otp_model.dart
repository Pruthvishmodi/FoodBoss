class OtpRequestModel {
  String? phone;
  String? otp;

  OtpRequestModel({this.phone, this.otp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    return data;
  }
}

class OtpResponseModel {
  bool? success;
  OtpData? otpdata;
  String? message;

  OtpResponseModel({this.success, this.otpdata, this.message});

  OtpResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    otpdata = json['data'] != null ? new OtpData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.otpdata != null) {
      data['data'] = this.otpdata!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class OtpData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? apiToken;
  String? userOtp;
  String? otpVerify;
  // Null? uaddress;
  // Null? district;
  // Null? city;
  // Null? state;
  // Null? pincode;
  // Null? taluka;
  // Null? area;
  // Null? ulatitude;
  // Null? ulongitude;
  // String? deviceToken;
  // Null? refercode;
  // Null? stripeId;
  // Null? cardBrand;
  // Null? cardLastFour;
  // Null? trialEndsAt;
  // Null? braintreeId;
  // Null? paypalEmail;
  // String? createdAt;
  // String? updatedAt;
  // int? isUserBlocked;
  // Null? coins;
  // List<Null>? customFields;
  // bool? hasMedia;
  // List<Null>? media;

  OtpData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.apiToken,
    this.userOtp,
    this.otpVerify,
  });

  OtpData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    apiToken = json['api_token'];
    userOtp = json['user_otp'];
    otpVerify = json['otp_verify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['api_token'] = this.apiToken;
    data['user_otp'] = this.userOtp;
    data['otp_verify'] = this.otpVerify;
    return data;
  }
}
