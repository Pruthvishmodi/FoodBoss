class CRPOrderModel {
  bool? success;
  CRPData? data;

  CRPOrderModel({this.success = false, this.data});

  CRPOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    data = json['data'] != null ? CRPData.fromJson(json['data']) : CRPData();
  }
}

class CRPData {
  int? totalShippedOrder;
  List<NewOrders>? newOrders;

  CRPData({this.totalShippedOrder = 0, this.newOrders});

  CRPData.fromJson(Map<String, dynamic> json) {
    totalShippedOrder = json['total_shipped_order'] ?? 0;
    newOrders = <NewOrders>[];
    if (json['new_orders'] != null) {
      List<NewOrders> daummyOrders = <NewOrders>[];
      json['new_orders'].forEach((v) {
        daummyOrders.add(NewOrders.fromJson(v));
      });
      newOrders = daummyOrders;
    }
  }
}

class NewOrders {
  int? totalOrder;
  int? deliveredOrder;
  int? returnedOrder;
  String? date;
  String? deliveredDate;
  String? deliveredTime;
  String? area;
  String? pickupAddress;
  String? latitude;
  String? longitude;
  int? totalItems;
  int? returnItem;
  int? deliveredItems;
  int? amountCollectedOld;
  int? amountCollectedNew;
  int? finalAmount;
  String? driverName;
  int? driverId;
  String? driverNumber;
  String? paymentMethod;
  List<ReturnItems>? returnItems;

  NewOrders(
      {this.totalOrder = 0,
      this.deliveredOrder = 0,
      this.returnedOrder = 0,
      this.date = '',
      this.deliveredDate = '',
      this.deliveredTime = '',
      this.area = '',
      this.pickupAddress = '',
      this.latitude = '',
      this.longitude = '',
      this.totalItems = 0,
      this.returnItem = 0,
      this.finalAmount = 0,
      this.deliveredItems = 0,
      this.amountCollectedOld = 0,
      this.amountCollectedNew = 0,
      this.driverName = '',
      this.driverId = 0,
      this.driverNumber = '',
      this.paymentMethod = '',
      this.returnItems});

  NewOrders.fromJson(Map<String, dynamic> json) {
    totalOrder = json['total_order'] ?? 0;
    deliveredOrder = json['delivered_order'] ?? 0;
    returnedOrder = json['returned_order'] ?? 0;
    date = json['date'] ?? '';
    deliveredDate = json['delivered_date'] ?? '';
    deliveredTime = json['delivered_time'] ?? '';
    area = json['area'] ?? '';
    pickupAddress = json['pickup_address'] ?? '';
    latitude = json['latitude'] ?? '';
    longitude = json['longitude'] ?? '';
    totalItems = json['total_items'] ?? '';
    returnItem = json['return_item'] ?? '';
    deliveredItems = json['delivered_items'] ?? '';
    amountCollectedOld = json['amount_collected_old'] ?? 0;
    amountCollectedNew = json['amount_collected_new'] ?? 0;
    finalAmount = json['amount_collected_cod_new'] ?? 0;
    driverName = json['driver_name'] ?? '';
    driverId = json['driver_id'] ?? 0;
    driverNumber = json['driver_number'] ?? '';
    paymentMethod = json['payment_method'] ?? '';
    returnItems = <ReturnItems>[];
    if (json['return_items'] != null) {
      var dummyItems = <ReturnItems>[];
      json['return_items'].forEach((v) {
        dummyItems.add(ReturnItems.fromJson(v));
      });
      returnItems = dummyItems;
    }
  }
}

class ReturnItems {
  int? id;
  String? name;
  int? price;
  int? discountPrice;
  int? quantity;
  String? unit;
  int? weight;
  bool? hasMedia;
  List<Media>? media;

  ReturnItems(
      {this.id = 0,
      this.name = '',
      this.price = 0,
      this.discountPrice = 0,
      this.quantity = 0,
      this.unit = '',
      this.weight = 0,
      this.hasMedia = false,
      this.media});

  ReturnItems.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    price = json['price'] ?? 0;
    discountPrice = json['discount_price'] ?? 0;
    quantity = json['quantity'] ?? 0;
    unit = json['unit'] ?? '';
    weight = json['weight'] ?? 0;
    hasMedia = json['has_media'] ?? false;
    media = <Media>[];
    if (json['media'] != null) {
      List<Media> dummyMedia = <Media>[];
      json['media'].forEach((v) {
        dummyMedia.add(Media.fromJson(v));
      });
      media = dummyMedia;
    }
  }
}

class Media {
  int? id;
  String? url;
  String? thumb;
  String? icon;

  Media({
    this.id = 0,
    this.url = '',
    this.thumb = '',
    this.icon = '',
  });

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    url = json['url'] ?? '';
    thumb = json['thumb'] ?? '';
    icon = json['icon'] ?? '';
  }
}
