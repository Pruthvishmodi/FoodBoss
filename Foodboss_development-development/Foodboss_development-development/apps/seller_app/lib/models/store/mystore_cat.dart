class MyStoreCat {
  bool? success;
  List<ListCatMyStoreData>? data;

  MyStoreCat({this.success, this.data});

  MyStoreCat.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = <ListCatMyStoreData>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        if (v['main_category_id'] != null) {
          data!.add(ListCatMyStoreData.fromJson(v));
        }
      });
    }
  }
}

class ListCatMyStoreData {
  int? mainCategoryId;
  ParantCategories? parantCategories;

  ListCatMyStoreData({
    this.mainCategoryId,
    this.parantCategories,
  });

  ListCatMyStoreData.fromJson(Map<String, dynamic> json) {
    mainCategoryId = json['main_category_id'];
    parantCategories = json['parant_categories'] != null
        ? ParantCategories.fromJson(json['parant_categories'])
        : ParantCategories();
  }
}

class ParantCategories {
  int? id;
  String? name;

  ParantCategories({
    this.id,
    this.name,
  });

  ParantCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
