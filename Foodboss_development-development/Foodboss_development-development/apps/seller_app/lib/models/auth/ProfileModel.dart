class ProfileModel {
  bool? success;
  List<Profile>? data;

  ProfileModel({this.success, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Profile>[];
      json['data'].forEach((v) {
        data!.add(new Profile.fromJson(v));
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

class Profile {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;
  Null? dob;
  String? apiToken;
  int? userOtp;
  String? otpVerify;
  Null? uaddress;
  Null? district;
  Null? city;
  Null? state;
  Null? pincode;
  Null? taluka;
  Null? area;
  Null? ulatitude;
  Null? ulongitude;
  String? deviceToken;
  String? refercode;
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
  String? shopName;
  bool? isShopClose;
  String? minimumOrderPrice;
  String? openedAt;
  String? closedAt;
  String? shopAddress1;
  String? shopAddress2;
  String? shopArea;
  String? shopState;
  String? shopDistrict;
  String? qrNumber;
  String? shopCity;
  int? shopPincode;
  String? ownerImage;
  String? shopImage;
  OpenDays? openDays;
  List<Null>? customFields;
  bool? hasMedia;
  String? image;
  List<Null>? media;

  Profile({
    this.id,
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
    this.qrNumber,
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
    this.shopName,
    this.isShopClose,
    this.minimumOrderPrice,
    this.openedAt,
    this.closedAt,
    this.shopAddress1,
    this.shopAddress2,
    this.shopArea,
    this.shopState,
    this.shopDistrict,
    this.shopCity,
    this.shopPincode,
    this.ownerImage,
    this.shopImage,
    this.openDays,
    // this.customFields,
    this.hasMedia,
    this.image,
    // this.media
  });

  Profile.fromJson(Map<String, dynamic> json) {
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
    qrNumber = json['qr_number'];
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
    shopName = json['shop_name'];
    isShopClose = json['is_shop_close'];
    minimumOrderPrice = json['minimum_order_price'];
    openedAt = json['opened_at'];
    closedAt = json['closed_at'];
    shopAddress1 = json['shop_address_1'];
    shopAddress2 = json['shop_address_2'];
    shopArea = json['shop_area'];
    shopState = json['shop_state'];
    shopDistrict = json['shop_district'];
    shopCity = json['shop_city'];
    shopPincode = json['shop_pincode'];
    ownerImage = json['owner_image'];
    shopImage = json['shop_image'] != null ? json['shop_image'] : null;
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
    data['qr_number'] = this.qrNumber;
    data['coins'] = this.coins;
    data['shop_name'] = this.shopName;
    data['is_shop_close'] = this.isShopClose;
    data['minimum_order_price'] = this.minimumOrderPrice;
    data['opened_at'] = this.openedAt;
    data['closed_at'] = this.closedAt;
    data['shop_address_1'] = this.shopAddress1;
    data['shop_address_2'] = this.shopAddress2;
    data['shop_area'] = this.shopArea;
    data['shop_state'] = this.shopState;
    data['shop_district'] = this.shopDistrict;
    data['shop_city'] = this.shopCity;
    data['shop_pincode'] = this.shopPincode;
    data['owner_image'] = this.ownerImage;
    data['shop_image'] = this.shopImage;
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
