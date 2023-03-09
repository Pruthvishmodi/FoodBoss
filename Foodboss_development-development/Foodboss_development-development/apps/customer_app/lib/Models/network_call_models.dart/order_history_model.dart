class OrderHistoryCall {
  bool? success;
  List<OrderH>? data;

  OrderHistoryCall({this.success, this.data});

  OrderHistoryCall.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <OrderH>[];
      json['data'].forEach((v) {
        data!.add(OrderH.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderH {
  int? id;
  String? orderStatus;
  int? orderTotal;
  String? deliveryDate;
  String? deliveryTime;
  Shop? shop;
  int? totalItems;
  ReturnItems? returnItems;
  int? returnItemsCount;
  int? returnAmount;
  int? finalAmount;
  bool? rated;
  String? reviews;
  int? rate =0;
  List<ProductList>? productList;

  OrderH(
      {this.id,
      this.orderStatus,
      this.orderTotal,
      this.deliveryDate,
      this.deliveryTime,
      this.shop,
      this.totalItems,
      this.returnItems,
      this.returnItemsCount,
      this.returnAmount,
      this.finalAmount,
      this.rated =false,
      this.reviews,
      this.rate,
      this.productList});

  OrderH.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderStatus = json['orderStatus'];
    orderTotal = json['orderTotal'];
    deliveryDate = json['delivery_Date'];
    deliveryTime = json['delivery_Time'];
    shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
    totalItems = json['total_items'];
    returnItems = json['return_items'] != null
        ? ReturnItems.fromJson(json['return_items'])
        : null;
    returnItemsCount = json['return_items_count'];
    returnAmount = json['return_amount'];
    finalAmount = json['final_amount'];
    rated = json['rated'];
    reviews = json['reviews'];
    rate = json['rate'] == null ? 0 : json['rate'];
    if (json['product_list'] != null) {
      productList = <ProductList>[];
      json['product_list'].forEach((v) {
        productList!.add(ProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['orderStatus'] = this.orderStatus;
    data['orderTotal'] = this.orderTotal;
    data['delivery_Date'] = this.deliveryDate;
    data['delivery_Time'] = this.deliveryTime;
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    data['total_items'] = this.totalItems;
    if (this.returnItems != null) {
      data['return_items'] = this.returnItems!.toJson();
    }
    data['return_items_count'] = this.returnItemsCount;
    data['return_amount'] = this.returnAmount;
    data['final_amount'] = this.finalAmount;
    data['rated'] = this.rated;
    data['reviews'] = this.reviews;
    data['rate'] = this.rate;
    if (this.productList != null) {
      data['product_list'] = this.productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shop {
  int? id;
  String? name;
  String? city;
  double? distance;
  String? image;

  Shop({this.id, this.name, this.city, this.distance, this.image});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    distance = json['distance'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    data['distance'] = this.distance;
    data['image'] = this.image;
    return data;
  }
}

class ReturnItems {
  List<ProductList>? productList;

  ReturnItems({this.productList});

  ReturnItems.fromJson(Map<String, dynamic> json) {
    if (json['product_list'] != null) {
      productList = <ProductList>[];
      json['product_list'].forEach((v) {
        productList!.add(ProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.productList != null) {
      data['product_list'] = this.productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductList {
  int? id;
  String? name;
  int? quantity;
  int? amount;

  ProductList({this.id, this.name, this.quantity, this.amount});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    return data;
  }
}
