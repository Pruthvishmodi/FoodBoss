class Reviews {
  Review? review;

  Reviews({this.review});

  Reviews.fromJson(Map<String, dynamic> json) {
    review =
        json['review'] != null ? Review.fromJson(json['review']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (review != null) {
      data['review'] = review!.toJson();
    }
    return data;
  }
}

class Review {
  String? id;
  String? shopId;
  String? ratings;
  String? comments;

  Review({this.id, this.shopId, this.ratings, this.comments});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    ratings = json['ratings'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['shop_id'] = shopId;
    data['ratings'] = ratings;
    data['comments'] = comments;
    return data;
  }
}



class Ratings {
  int? i1;
  int? i2;
  int? i3;
  int? i4;
  int? i5;
  double? avarege;
  int? totalCount;
  List<Customers>? customers;

  Ratings(
      {this.i1,
      this.i2,
      this.i3,
      this.i4,
      this.i5,
      this.avarege,
      this.totalCount,
      this.customers});

  Ratings.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i3 = json['3'];
    i4 = json['4'];
    i5 = json['5'];
    avarege = double.parse(json['avarege'].toString());
    totalCount = json['total_count'];
    if (json['customers'] != null) {
      customers = <Customers>[];
      json['customers'].forEach((v) {
        customers!.add(new Customers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.i1;
    data['2'] = this.i2;
    data['3'] = this.i3;
    data['4'] = this.i4;
    data['5'] = this.i5;
    data['avarege'] = this.avarege;
    data['total_count'] = this.totalCount;
    if (this.customers != null) {
      data['customers'] = this.customers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customers {
  String? name;
  int? rating;
  String? title;

  Customers({this.name, this.rating, this.title});

  Customers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rating = json['rating'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['title'] = this.title;
    return data;
  }
}
