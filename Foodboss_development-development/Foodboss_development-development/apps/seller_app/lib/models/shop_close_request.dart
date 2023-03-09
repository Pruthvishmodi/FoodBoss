class ShopCloseRequest {
  int? isShopClose;

  ShopCloseRequest({this.isShopClose});

  ShopCloseRequest.fromJson(Map<String, dynamic> json) {
    isShopClose = json['is_shop_close'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_shop_close'] = this.isShopClose;
    return data;
  }
}
