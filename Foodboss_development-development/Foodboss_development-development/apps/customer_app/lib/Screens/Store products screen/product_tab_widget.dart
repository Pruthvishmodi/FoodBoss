import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/category_page_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/store_product_ui_controller.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/Text widgets/label_text.dart';

class ProductTabWidget extends StatelessWidget {
  final int index;
  final int id;
  const ProductTabWidget({
    Key? key,
    required this.storeProductUiController,
    required this.index,
    required this.id,
  }) : super(key: key);

  final StoreProductUiController storeProductUiController;

  @override
  Widget build(BuildContext context) {
    CategoryPageController categoryPageController =
        Get.find<CategoryPageController>();
    StoreProductController storeProductController =
        Get.find<StoreProductController>();
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        storeProductUiController.changeIndex(index);

        storeProductController.getCatProducts(
            storeProductController.store.value.id!,
            storeProductController.store.value.categories![index].id!);
      },
      child: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: 100,
          // height: 130,
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
                      width: 3,
                      color: index == storeProductUiController.fragIndex.value
                          ? ThemeConfig.mainTextColor
                          : ThemeConfig.whiteColor))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 60,
                  // width: ,
                  padding: EdgeInsets.only(
                      top: index == storeProductUiController.fragIndex.value
                          ? 5
                          : 20,
                      bottom: index == storeProductUiController.fragIndex.value
                          ? 5
                          : 0,
                      right: 10,
                      left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: index == storeProductUiController.fragIndex.value
                        ? Colors.grey.shade300
                        : Colors.grey.shade100,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: categoryPageController.categories.value.data!
                        .firstWhere((element) => element.id == id)
                        .photo!,
                    width: 40,
                    height: 25,
                  )),
              SB.small(),
              LabelText(
                text: categoryPageController.categories.value.data!
                    .firstWhere((element) => element.id == id)
                    .name!,
                alignment: TextAlign.center,
              ),
              SB.medium(),
            ],
          ),
        ),
      ),
    );
  }
}
