import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Models/shop_model.dart';

class OngoingOrderCall {
  bool? success;
  List<OrderModel>? orders = <OrderModel>[];

  OngoingOrderCall({this.success = false, this.orders});

  OngoingOrderCall.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    orders = <OrderModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        orders!.add(OrderModel.fromOngoingCall(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (orders != null) {
      data['data'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderModel {
  int? id;
  int? totalPrice;
  List<Product>? items = <Product>[];
  List<Product>? returnItems = <Product>[];
  ShopModel? store = ShopModel();
  DeliveryBoy? deliveryBoy = DeliveryBoy();
  String? status;
  String? customerComments;
  String? arrivalDate;
  int? totalItems;
  double? price;
  String? storeName;
  String? address;
  String? phone;
  double? deliveryCharge;
  String? paymentMethod;
  int? totalDiscount;
  int? returnItemsCount;
  double? returnAmount = 0;
  double? finalAmount;
  String? orderDatenTime;

  OrderModel(
      {this.id = 0,
      this.totalPrice = 0,
      this.items,
      this.store,
      this.deliveryBoy,
      this.status = '',
      this.customerComments = '',
      this.arrivalDate = '',
      this.address = '',
      this.deliveryCharge = 0,
      this.finalAmount = 0,
      this.orderDatenTime = '',
      this.paymentMethod = '',
      this.phone = '',
      this.price = 0,
      this.returnAmount = 0,
      this.returnItems,
      this.returnItemsCount = 0,
      this.storeName = '',
      this.totalDiscount = 0,
      this.totalItems = 0});

  OrderModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // totalPrice = json['total_price'];
    // if (json['items'] != null) {
    //   items = <Product>[];
    //   json['items'].forEach((v) {
    //     items!.add(Product.fromOrderDetails(v));
    //   });
    // }
    // store = json['store'] != null ? new ShopModel.ongoingOrderDetailCall(json['store']) : null;
    // deliveryBoy = json['delivery_boy'] != null
    //     ? DeliveryBoy.fromJson(json['delivery_boy'])
    //     : null;
    // status = json['status'];
    // customerComments = json['Customer_comments'];
    // arrivalDate = json['arrival_date'];
    // deliveryCharge = json['delivery_charge'];
    // print(json['payment_method']);
    // paymentMethod = json['payment_method'];
    //
    orderDatenTime = json['order_date'];
    id = json['id'];
    totalPrice = json['total_price'];
    totalDiscount = json['total_discount'];
    returnItems = <Product>[];
    if (json['return_items'] != null) {
      json['return_items'].forEach((v) {
        returnItems!.add(Product.fromOrderDetails(v));
      });
    }
    items = <Product>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items!.add(Product.fromOrderDetails(v));
      });
    }
    returnItemsCount = json['return_items_count'];
    // print(json['return_amount']);
    returnAmount = double.parse(json['return_amount'].toString());
    finalAmount = double.parse(json['final_amount'].toString());
    store = json['store'] != null
        ? ShopModel.ongoingOrderDetailCall(json['store'])
        : ShopModel();
    deliveryBoy = json['delivery_boy'] != null
        ? DeliveryBoy.fromJson(json['delivery_boy'])
        : DeliveryBoy();
    status = json['status'];
    customerComments = json['Customer_comments'];
    arrivalDate = json['arrival_date'];
    deliveryCharge = double.parse(json['delivery_charge'].toString());
    paymentMethod = json['payment_method'];
  }

  OrderModel.fromOngoingCall(Map<String, dynamic> json) {
    id = json['id'];
    totalItems = json['total_items'];
    price = double.parse(json['price'].toString());
    storeName = json['store_name'];
    address = json['address'];
    phone = json['phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total_price'] = totalPrice;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (store != null) {
      data['store'] = store!.toJson();
    }
    if (deliveryBoy != null) {
      data['delivery_boy'] = deliveryBoy!.toJson();
    }
    data['status'] = status;
    data['Customer_comments'] = customerComments;
    data['arrival_date'] = arrivalDate;

    return data;
  }
}

class DeliveryBoy {
  String? name;
  String? phone;
  String? let;
  String? lang;
  String? image;
  String? status;

  DeliveryBoy({this.name, this.phone, this.let, this.lang});

  DeliveryBoy.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    let = json['let'];
    lang = json['lang'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['let'] = let;
    data['lang'] = lang;
    return data;
  }
}
