import 'package:customer_app/Models/product_model.dart';

class Orders {
  Order? order;

  Orders({this.order});

  Orders.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Order {
  String? id;
  String? shopId;
  List<Product>? products;

  Order({this.id, this.shopId, this.products});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['shop_id'] = shopId;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
