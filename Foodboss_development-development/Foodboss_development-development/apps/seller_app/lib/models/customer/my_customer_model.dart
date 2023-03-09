class MyCustomerModel {
  bool? success;
  Data? data;

  MyCustomerModel({this.success, this.data});

  MyCustomerModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int? currentPage;
  List<CustomerData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <CustomerData>[];
      json['data'].forEach((v) {
        data!.add(new CustomerData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class CustomerData {
  int? id;
  int? userId;
  int? clientId;
  String? deliveryCharge;
  int? isBlock;
  String? createdAt;
  String? updatedAt;
  Client? client;

  CustomerData(
      {this.id,
      this.userId,
      this.clientId,
      this.deliveryCharge,
      this.isBlock,
      this.createdAt,
      this.updatedAt,
      this.client});

  CustomerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clientId = json['client_id'];
    deliveryCharge = json['delivery_charge'];
    isBlock = json['is_block'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['client_id'] = this.clientId;
    data['delivery_charge'] = this.deliveryCharge;
    data['is_block'] = this.isBlock;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? email;
  String? phone;
  // String? gender;
  // Null? dob;
  // String? apiToken;
  // int? userOtp;
  // String? otpVerify;
  // Null? uaddress;
  // Null? district;
  // Null? city;
  // Null? state;
  // Null? pincode;
  // Null? taluka;
  // Null? area;
  // Null? ulatitude;
  // Null? ulongitude;
  // Null? deviceToken;
  // Null? refercode;
  // Null? stripeId;
  // Null? cardBrand;
  // Null? cardLastFour;
  // Null? trialEndsAt;
  // Null? braintreeId;
  // Null? paypalEmail;
  // String? createdAt;
  // String? updatedAt;
  int? isUserBlocked;
  // Null? coins;
  // CustomFields? customFields;
  bool? hasMedia;
  List<Media>? media;

  Client(
      {this.id,
      this.name,
      this.email,
      this.phone,
      // this.gender,
      // this.dob,
      // this.apiToken,
      // this.userOtp,
      // this.otpVerify,
      // this.uaddress,
      // this.district,
      // this.city,
      // this.state,
      // this.pincode,
      // this.taluka,
      // this.area,
      // this.ulatitude,
      // this.ulongitude,
      // this.deviceToken,
      // this.refercode,
      // this.stripeId,
      // this.cardBrand,
      // this.cardLastFour,
      // this.trialEndsAt,
      // this.braintreeId,
      // this.paypalEmail,
      // this.createdAt,
      // this.updatedAt,
      this.isUserBlocked,
      // this.coins,
      // this.customFields,
      this.hasMedia,
      this.media});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    // gender = json['gender'];
    // dob = json['dob'];
    // apiToken = json['api_token'];
    // userOtp = json['user_otp'];
    // otpVerify = json['otp_verify'];
    // uaddress = json['uaddress'];
    // district = json['district'];
    // city = json['city'];
    // state = json['state'];
    // pincode = json['pincode'];
    // taluka = json['taluka'];
    // area = json['area'];
    // ulatitude = json['ulatitude'];
    // ulongitude = json['ulongitude'];
    // deviceToken = json['device_token'];
    // refercode = json['refercode'];
    // stripeId = json['stripe_id'];
    // cardBrand = json['card_brand'];
    // cardLastFour = json['card_last_four'];
    // trialEndsAt = json['trial_ends_at'];
    // braintreeId = json['braintree_id'];
    // paypalEmail = json['paypal_email'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    isUserBlocked = json['is_user_blocked'];
    // coins = json['coins'];
    // customFields = json['custom_fields'] != null
        // ? new CustomFields.fromJson(json['custom_fields'])
        // : null;
    hasMedia = json['has_media'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    // data['gender'] = this.gender;
    // data['dob'] = this.dob;
    // data['api_token'] = this.apiToken;
    // data['user_otp'] = this.userOtp;
    // data['otp_verify'] = this.otpVerify;
    // data['uaddress'] = this.uaddress;
    // data['district'] = this.district;
    // data['city'] = this.city;
    // data['state'] = this.state;
    // data['pincode'] = this.pincode;
    // data['taluka'] = this.taluka;
    // data['area'] = this.area;
    // data['ulatitude'] = this.ulatitude;
    // data['ulongitude'] = this.ulongitude;
    // data['device_token'] = this.deviceToken;
    // data['refercode'] = this.refercode;
    // data['stripe_id'] = this.stripeId;
    // data['card_brand'] = this.cardBrand;
    // data['card_last_four'] = this.cardLastFour;
    // data['trial_ends_at'] = this.trialEndsAt;
    // data['braintree_id'] = this.braintreeId;
    // data['paypal_email'] = this.paypalEmail;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    data['is_user_blocked'] = this.isUserBlocked;
    // data['coins'] = this.coins;
    // if (this.customFields != null) {
    //   data['custom_fields'] = this.customFields!.toJson();
    // }
    data['has_media'] = this.hasMedia;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class CustomFields {
//   Phone? phone;
//   Address? address;

//   CustomFields({this.phone, this.address});

//   CustomFields.fromJson(Map<String, dynamic> json) {
//     phone = json['phone'] != null ? new Phone.fromJson(json['phone']) : null;
//     address =
//         json['address'] != null ? new Address.fromJson(json['address']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.phone != null) {
//       data['phone'] = this.phone!.toJson();
//     }
//     if (this.address != null) {
//       data['address'] = this.address!.toJson();
//     }
//     return data;
//   }
// }

// class Phone {
//   String? value;
//   String? view;
//   String? name;

//   Phone({this.value, this.view, this.name});

//   Phone.fromJson(Map<String, dynamic> json) {
//     value = json['value'];
//     view = json['view'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['value'] = this.value;
//     data['view'] = this.view;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class Address {
//   Null? value;
//   Null? view;
//   String? name;

//   Address({this.value, this.view, this.name});

//   Address.fromJson(Map<String, dynamic> json) {
//     value = json['value'];
//     view = json['view'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['value'] = this.value;
//     data['view'] = this.view;
//     data['name'] = this.name;
//     return data;
//   }
// }

class Media {
  int? id;
  // String? modelType;
  // int? modelId;
  // String? collectionName;
  // String? name;
  // String? fileName;
  // String? mimeType;
  // String? disk;
  // int? size;
  // List<Null>? manipulations;
  // CustomProperties? customProperties;
  // List<Null>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? url;
  String? thumb;
  String? icon;
  String? formatedSize;

  Media(
      {this.id,
      // this.modelType,
      // this.modelId,
      // this.collectionName,
      // this.name,
      // this.fileName,
      // this.mimeType,
      // this.disk,
      // this.size,
      // this.manipulations,
      // this.customProperties,
      // this.responsiveImages,
      // this.orderColumn,
      this.createdAt,
      this.updatedAt,
      this.url,
      this.thumb,
      this.icon,
      this.formatedSize});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // modelType = json['model_type'];
    // modelId = json['model_id'];
    // collectionName = json['collection_name'];
    // name = json['name'];
    // fileName = json['file_name'];
    // mimeType = json['mime_type'];
    // disk = json['disk'];
    // size = json['size'];
    // if (json['manipulations'] != null) {
    //   manipulations = <Null>[];
    //   json['manipulations'].forEach((v) {
    //     manipulations!.add(new Null.fromJson(v));
    //   });
    // }
    // customProperties = json['custom_properties'] != null
    //     ? new CustomProperties.fromJson(json['custom_properties'])
    //     : null;
    // if (json['responsive_images'] != null) {
    //   responsiveImages = <Null>[];
    //   json['responsive_images'].forEach((v) {
    //     responsiveImages!.add(new Null.fromJson(v));
    //   });
    // }
    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    url = json['url'];
    thumb = json['thumb'];
    icon = json['icon'];
    formatedSize = json['formated_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    // data['model_type'] = this.modelType;
    // data['model_id'] = this.modelId;
    // data['collection_name'] = this.collectionName;
    // data['name'] = this.name;
    // data['file_name'] = this.fileName;
    // data['mime_type'] = this.mimeType;
    // data['disk'] = this.disk;
    // data['size'] = this.size;
    // if (this.manipulations != null) {
    //   data['manipulations'] =
    //       this.manipulations!.map((v) => v.toJson()).toList();
    // }
    // if (this.customProperties != null) {
    //   data['custom_properties'] = this.customProperties!.toJson();
    // }
    // if (this.responsiveImages != null) {
    //   data['responsive_images'] =
    //       this.responsiveImages!.map((v) => v.toJson()).toList();
    // }
    data['order_column'] = this.orderColumn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    data['thumb'] = this.thumb;
    data['icon'] = this.icon;
    data['formated_size'] = this.formatedSize;
    return data;
  }
}




