class QrModel {
  bool? success;
  Data? data;

  QrModel({this.success, this.data});

  QrModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  int? price;
  int? discountPrice;
  String? description;
  String? ingredients;
  int? packageItemsCount;
  int? weight;
  String? unit;
  bool? featured;
  bool? deliverable;
  String? isPopular;
  int? restaurantId;
  int? categoryId;
  int? mainCategoryId;
  int? subcategoryId;
  Null? dupId;
  Null? sizeOfPacket;
  int? isAvailable;
  bool? isApproved;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<Null>? customFields;
  bool? hasMedia;
  
  List<Media>? media;

  Data(
      {this.id,
      this.name,
      this.price,
      this.discountPrice,
      this.description,
      this.ingredients,
      this.packageItemsCount,
      this.weight,
      this.unit,
      this.featured,
      this.deliverable,
      this.isPopular,
      this.restaurantId,
      this.categoryId,
      this.mainCategoryId,
      this.subcategoryId,
      this.dupId,
      this.sizeOfPacket,
      this.isAvailable,
      this.isApproved,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.customFields,
      this.hasMedia,
      
      this.media});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discountPrice = json['discount_price'];
    description = json['description'];
    ingredients = json['ingredients'];
    packageItemsCount = json['package_items_count'];
    weight = json['weight'];
    unit = json['unit'];
    featured = json['featured'];
    deliverable = json['deliverable'];
    isPopular = json['is_popular'];
    restaurantId = json['restaurant_id'];
    categoryId = json['category_id'];
    mainCategoryId = json['main_category_id'];
    subcategoryId = json['subcategory_id'];
    dupId = json['dup_id'];
    sizeOfPacket = json['size_of_packet'];
    isAvailable = json['is_available'];
    isApproved = json['is_approved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];

    hasMedia = json['has_media'];

    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['description'] = this.description;
    data['ingredients'] = this.ingredients;
    data['package_items_count'] = this.packageItemsCount;
    data['weight'] = this.weight;
    data['unit'] = this.unit;
    data['featured'] = this.featured;
    data['deliverable'] = this.deliverable;
    data['is_popular'] = this.isPopular;
    data['restaurant_id'] = this.restaurantId;
    data['category_id'] = this.categoryId;
    data['main_category_id'] = this.mainCategoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['dup_id'] = this.dupId;
    data['size_of_packet'] = this.sizeOfPacket;
    data['is_available'] = this.isAvailable;
    data['is_approved'] = this.isApproved;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    
    data['has_media'] = this.hasMedia;
    
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Media {
  int? id;
  String? modelType;
  int? modelId;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  int? size;
  List<Null>? manipulations;
 
  List<Null>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? url;
  String? thumb;
  String? icon;
  String? formatedSize;

  Media(
      {this.id,
      this.modelType,
      this.modelId,
      this.collectionName,
      this.name,
      this.fileName,
      this.mimeType,
      this.disk,
      this.size,
      this.manipulations,
     
      this.responsiveImages,
      this.orderColumn,
      this.createdAt,
      this.updatedAt,
      this.url,
      this.thumb,
      this.icon,
      this.formatedSize});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    collectionName = json['collection_name'];
    name = json['name'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    disk = json['disk'];
    size = json['size'];
    
  
    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    url = json['url'];
    thumb = json['thumb'];
    icon = json['icon'];
    formatedSize = json['formated_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model_type'] = this.modelType;
    data['model_id'] = this.modelId;
    data['collection_name'] = this.collectionName;
    data['name'] = this.name;
    data['file_name'] = this.fileName;
    data['mime_type'] = this.mimeType;
    data['disk'] = this.disk;
    data['size'] = this.size;

    data['order_column'] = this.orderColumn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    data['thumb'] = this.thumb;
    data['icon'] = this.icon;
    data['formated_size'] = this.formatedSize;
    return data;
  }
}



class GeneratedConversions {
  bool? thumb;
  bool? icon;

  GeneratedConversions({this.thumb, this.icon});

  GeneratedConversions.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumb'] = this.thumb;
    data['icon'] = this.icon;
    return data;
  }
}