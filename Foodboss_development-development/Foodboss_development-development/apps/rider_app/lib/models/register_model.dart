class RegisterRequestModel {
  String? phone;
  String? email;
  String? name;
  String? referCode;
  String? signature;

  RegisterRequestModel(
      {this.phone, this.email, this.name, this.referCode, this.signature});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['reffercode'] = this.referCode;
    data['signature'] = this.signature;
    return data;
  }
}
