class MyCategories {
  final String? categoryName;
  final String? imageUrl;
  final List<Products>? products;

MyCategories({this.imageUrl,  this.products,  this.categoryName, });
}

class Products {
  final String productName;
  final int productId;
  final String imageLocation;
  final String quantity;
  final String price;
  final List<Varients> varients;


  Products({required this.varients, required this.productName, required this.productId, required this.imageLocation, required this.quantity, required this.price});

}

class Varients{

  final String? price;
  final String? unit;

  Varients({this.price, this.unit});



}
