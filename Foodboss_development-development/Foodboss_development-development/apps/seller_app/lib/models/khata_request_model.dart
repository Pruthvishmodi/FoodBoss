class KhataRequestModel {
  bool? success;
  List<Data>? data;
  String? currentPageUrl;
  // Null? nextPageUrl;
  int? total;

  KhataRequestModel(
      {this.success,
      this.data,
      this.currentPageUrl,
      // this.nextPageUrl,
      this.total});

  KhataRequestModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    currentPageUrl = json['current_page_url'];
    // nextPageUrl = json['next_page_url'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['current_page_url'] = this.currentPageUrl;
    // data['next_page_url'] = this.nextPageUrl;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? customerName;
  String? image;
  String? phone;

  Data({this.id, this.customerName, this.image, this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customer_name'];
    image = json['image'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_name'] = this.customerName;
    data['image'] = this.image;
    data['phone'] = this.phone;
    return data;
  }
}
