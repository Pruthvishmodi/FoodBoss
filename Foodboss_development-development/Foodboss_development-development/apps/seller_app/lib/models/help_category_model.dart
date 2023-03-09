class HelpCategoriesModel {
  bool? success;
  List<HelpCategory>? data;
  String? message;

  HelpCategoriesModel({this.success, this.data, this.message});

  HelpCategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <HelpCategory>[];
      json['data'].forEach((v) {
        data!.add(new HelpCategory.fromJson(v));
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

class HelpCategory {
  int? sno;
  String? categoryName;

  HelpCategory({this.sno, this.categoryName});

  HelpCategory.fromJson(Map<String, dynamic> json) {
    sno = json['sno'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sno'] = this.sno;
    data['category_name'] = this.categoryName;
    return data;
  }
}
