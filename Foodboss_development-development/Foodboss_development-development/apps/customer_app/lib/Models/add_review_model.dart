class AddReviewModel {
  String? userId;
  int? shopId;
  String? rate;
  String? review;

  AddReviewModel({this.userId, this.shopId, this.rate, this.review});

  AddReviewModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    shopId = json['shop_id'];
    rate = json['rate'];
    review = json['review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['rate'] = this.rate;
    data['review'] = this.review;
    return data;
  }
}