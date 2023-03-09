class CompletedOrderModel {
  bool? success;
  List<Data>? data;

  CompletedOrderModel({this.success, this.data});

  CompletedOrderModel.fromJson(Map<String, dynamic> json) {
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
  String? bagNo;
  String? date;
  String? time;
  int? amount;
  int? items;
  String? type;
  String? status;
  String? comments;
  int? deliveryCharges;
  int? subTotal;
  String? reason = '';
  List<ProductList>? productList;
  Customer? customer;
  Driver? driver;

  Data(
      {this.id,
      this.bagNo,
      this.date,
      this.time,
      this.amount,
      this.items,
      this.type,
      this.status,
      this.comments,
      this.deliveryCharges,
      this.subTotal,
      this.reason,
      this.productList,
      this.customer,
      this.driver});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bagNo = json['bag_no'];
    date = json['date'];
    time = json['time'];
    amount = json['amount'];
    items = json['items'];
    type = json['type'];
    status = json['status'];
    comments = json['comments'];
    deliveryCharges = json['delivery_charges'];
    subTotal = json['sub_total'];
    reason = json['reason'];
    if (json['product_list'] != null) {
      productList = <ProductList>[];
      json['product_list'].forEach((v) {
        productList!.add(new ProductList.fromJson(v));
      });
    }
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    driver =
        json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bag_no'] = this.bagNo;
    data['date'] = this.date;
    data['time'] = this.time;
    data['amount'] = this.amount;
    data['items'] = this.items;
    data['type'] = this.type;
    data['status'] = this.status;
    data['comments'] = this.comments;
    data['delivery_charges'] = this.deliveryCharges;
    data['sub_total'] = this.subTotal;
    data['reason'] = this.reason;
    if (this.productList != null) {
      data['product_list'] = this.productList!.map((v) => v.toJson()).toList();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    return data;
  }
}

class ProductList {
  int? id;
  String? name;
  double? weight;
  int? quantity;
  String? unit;
  int? price;
  String? image;
  String? type;
  String? reason = '';

  ProductList(
      {this.id,
      this.name,
      this.weight,
      this.quantity,
      this.unit,
      this.price,
      this.image,
      this.type,
      this.reason});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    weight = double.parse(json['weight'].toString());
    quantity = json['quantity'];
    unit = json['unit'];
    price = json['price'];
    image = json['image'];
    type = json['type'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['weight'] = this.weight;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    data['price'] = this.price;
    data['image'] = this.image;
    data['type'] = this.type;
    data['reason'] = this.reason;
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? fcmToken;
  String? image;

  Customer(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.fcmToken,
      this.image});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    fcmToken = json['fcmToken'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['fcmToken'] = this.fcmToken;
    data['image'] = this.image;
    return data;
  }
}

class Driver {
  int? id;
  String? name;
  String? phone;
  String? image;
  String? vehicle;

  Driver({this.id, this.name, this.phone, this.image, this.vehicle});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
    vehicle = json['vehicle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['vehicle'] = this.vehicle;
    return data;
  }
}
