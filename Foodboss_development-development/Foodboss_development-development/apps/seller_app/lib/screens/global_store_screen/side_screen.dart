import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/business_controller/store/store_controller.dart';
import 'package:seller_app/screens/global_store_screen/modals.dart';
import 'package:seller_app/screens/global_store_screen/product_list_screen.dart';
import 'package:seller_app/widgets/Heading.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/form_input.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';

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
  final bool? loading;
  const ExpansionCard(
      {Key? key,
      this.loading = false,
      required this.title,
      this.index,
      this.id})
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
          'fromSearch':false
        });
        // controller.getItems(id!, false);
      },
      child: Container(
        height: 70,
        margin: const EdgeInsets.fromLTRB(1, 0, 0, 0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ThemeConfig.OUTLINE_COLOR,
              width: 0.5,
            ),
          ),
          color: ThemeConfig.WHITE_COLOR,
        ),
        padding: const EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: loading == true
                    ? Container(
                        height: 20,
                        color: ThemeConfig.FORM_COLOR,
                      )
                    : LabelText(titleString: title)),
          ],
        ),
      ),
    );
  }
}
