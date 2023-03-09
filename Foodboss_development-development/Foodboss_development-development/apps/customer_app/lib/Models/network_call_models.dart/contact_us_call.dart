class ContactUs {
  bool? success;
  Data? data;

  ContactUs({this.success, this.data});

  ContactUs.fromJson(Map<String, dynamic> json) {
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
  Client? client;
  Seller? seller;
  DeliveryBoy? deliveryBoy;
  Salesman? salesman;

  Data({this.client, this.seller, this.deliveryBoy, this.salesman});

  Data.fromJson(Map<String, dynamic> json) {
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
    deliveryBoy = json['delivery_boy'] != null
        ? new DeliveryBoy.fromJson(json['delivery_boy'])
        : null;
    salesman = json['salesman'] != null
        ? new Salesman.fromJson(json['salesman'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    if (this.deliveryBoy != null) {
      data['delivery_boy'] = this.deliveryBoy!.toJson();
    }
    if (this.salesman != null) {
      data['salesman'] = this.salesman!.toJson();
    }
    return data;
  }
}

class Client {
  String? foodBossContactNumber;
  String? foodBossEmailAddress;
  String? clientAppVersion;
  String? clientAppTitle;
  String? clientAppMessage;
  bool? isClientAppForceUpdate;

  Client(
      {this.foodBossContactNumber,
      this.foodBossEmailAddress,
      this.clientAppVersion,
      this.clientAppTitle,
      this.clientAppMessage,
      this.isClientAppForceUpdate});

  Client.fromJson(Map<String, dynamic> json) {
    foodBossContactNumber = json['food_boss_contact_number'];
    foodBossEmailAddress = json['food_boss_email_address'];
    clientAppVersion = json['client_app_version'];
    clientAppTitle = json['client_app_title'];
    clientAppMessage = json['client_app_message'];
    isClientAppForceUpdate = json['is_client_app_force_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food_boss_contact_number'] = this.foodBossContactNumber;
    data['food_boss_email_address'] = this.foodBossEmailAddress;
    data['client_app_version'] = this.clientAppVersion;
    data['client_app_title'] = this.clientAppTitle;
    data['client_app_message'] = this.clientAppMessage;
    data['is_client_app_force_update'] = this.isClientAppForceUpdate;
    return data;
  }
}

class Seller {
  String? sellerContactNumber;
  String? sellerEmailAddress;
  String? sellerAppVersion;
  String? sellerAppTitle;
  String? sellerAppMessage;
  bool? isSellerAppForceUpdate;

  Seller(
      {this.sellerContactNumber,
      this.sellerEmailAddress,
      this.sellerAppVersion,
      this.sellerAppTitle,
      this.sellerAppMessage,
      this.isSellerAppForceUpdate});

  Seller.fromJson(Map<String, dynamic> json) {
    sellerContactNumber = json['seller_contact_number'];
    sellerEmailAddress = json['seller_email_address'];
    sellerAppVersion = json['seller_app_version'];
    sellerAppTitle = json['seller_app_title'];
    sellerAppMessage = json['seller_app_message'];
    isSellerAppForceUpdate = json['is_seller_app_force_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seller_contact_number'] = this.sellerContactNumber;
    data['seller_email_address'] = this.sellerEmailAddress;
    data['seller_app_version'] = this.sellerAppVersion;
    data['seller_app_title'] = this.sellerAppTitle;
    data['seller_app_message'] = this.sellerAppMessage;
    data['is_seller_app_force_update'] = this.isSellerAppForceUpdate;
    return data;
  }
}

class DeliveryBoy {
  String? deliveryboyContactNumber;
  String? deliveryboyEmailAddress;
  String? deliveryBoyAppVersion;
  String? deliveryBoyAppTitle;
  String? deliveryBoyAppMessage;
  bool? isDeliveryBoyAppForceUpdate;

  DeliveryBoy(
      {this.deliveryboyContactNumber,
      this.deliveryboyEmailAddress,
      this.deliveryBoyAppVersion,
      this.deliveryBoyAppTitle,
      this.deliveryBoyAppMessage,
      this.isDeliveryBoyAppForceUpdate});

  DeliveryBoy.fromJson(Map<String, dynamic> json) {
    deliveryboyContactNumber = json['deliveryboy_contact_number'];
    deliveryboyEmailAddress = json['deliveryboy_email_address'];
    deliveryBoyAppVersion = json['delivery_boy_app_version'];
    deliveryBoyAppTitle = json['delivery_boy_app_title'];
    deliveryBoyAppMessage = json['delivery_boy_app_message'];
    isDeliveryBoyAppForceUpdate = json['is_delivery_boy_app_force_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deliveryboy_contact_number'] = this.deliveryboyContactNumber;
    data['deliveryboy_email_address'] = this.deliveryboyEmailAddress;
    data['delivery_boy_app_version'] = this.deliveryBoyAppVersion;
    data['delivery_boy_app_title'] = this.deliveryBoyAppTitle;
    data['delivery_boy_app_message'] = this.deliveryBoyAppMessage;
    data['is_delivery_boy_app_force_update'] = this.isDeliveryBoyAppForceUpdate;
    return data;
  }
}

class Salesman {
  String? salesmanContactNumber;
  String? salesmanEmailAddress;
  String? salesmanAppVersion;
  String? salesmanAppTitle;
  String? salesmanAppMessage;
  bool? isSalesmanAppForceUpdate;

  Salesman(
      {this.salesmanContactNumber,
      this.salesmanEmailAddress,
      this.salesmanAppVersion,
      this.salesmanAppTitle,
      this.salesmanAppMessage,
      this.isSalesmanAppForceUpdate});

  Salesman.fromJson(Map<String, dynamic> json) {
    salesmanContactNumber = json['salesman_contact_number'];
    salesmanEmailAddress = json['salesman_email_address'];
    salesmanAppVersion = json['salesman_app_version'];
    salesmanAppTitle = json['salesman_app_title'];
    salesmanAppMessage = json['salesman_app_message'];
    isSalesmanAppForceUpdate = json['is_salesman_app_force_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['salesman_contact_number'] = this.salesmanContactNumber;
    data['salesman_email_address'] = this.salesmanEmailAddress;
    data['salesman_app_version'] = this.salesmanAppVersion;
    data['salesman_app_title'] = this.salesmanAppTitle;
    data['salesman_app_message'] = this.salesmanAppMessage;
    data['is_salesman_app_force_update'] = this.isSalesmanAppForceUpdate;
    return data;
  }
}
