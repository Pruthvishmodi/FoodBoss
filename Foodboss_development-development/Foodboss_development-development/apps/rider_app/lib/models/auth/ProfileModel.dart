class ProfileModel {
  bool? success;
  List<Data>? data;

  ProfileModel({this.success, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
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

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? dob;
  String? apiToken;
  int? userOtp;
  String? otpVerify;
  String? uaddress;
  String? district;
  String? city;
  String? state;
  String? pincode;
  String? taluka;
  Null? area;
  String? ulatitude;
  String? ulongitude;
  String? deviceToken;
  Null? refercode;
  Null? stripeId;
  Null? cardBrand;
  Null? cardLastFour;
  Null? trialEndsAt;
  Null? braintreeId;
  Null? paypalEmail;
  String? createdAt;
  String? updatedAt;
  int? isUserBlocked;
  String? coins;
  bool? isShopClose;
  String? minimumOrderPrice;
  String? openedAt;
  String? closedAt;
  String? ownerImage;
  OpenDays? openDays;
  // List<Null>? customFields;
  bool? hasMedia;
  String? image;
  // List<Null>? media;

  Data(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.gender,
      this.dob,
      this.apiToken,
      this.userOtp,
      this.otpVerify,
      this.uaddress,
      this.district,
      this.city,
      this.state,
      this.pincode,
      this.taluka,
      this.area,
      this.ulatitude,
      this.ulongitude,
      this.deviceToken,
      this.refercode,
      this.stripeId,
      this.cardBrand,
      this.cardLastFour,
      this.trialEndsAt,
      this.braintreeId,
      this.paypalEmail,
      this.createdAt,
      this.updatedAt,
      this.isUserBlocked,
      this.coins,
      this.isShopClose,
      this.minimumOrderPrice,
      this.openedAt,
      this.closedAt,
      this.ownerImage,
      this.openDays,
      // this.customFields,
      this.hasMedia,
      this.image,
      // this.media
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    dob = json['dob'];
    apiToken = json['api_token'];
    userOtp = json['user_otp'];
    otpVerify = json['otp_verify'];
    uaddress = json['uaddress'];
    district = json['district'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    taluka = json['taluka'];
    area = json['area'];
    ulatitude = json['ulatitude'];
    ulongitude = json['ulongitude'];
    deviceToken = json['device_token'];
    refercode = json['refercode'];
    stripeId = json['stripe_id'];
    cardBrand = json['card_brand'];
    cardLastFour = json['card_last_four'];
    trialEndsAt = json['trial_ends_at'];
    braintreeId = json['braintree_id'];
    paypalEmail = json['paypal_email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isUserBlocked = json['is_user_blocked'];
    coins = json['coins'];
    isShopClose = json['is_shop_close'];
    minimumOrderPrice = json['minimum_order_price'];
    openedAt = json['opened_at'];
    closedAt = json['closed_at'];
    ownerImage = json['owner_image'];
    openDays = json['open_days'] != null
        ? new OpenDays.fromJson(json['open_days'])
        : null;
    // if (json['custom_fields'] != null) {
    //   customFields = <Null>[];
    //   json['custom_fields'].forEach((v) {
    //     customFields!.add(new Null.fromJson(v));
    //   });
    // }
    hasMedia = json['has_media'];
    image = json['image'];
    // if (json['media'] != null) {
    //   media = <Null>[];
    //   json['media'].forEach((v) {
    //     media!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['api_token'] = this.apiToken;
    data['user_otp'] = this.userOtp;
    data['otp_verify'] = this.otpVerify;
    data['uaddress'] = this.uaddress;
    data['district'] = this.district;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['taluka'] = this.taluka;
    data['area'] = this.area;
    data['ulatitude'] = this.ulatitude;
    data['ulongitude'] = this.ulongitude;
    data['device_token'] = this.deviceToken;
    data['refercode'] = this.refercode;
    data['stripe_id'] = this.stripeId;
    data['card_brand'] = this.cardBrand;
    data['card_last_four'] = this.cardLastFour;
    data['trial_ends_at'] = this.trialEndsAt;
    data['braintree_id'] = this.braintreeId;
    data['paypal_email'] = this.paypalEmail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_user_blocked'] = this.isUserBlocked;
    data['coins'] = this.coins;
    data['is_shop_close'] = this.isShopClose;
    data['minimum_order_price'] = this.minimumOrderPrice;
    data['opened_at'] = this.openedAt;
    data['closed_at'] = this.closedAt;
    data['owner_image'] = this.ownerImage;
    if (this.openDays != null) {
      data['open_days'] = this.openDays!.toJson();
    }
    // if (this.customFields != null) {
    //   data['custom_fields'] =
    //       this.customFields!.map((v) => v.toJson()).toList();
    // }
    data['has_media'] = this.hasMedia;
    data['image'] = this.image;
    // if (this.media != null) {
    //   data['media'] = this.media!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class OpenDays {
  bool? sunday;
  bool? monday;
  bool? tuesday;
  bool? wednesday;
  bool? thursday;
  bool? friday;
  bool? saturday;

  OpenDays(
      {this.sunday,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday});

  OpenDays.fromJson(Map<String, dynamic> json) {
    sunday = json['sunday'];
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sunday'] = this.sunday;
    data['monday'] = this.monday;
    data['tuesday'] = this.tuesday;
    data['wednesday'] = this.wednesday;
    data['thursday'] = this.thursday;
    data['friday'] = this.friday;
    data['saturday'] = this.saturday;
    return data;
  }
}
