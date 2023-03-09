class FaqMain {
  bool? success;
  List<FAQ>? data;
  String? message;

  FaqMain({this.success, this.data, this.message});

  FaqMain.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <FAQ>[];
      json['data'].forEach((v) {
        data!.add(new FAQ.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class FAQ {
  int? id;
  String? question;
  String? answer;
  int? faqCategoryId;
  String? createdAt;
  String? updatedAt;

  FAQ(
      {this.id,
      this.question,
      this.answer,
      this.faqCategoryId,
      this.createdAt,
      this.updatedAt,});

  FAQ.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    faqCategoryId = json['faq_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['faq_category_id'] = this.faqCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
   
    return data;
  }
}