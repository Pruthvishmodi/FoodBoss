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

  Data({this.orderCount});

  Data.fromJson(Map<String, dynamic> json) {
    orderCount = json['order_count'] != null
        ? new OrderCount.fromJson(json['order_count'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderCount != null) {
      data['order_count'] = this.orderCount!.toJson();
    }
    return data;
  }
}

class OrderCount {
  int? newOrders;
  int? returnInProgress;

  OrderCount({this.newOrders, this.returnInProgress});

  OrderCount.fromJson(Map<String, dynamic> json) {
    newOrders = json['new_orders'];
    returnInProgress = json['return_in_progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['new_orders'] = this.newOrders;
    data['return_in_progress'] = this.returnInProgress;
    return data;
  }
}
