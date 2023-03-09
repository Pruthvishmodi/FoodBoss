class MyCategories {
  final String? categoryName;
  final List<Products>? products;

MyCategories({  this.products,  this.categoryName, });
}

class Products {
  final String productName;
  final int productId;
  final String imageLocation;
  final String quantity;
  final String price;

  Products({required this.productName, required this.productId, required this.imageLocation, required this.quantity, required this.price});

}
