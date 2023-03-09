class MainCatModel {
  bool? success;
  Data? data;
  String? message;

  MainCatModel({this.success, this.data, this.message});

  MainCatModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? Data.fromJson(json['data'])
        : Data(data: <ListData>[]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<ListData>? data = <ListData>[];

  Data({
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ListData>[];
      json['data'].forEach((v) {
        data!.add(ListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListData {
  int? id;
  String? name;
  bool? hasMedia;
  List<Media>? media;

  ListData({this.id, this.name, this.media, this.hasMedia});

  ListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    hasMedia = json['has_media'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['has_media'] = this.hasMedia;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  int? id;
  String? url;
  String? thumb;
  String? icon;
  String? formatedSize;

  Media({this.id, this.url, this.thumb, this.icon, this.formatedSize});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    thumb = json['thumb'];
    icon = json['icon'];
    formatedSize = json['formated_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['thumb'] = this.thumb;
    data['icon'] = this.icon;
    data['formated_size'] = this.formatedSize;
    return data;
  }
}

//NEW SUBCAT
class SubCatModel {
  bool? success;
  SubCatData? data;

  SubCatModel({this.success, this.data});

  SubCatModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? SubCatData.fromJson(json['data'])
        : SubCatData(data: <SubCatSubData>[]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SubCatData {
  int? currentPage;
  List<SubCatSubData>? data = <SubCatSubData>[];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  SubCatData(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  SubCatData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <SubCatSubData>[];
      json['data'].forEach((v) {
        data!.add(SubCatSubData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class SubCatSubData {
  int? id;
  String? name;
  String? description;
  int? parantId;
  String? createdAt;
  String? updatedAt;
  bool? isCategory;
  List<Null>? customFields;
  bool? hasMedia;
  List<SubCatMedia>? media;

  SubCatSubData(
      {this.id,
      this.name,
      this.description,
      this.parantId,
      this.createdAt,
      this.updatedAt,
      this.isCategory,
      this.customFields,
      this.hasMedia,
      this.media});

  SubCatSubData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    parantId = json['parant_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isCategory = json['is_category'] == "Yes" ? true : false;
    hasMedia = json['has_media'];
    if (json['media'] != null) {
      media = <SubCatMedia>[];
      json['media'].forEach((v) {
        media!.add(SubCatMedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['parant_id'] = this.parantId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_category'] = this.isCategory;
    // if (this.customFields != null) {
    //   data['custom_fields'] =
    //       this.customFields!.map((v) => v.toJson()).toList();
    // }
    data['has_media'] = this.hasMedia;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCatMedia {
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
  CustomProperties? customProperties;
  List<Null>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? url;
  String? thumb;
  String? icon;
  String? formatedSize;

  SubCatMedia(
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
      this.customProperties,
      this.responsiveImages,
      this.orderColumn,
      this.createdAt,
      this.updatedAt,
      this.url,
      this.thumb,
      this.icon,
      this.formatedSize});

  SubCatMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    collectionName = json['collection_name'];
    name = json['name'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    disk = json['disk'];
    size = json['size'];

    customProperties = json['custom_properties'] != null
        ? CustomProperties.fromJson(json['custom_properties'])
        : null;
    // if (json['responsive_images'] != null) {
    //   responsiveImages = <Null>[];
    //   json['responsive_images'].forEach((v) {
    //     responsiveImages!.add(Null.fromJson(v));
    //   });
    // }
    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    url = json['url'];
    thumb = json['thumb'];
    icon = json['icon'];
    formatedSize = json['formated_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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

class CustomProperties {
  String? uuid;
  int? userId;
  GeneratedConversions? generatedConversions;

  CustomProperties({this.uuid, this.userId, this.generatedConversions});

  CustomProperties.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    userId = json['user_id'];
    generatedConversions = json['generated_conversions'] != null
        ? GeneratedConversions.fromJson(json['generated_conversions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['user_id'] = this.userId;
    if (this.generatedConversions != null) {
      data['generated_conversions'] = this.generatedConversions!.toJson();
    }
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['thumb'] = this.thumb;
    data['icon'] = this.icon;
    return data;
  }
}

// catagories

class Catagory {
  bool? success;
  CatData? data;

  Catagory({this.success, this.data});

  Catagory.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? CatData.fromJson(json['data'])
        : CatData(data: <ListCatData>[]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CatData {
  List<ListCatData>? data = <ListCatData>[];

  CatData({this.data});

  CatData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ListCatData>[];
      json['data'].forEach((v) {
        data!.add(ListCatData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListCatData {
  int? id;
  String? name;
  String? parantId;
  String? childCategoryId;
  ListCatData({
    this.id,
    this.name,
    this.parantId,
    this.childCategoryId,
  });

  ListCatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parantId = json['parant_id'];
    childCategoryId = json['child_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['parant_id'] = parantId;
    data['child_category_id'] = childCategoryId;
    return data;
  }
}



// item

