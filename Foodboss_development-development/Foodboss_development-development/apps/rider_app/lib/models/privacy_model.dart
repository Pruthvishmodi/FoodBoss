class Privacy {
  bool? success;
  Data? data;
  String? message;

  Privacy({this.success, this.data, this.message});

  Privacy.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? privacyText;
  String? termOfSaleText;
  String? termOfCustomerText;
  String? termOfDeliveryBoyText;

  Data(
      {this.privacyText,
      this.termOfSaleText,
      this.termOfCustomerText,
      this.termOfDeliveryBoyText});

  Data.fromJson(Map<String, dynamic> json) {
    privacyText = json['privacy_text'];
    termOfSaleText = json['term_of_sale_text'];
    termOfCustomerText = json['term_of_customer_text'];
    termOfDeliveryBoyText = json['term_of_delivery_boy_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privacy_text'] = this.privacyText;
    data['term_of_sale_text'] = this.termOfSaleText;
    data['term_of_customer_text'] = this.termOfCustomerText;
    data['term_of_delivery_boy_text'] = this.termOfDeliveryBoyText;
    return data;
  }
}