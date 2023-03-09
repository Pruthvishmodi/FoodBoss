class SearchSuggestionModel {
  bool? success;
  List<Suggestion>? data;

  SearchSuggestionModel({this.success, this.data});

  SearchSuggestionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Suggestion>[];
      json['data'].forEach((v) {
        data!.add(new Suggestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suggestion {
  int? id;
  String? name;
  // int? price;
  // int? discountPrice;
  // String? description;
  // String? keywords;
  // String? ingredients;
  // int? packageItemsCount;
  // int? weight;
  // String? unit;
  // int? featured;
  // int? deliverable;
  // int? isPopular;
  // int? categoryId;
  // int? mainCategoryId;
  // int? subcategoryId;
  // Null? dupId;
  // Null? sizeOfPacket;
  // String? vegetarianType;
  // int? isAvailable;
  // int? isApproved;
  // int? isRemoveMrp;
  // String? parentCategoryName;
  // String? childCategoryName;
  // String? categoryName;
  // int? mediaId;
  // String? fileName;
  String? imagePath;

  Suggestion(
      {this.id,
      this.name,
      // this.price,
      // this.discountPrice,
      // this.description,
      // this.keywords,
      // this.ingredients,
      // this.packageItemsCount,
      // this.weight,
      // this.unit,
      // this.featured,
      // this.deliverable,
      // this.isPopular,
      // this.categoryId,
      // this.mainCategoryId,
      // this.subcategoryId,
      // this.dupId,
      // this.sizeOfPacket,
      // this.vegetarianType,
      // this.isAvailable,
      // this.isApproved,
      // this.isRemoveMrp,
      // this.parentCategoryName,
      // this.childCategoryName,
      // this.categoryName,
      // this.mediaId,
      // this.fileName,
      this.imagePath});

  Suggestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // price = json['price'];
    // discountPrice = json['discount_price'];
    // description = json['description'];
    // keywords = json['keywords'];
    // ingredients = json['ingredients'];
    // packageItemsCount = json['package_items_count'];
    // weight = json['weight'];
    // unit = json['unit'];
    // featured = json['featured'];
    // deliverable = json['deliverable'];
    // isPopular = json['is_popular'];
    // categoryId = json['category_id'];
    // mainCategoryId = json['main_category_id'];
    // subcategoryId = json['subcategory_id'];
    // dupId = json['dup_id'];
    // sizeOfPacket = json['size_of_packet'];
    // vegetarianType = json['vegetarian_type'];
    // isAvailable = json['is_available'];
    // isApproved = json['is_approved'];
    // isRemoveMrp = json['is_remove_mrp'];
    // parentCategoryName = json['parent_category_name'];
    // childCategoryName = json['child_category_name'];
    // categoryName = json['category_name'];
    // mediaId = json['media_id'];
    // fileName = json['file_name'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    // data['price'] = this.price;
    // data['discount_price'] = this.discountPrice;
    // data['description'] = this.description;
    // data['keywords'] = this.keywords;
    // data['ingredients'] = this.ingredients;
    // data['package_items_count'] = this.packageItemsCount;
    // data['weight'] = this.weight;
    // data['unit'] = this.unit;
    // data['featured'] = this.featured;
    // data['deliverable'] = this.deliverable;
    // data['is_popular'] = this.isPopular;
    // data['category_id'] = this.categoryId;
    // data['main_category_id'] = this.mainCategoryId;
    // data['subcategory_id'] = this.subcategoryId;
    // data['dup_id'] = this.dupId;
    // data['size_of_packet'] = this.sizeOfPacket;
    // data['vegetarian_type'] = this.vegetarianType;
    // data['is_available'] = this.isAvailable;
    // data['is_approved'] = this.isApproved;
    // data['is_remove_mrp'] = this.isRemoveMrp;
    // data['parent_category_name'] = this.parentCategoryName;
    // data['child_category_name'] = this.childCategoryName;
    // data['category_name'] = this.categoryName;
    // data['media_id'] = this.mediaId;
    // data['file_name'] = this.fileName;
    // data['image_path'] = this.imagePath;
    return data;
  }
}
