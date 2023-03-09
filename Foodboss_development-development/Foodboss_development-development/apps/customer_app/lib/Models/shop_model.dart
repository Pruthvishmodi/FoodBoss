import 'package:customer_app/Models/category_model.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Models/reviews_model.dart';

class ShopModel {
  int? id;
  String? name;
  String? address;
  String? shopImage;
  String? city;
  double? distance;
  String? totalRatings;
  bool? isFavorite;
  int? totalReviews;
  String? phoneNumber;
  String? latitude;
  String? longitude;
  String? khata;
  bool? khataAvailable;
  int? deliveryCharge;
  String? minimumOrderPrice;
  Ratings? ratings;
  List<Category>? categories;
  // List<Pro>
  List<Product>? randomProducts;
  bool? isShopClose;

  ShopModel(
      {this.id,
      this.name,
      this.address,
      this.shopImage,
      this.city,
      this.distance,
      this.khataAvailable,
      this.totalReviews,
      this.totalRatings,
      this.latitude,
      this.longitude,
      this.phoneNumber,
      this.minimumOrderPrice,
      this.khata,
      this.categories});

  ShopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    distance = json['distance'];
    totalReviews = json['review'];
    phoneNumber = json['phone number'];
    minimumOrderPrice = json['minimum_order_price'];
    address = json['address'];

    khata = json['khata'];
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
  }

  ShopModel.fromseachJson(Map<String, dynamic> json) {
    id = json['shop_id'];
    name = json['name'];
    distance = json['distance'];
    totalReviews = json['review'];
    phoneNumber = json['phone number'];
    minimumOrderPrice = json['minimum_order_price'];
    address = json['address'];

    khata = json['khata'];
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
  }

  ShopModel.ongoingOrderDetailCall(json) {
    name = json['name'];
    phoneNumber = json['phone'];
    address = json['address'];
    latitude = json['let'];
    longitude = json['lang'];
  }

  ShopModel.fromOrderDetails(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phone'];
    address = json['address'];
    latitude = json['let'];
    longitude = json['lang'];
  }

  ShopModel.fromFavStoreCall(Map<String, dynamic> json) {
    print(json);
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone'];
    // deliveryRange = json['delivery_range'];
    // deliveryRadious = json['delivery_radious'];
    deliveryCharge = json['delivery_fee'];
    latitude = json['let'];
    isShopClose = json['is_shop_close'];
    longitude = json['lang'];
    city = json['city'];
    minimumOrderPrice = json['min_order_amount'];
    address = json['address'];
    totalReviews = json['total-reviews'];
    totalRatings = json['total-rating'].toString();
    khataAvailable = json['IsKhataAvailable'];
    distance = json['distance'];
    shopImage = json['image'];
    isFavorite = true;
  }

  ShopModel.fromFavFoodCall(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shopImage = json['image'];
    phoneNumber = json['phone'];
    address = json['address'];
    distance = double.parse(json['distance'].toString());
    latitude = json['let'];
    longitude = json['lang'];
  }

  ShopModel.fromSearchProducts(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phone'];
    // totalRatings = json['rating'];
    distance = json['distance'];
  }

  ShopModel.fromCategories(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shopImage = json['shop_image'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    khataAvailable = json['IsKhataAvailable'];
    phoneNumber = json['phone'];
    minimumOrderPrice = json['minimum_order_price'];
    address = json['address'];
    totalRatings = json['rating'];
    distance = double.parse(json['distance'].toString());
    city = json['city'];
    totalReviews = json['number_of_reviews'];
    isFavorite = json['isFavorite'];
    isShopClose = json['is_shop_close'];
  }
  ShopModel.forNearbySearch(Map<String, dynamic> json) {
    print(json);
    id = json['id'];
    name = json['name'];
    shopImage = json['shop_image'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phoneNumber = json['phone'];
    isShopClose = json['is_shop_close'];
    khataAvailable = json['khata_available'];
    // minimumOrderPrice = json['minimum_order_price'];
    address = json['address'];
    totalRatings = json['rating'];
    totalReviews = json['number_of_reviews'];
    city = json['city'];
    isFavorite = json['isFavorite'];
    distance = double.parse(json['distance'].toString());
    // khataAvailable = json['khata_available'];
  }

  ShopModel.fromStoreDetailCall(Map<String, dynamic> json) {
    // id = json['id'];
    // name = json['name'];
    // address = json['address'];
    // latitude = json['let'];
    // longitude = json['lang'];
    // phoneNumber = json['phone'];
    // distance = json['distance'];
    minimumOrderPrice = json['min_order_amount'].toString();
    deliveryCharge = int.parse(json['delivery_charges'].toString());
    // startTime = json['start_time'];
    // endTime = json['end_time'];
    // openDays = json['open_days'] != null
    //     ? new OpenDays.fromJson(json['open_days'])
    //     : null;
    ratings =
        json['ratings'] != null ? Ratings.fromJson(json['ratings']) : null;
  }

  ShopModel.fromRouterCall(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    latitude = json['let'];
    longitude = json['lang'];
    phoneNumber = json['phone'];
    distance = json['distance'];
    minimumOrderPrice = json['min_order_amount'].toString();
    deliveryCharge = int.parse(json['delivery_charges'].toString());
    isFavorite = false;
    // startTime = json['start_time'];
    // endTime = json['end_time'];
    // openDays = json['open_days'] != null
    //     ? new OpenDays.fromJson(json['open_days'])
    //     : null;
    ratings =
        json['ratings'] != null ? Ratings.fromJson(json['ratings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['distance'] = distance;
    data['review'] = totalReviews;
    data['phone number'] = phoneNumber;
    data['khata'] = khata;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
