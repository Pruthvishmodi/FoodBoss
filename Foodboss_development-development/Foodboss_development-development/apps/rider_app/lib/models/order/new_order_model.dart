class NewOrderModel {
  bool? success;
  Data? data;

  NewOrderModel({this.success, this.data});

  NewOrderModel.fromJson(Map<String, dynamic> json) {
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
  int? totalNewOrders;
  List<NewOrdersStore>? newOrdersStore;

  Data({this.totalNewOrders, this.newOrdersStore});

  Data.fromJson(Map<String, dynamic> json) {
    totalNewOrders = json['total_new_orders'];
    if (json['new_orders_store'] != null) {
      newOrdersStore = <NewOrdersStore>[];
      json['new_orders_store'].forEach((v) {
        newOrdersStore!.add(new NewOrdersStore.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_new_orders'] = this.totalNewOrders;
    if (this.newOrdersStore != null) {
      data['new_orders_store'] =
          this.newOrdersStore!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewOrdersStore {
  int? orderId;
  int? shopId;
  String? shopName;
  String? shopPhoneNumber;
  String? address;
  String? area;
  String? latitude;
  String? longitude;
  String? date;
  int? totalOrders;

  NewOrdersStore(
      {this.orderId,
      this.shopId,
      this.shopName,
      this.shopPhoneNumber,
      this.address,
      this.area,
      this.latitude,
      this.longitude,
      this.date,
      this.totalOrders});

  NewOrdersStore.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopPhoneNumber = json['shop_phone_number'];
    address = json['address'];
    area = json['area'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    date = json['date'];
    totalOrders = json['total_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['shop_phone_number'] = this.shopPhoneNumber;
    data['address'] = this.address;
    data['area'] = this.area;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['date'] = this.date;
    data['total_orders'] = this.totalOrders;
    return data;
  }
}
