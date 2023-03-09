class Variants {
  int? id;
  double? weight;
  String? unit;
  String? price;

  Variants({this.id, this.weight, this.unit, this.price});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weight = double.parse((json['weight'] ?? 0).toString());
    unit = json['unit'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['weight'] = this.weight;
    data['unit'] = this.unit;
    data['price'] = this.price;
    return data;
  }
}

class Gallery {
  String? url;

  Gallery({this.url});

  Gallery.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
