import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/controller/business_controller/store/store_controller.dart';
import 'package:rider_app/models/store/catagories.dart';
import 'package:rider_app/screens/global_store_screen/global_store_controller.dart';
import 'package:rider_app/screens/global_store_screen/mockData.dart';
import 'package:rider_app/screens/global_store_screen/modals.dart';
import 'package:rider_app/screens/global_store_screen/side_screen.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';

List<Item> listItem = [
  Item(id: 0, item: "item"),
  Item(id: 0, item: "item"),
  Item(id: 0, item: "item"),
  Item(id: 0, item: "item"),
  Item(id: 0, item: "item"),
  Item(id: 0, item: "item"),
  Item(id: 0, item: "item"),
  Item(id: 0, item: "item"),
];

class SideSc extends StatelessWidget {
  // final SubCategory item;
  // final String location;
  // final int index;
  final List<ListCatData> subCategory;
  final bool contains;
  const SideSc({
    Key? key,
    required this.subCategory,
    // required this.location,
    required this.contains,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
        ),
        Expanded(
          flex: 1,
          child: Container(
            // padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: subCategory.length,
              itemBuilder: (context, index) {
                return contains
                    ? ExpansionCard(
                        title: subCategory[index].name!,
                        id: subCategory[index].id,
                        index: index,
                      )
                    : Card(
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/fruits.jpg"),
                            ),
                          ),
                          title: Desc(descString: "subCategory[index].item"),
                          trailing: const Icon(Icons.add),
                        ),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}

int lengthofCat(int tab, int secondTab) {
  int lengthCat = storeProductList[tab].list[secondTab].catagories.length;
  int lengthItem = storeProductList[tab].list[secondTab].items.length;
  return storeProductList[tab].list[secondTab].containsCat
      ? lengthItem
      : lengthCat;
}

class CatObj {
  final String name;
  final bool contains;
  final List<Item> items;
  CatObj({required this.contains, required this.items, required this.name});
}

class ItemObj {
  final String name;
  final bool contains;
  ItemObj({required this.contains, required this.name});
}

dynamic sendCat(int tab, int secondTab, int index) {
  String nameCat =
      storeProductList[tab].list[secondTab].catagories[index].subCategoryName;
  List<Item> items =
      storeProductList[tab].list[secondTab].catagories[index].items;
  CatObj catObj = CatObj(
      items: items,
      name: nameCat,
      contains: storeProductList[tab].list[secondTab].containsCat);
  String nameItem = storeProductList[tab].list[secondTab].items[index].item;
  // int lengthItem = storeProductList[tab].list[secondTab].items.length;
  return storeProductList[tab].list[secondTab].containsCat
      ? ItemObj(
          contains: storeProductList[tab].list[secondTab].containsCat,
          name: nameItem)
      : catObj;
}
