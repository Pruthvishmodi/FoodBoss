class MainCatModel {
  bool? success;
  Data? data;

  MainCatModel({this.success, this.data});

  MainCatModel.fromJson(Map<String, dynamic> json) {
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
  // int? currentPage;
  List<Data>? data;
  // String? firstPageUrl;
  // int? from;
  // int? lastPage;
  // String? lastPageUrl;
  // Null? nextPageUrl;
  // String? path;
  // int? perPage;
  // Null? prevPageUrl;
  // int? to;
  // int? total;

  Data({
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class ListData {
  int? id;
  String? name;
  // String? description;
  // String? createdAt;
  // String? updatedAt;
  // List<Null>? customFields;
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
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  // String? modelType;
  // int? modelId;
  // String? collectionName;
  // String? name;
  // String? fileName;
  // String? mimeType;
  // String? disk;
  // int? size;
  // List<Null>? manipulations;
  // CustomProperties? customProperties;
  // List<Null>? responsiveImages;
  // int? orderColumn;
  // String? createdAt;
  // String? updatedAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['thumb'] = this.thumb;
    data['icon'] = this.icon;
    data['formated_size'] = this.formatedSize;
    return data;
  }
}

// class CustomProperties {
//   String? uuid;
//   int? userId;
//   GeneratedConversions? generatedConversions;

//   CustomProperties({this.uuid, this.userId, this.generatedConversions});

//   CustomProperties.fromJson(Map<String, dynamic> json) {
//     uuid = json['uuid'];
//     userId = json['user_id'];
//     generatedConversions = json['generated_conversions'] != null
//         ? new GeneratedConversions.fromJson(json['generated_conversions'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['uuid'] = this.uuid;
//     data['user_id'] = this.userId;
//     if (this.generatedConversions != null) {
//       data['generated_conversions'] = this.generatedConversions!.toJson();
//     }
//     return data;
//   }
// }

// class GeneratedConversions {
//   bool? thumb;
//   bool? icon;

//   GeneratedConversions({this.thumb, this.icon});

//   GeneratedConversions.fromJson(Map<String, dynamic> json) {
//     thumb = json['thumb'];
//     icon = json['icon'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['thumb'] = this.thumb;
//     data['icon'] = this.icon;
//     return data;
//   }
// }
