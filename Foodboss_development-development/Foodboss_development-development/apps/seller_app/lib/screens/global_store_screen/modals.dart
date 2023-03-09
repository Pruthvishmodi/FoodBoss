class Categories {
  final String categoryName;
  final String imageLocation;
  final List<SubCategory> list;

  Categories(
      {required this.imageLocation,
      required this.categoryName,
      required this.list});

  // Categories.fromJason(Map<String, dynamic> json) {
  //   categoryName:
  //   json['data'],
  // }
}

class SubCategory {
  final String imageLocation;
  final String subCategoryName;
  final int? number;
  final List<Item> items;
  final List<SubCategory> catagories;
  final bool containsCat;
  SubCategory({
    this.number = null,
    required this.imageLocation,
    required this.containsCat,
    required this.catagories,
    required this.subCategoryName,
    required this.items,
  });
}

class Item {
  final String item;
  final String? quantity;
  final String? imageUrl;
  final String? price;
  final int id;
  bool? selected;
  Item(
      {this.selected = false,
      this.imageUrl = 'assets/images/fruits.jpg',
      this.quantity = '20',
      this.price = '100',
      required this.id,
      required this.item});
  changeSelect() {
    selected = selected! ? false : true;
  }
}
