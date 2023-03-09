import 'package:customer_app/Models/shop_model.dart';
import 'package:customer_app/Models/varient_model.dart';

class Product {
  int? id;
  String? name;
  String? photo;
  String? price;
  String? discount;
  int? productStock;
  double? weight;
  bool? isFavorite;
  int? deleteCartId = 0;
  int? quantity;
  bool? isRemoveMrp;
  String? unit;
  String? description;
  String? ingredients;
  int? selectedVaritent = 0;
  List<Gallery>? gallery;
  List<Variants>? variants;
  String? vegetarianType;
  ShopModel? shop;
  int? foodId;
  int? food_variant_id;

  Product(
      {this.id,
      this.quantity = 0,
      this.name,
      this.photo,
      this.price,
      this.deleteCartId = 0,
      this.discount,
      this.weight,
      this.unit,
      this.variants,
      this.isRemoveMrp});

  Product.fromJson(Map<String, dynamic> json, {int quant = 0}) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    price = json['price'];
    isFavorite = json['isFavorite'];
    productStock = json['product_stock'];
    discount = json['discount'];
    isRemoveMrp = json['is_remove_mrp'];
    // print(json['weight']);
    weight = double.parse((json['weight'] ?? 0).toString());
    vegetarianType = json['vegetarian_type'];
    quantity = quant;
    unit = json['unit'].toString();
    variants = <Variants>[];
    selectedVaritent = 0;
    variants!.add(Variants(
        id: 0,
        price: json['discount'],
        weight: double.parse((json['weight'] ?? 0).toString()),
        unit: json['unit'].toString()));
    if (json['variants'] != null) {
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
  }

  // Product.fromTestSeachJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   description = json['description'];
  //   price = json['price'];
  //   weight = double.parse(json['weight']);
  //   unit = json['unit'];
  // }

  Product.fromTestSeachJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
    quantity = 0;
    weight = double.parse(json['weight'].toString());
    unit = json['unit'];
    vegetarianType = json['vegetarian_type'];
    photo = json['photo'];
    shop =
        json['shop'] != null ? new ShopModel.fromseachJson(json['shop']) : null;
  }

  Product.fromOrderDetails(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    weight = double.parse(json['weight'].toString());
    unit = json['unit'];
    quantity = json['quantity'];
    price = json['price'].toString();
    discount = json['discount_price'].toString();
    photo = json['photo'];
  }

  Product.fromFavFoodCall(Map<String, dynamic> json) {
    id = json['food_id'];
    name = json['name'];
    photo = json['image'];
    quantity = 0;
    price = json['price'];
    discount = json['discount_price'];
    productStock = json['product_stock'];
    quantity = 0;
    shop =
        json['shop'] != null ? ShopModel.fromFavFoodCall(json['shop']) : null;
  }

  Product.fromCartJson(Map<String, dynamic> json) {
    id = json['id'];
    foodId = json['food_id'];
    name = json['name'];
    photo = json['photo'];
    if (json['price'] != null && json['quantity'] != null) {
      price = (int.parse(json['price'].toString()) /
              int.parse(json['quantity'].toString()))
          .toString();
    }
    if (json['discount_price'] != null && json['quantity'] != null) {
      discount = (int.parse(json['discount_price'].toString()) /
              int.parse(json['quantity'].toString()))
          .toString();
    }

    // discount = json['discount_price'].toString();
    // discount = json['discount'];
    if (json['quantity'] != null) {
      quantity = json['quantity'];
    }
    weight = double.parse(json['weight'].toString());
    food_variant_id =
        json['food_variant_id'] == "" ? 0 : json['food_variant_id'];
    unit = json['unit'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
  }
  Product.fromFoodDetailsJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = 0;
    price = json['price'];
    discount = json['discount_price'];
    productStock = json['product_stock'] ?? 10;
    photo = json['image'];
    weight = double.parse(json['weight'].toString());
    unit = json['unit'];
    isRemoveMrp = json['is_remove_mrp'];
    variants = <Variants>[];
    selectedVaritent = 0;
    variants!.add(Variants(
        id: 0,
        price: json['discount_price'],
        weight: double.parse((json['weight'] ?? 0).toString()),
        unit: json['unit'].toString()));
    if (json['variants'] != null) {
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(Gallery.fromJson(v));
      });
    }
    isFavorite = json['isFavorite'];
    description = json['description'];
    ingredients = json['ingredients'];
    vegetarianType = json['vegetarian_type'];
  }

  Product.fromSearchProducts(Map<String, dynamic> json) {
    print(json);
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
    weight = double.parse(json['weight'].toString());
    unit = json['unit'];
    photo = json['photo'];
    shop = json['shop'] != null ? ShopModel.fromJson(json['shop']) : null;
  }

  Product.fromRandomProducts(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    price = json['price'];
    isRemoveMrp = json['is_remove_mrp'];
    productStock = json['product_stock'];
    quantity = 0;
    discount = json['discount'];
    weight = double.parse(json['weight'].toString());
    unit = json['unit'];
    vegetarianType = json['vegetarian_type'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photo'] = photo;
    data['price'] = price;
    data['discount'] = discount;
    data['weight'] = weight;
    data['unit'] = unit;
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
