class BannerCall {
  bool? success;
  List<Banner>? data;

  BannerCall({this.success, this.data});

  BannerCall.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Banner>[];
      json['data'].forEach((v) {
        data!.add(new Banner.fromJson(v));
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

class Banner {
  int? id;
  String? name;
  String? aspectRatio;
  bool? auto;
  List<Urls>? urls;

  Banner({this.id, this.name, this.aspectRatio, this.auto, this.urls});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    aspectRatio = json['aspect-ratio'];
    auto = json['auto'];
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls!.add(new Urls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['aspect-ratio'] = this.aspectRatio;
    data['auto'] = this.auto;
    if (this.urls != null) {
      data['urls'] = this.urls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Urls {
  int? link;
  String? img;

  Urls({this.link, this.img});

  Urls.fromJson(Map<String, dynamic> json) {
    link = int.parse(json['main_category_id'].toString());
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['img'] = this.img;
    return data;
  }
}
