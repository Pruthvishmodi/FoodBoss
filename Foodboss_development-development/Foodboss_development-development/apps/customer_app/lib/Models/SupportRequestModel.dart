class SupportRequest {
  String? name;
  String? phone;
  String? category;
  String? message;

  SupportRequest({this.name, this.phone, this.category, this.message});

  SupportRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    category = json['category'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['category'] = this.category;
    data['message'] = this.message;
    return data;
  }
}
