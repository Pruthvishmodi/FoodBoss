class DashboardModel {
  bool? success;
  Data? data;

  DashboardModel({this.success, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
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
  OrderCount? orderCount;
  SalesCount? salesCount;

  Data({this.orderCount, this.salesCount});

  Data.fromJson(Map<String, dynamic> json) {
    orderCount = json['order_count'] != null
        ? new OrderCount.fromJson(json['order_count'])
        : null;
    salesCount = json['sales_count'] != null
        ? new SalesCount.fromJson(json['sales_count'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderCount != null) {
      data['order_count'] = this.orderCount!.toJson();
    }
    if (this.salesCount != null) {
      data['sales_count'] = this.salesCount!.toJson();
    }
    return data;
  }
}

class OrderCount {
  int? pending;
  int? packed;
  int? shipped;
  int? completed;

  OrderCount({this.pending, this.packed, this.shipped, this.completed});

  OrderCount.fromJson(Map<String, dynamic> json) {
    pending = json['pending'];
    packed = json['packed'];
    shipped = json['shipped'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pending'] = this.pending;
    data['packed'] = this.packed;
    data['shipped'] = this.shipped;
    data['completed'] = this.completed;
    return data;
  }
}

class SalesCount {
  int? today;
  int? monthly;
  String? ordersLeft;

  SalesCount({this.today, this.monthly, this.ordersLeft});

  SalesCount.fromJson(Map<String, dynamic> json) {
    today = json['today'];
    monthly = json['monthly'];
    ordersLeft = json['orders_left'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['today'] = this.today;
    data['monthly'] = this.monthly;
    data['orders_left'] = this.ordersLeft;
    return data;
  }
}
