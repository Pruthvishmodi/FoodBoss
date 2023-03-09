class VideoHelp {
  bool? success;
  Data? data;
  String? message;

  VideoHelp({this.success, this.data, this.message});

  VideoHelp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  int? currentPage;
  List<VideoData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <VideoData>[];
      json['data'].forEach((v) {
        data!.add(VideoData.fromJson(v));
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
}

class VideoData {
  int? id;
  String? title;
  String? videosUrl;
  String? videoType;
  String? createdAt;
  String? updatedAt;
  bool? hasMedia;
  List<Media>? media;

  VideoData(
      {this.id,
      this.title,
      this.videosUrl,
      this.videoType,
      this.createdAt,
      this.updatedAt,
      this.hasMedia,
      this.media});

  VideoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videosUrl = json['videos_url'];
    videoType = json['video_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hasMedia = json['has_media'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }
}

class Media {
  int? id;
  String? url;
  String? thumb;
  String? icon;

  Media(
      {this.id,
      this.url,
      this.thumb,
      this.icon,});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    thumb = json['thumb'];
    icon = json['icon'];
  }
}

