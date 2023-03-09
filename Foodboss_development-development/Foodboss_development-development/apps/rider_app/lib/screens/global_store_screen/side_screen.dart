import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/controller/business_controller/store/store_controller.dart';
import 'package:rider_app/screens/global_store_screen/modals.dart';
import 'package:rider_app/screens/global_store_screen/product_list_screen.dart';
import 'package:rider_app/widgets/Heading.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/form_input.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:shared_widgets/shared_widgets.dart';

class SideScreen extends StatelessWidget {
  final List subCategory;
  final bool contains;

  const SideScreen(
      {Key? key, required this.subCategory, required this.contains})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: subCategory.length,
      itemBuilder: (BuildContext context, index) => contains
          ? ExpansionCard(
              title: subCategory[index].subCategoryName,
              // list: subCategory[index].items,
              // number: subCategory[index]!.number,
            )
          : Card(
              color: ThemeConfig.WHITE_COLOR,
              child: ListTile(
                title: Desc(descString: subCategory[index].item),
                trailing: const Icon(Icons.add),
              ),
            ),
    );
  }
}

class ExpansionCard extends StatelessWidget {
  final String title;
  final int? index;
  final int? id;
  const ExpansionCard({Key? key, required this.title, this.index, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreController controller = Get.put(StoreController(), permanent: false);

    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.toNamed("/product-list-screen", arguments: {
          "id": id,
          "fromCat": true,
        });
        // controller.getItems(id!, false);
      },
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: LabelText(titleString: title)),
              // Desc(descString: number.toString())
              // Container(
              //   padding: const EdgeInsets.all(8),
              //   decoration: const BoxDecoration(
              //       color: ThemeConfig.PRIMARY_COLOR, shape: BoxShape.circle),
              //   child: Text(
              //     10.toString(),
              //     style: const TextStyle(color: ThemeConfig.WHITE_COLOR),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
