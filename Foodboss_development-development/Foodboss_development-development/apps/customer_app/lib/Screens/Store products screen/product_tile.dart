import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/store_product_ui_controller.dart';
import 'package:customer_app/Screens/Store%20products%20screen/custom_drop_down_widget.dart';
import 'package:customer_app/Widgets/Buttons/fav_button_widget.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  ProductController productController = Get.put(ProductController());

  ProductTile({
    Key? key,
    required this.storeProductUiController,
    required this.index,
  }) : super(key: key);
  final int index;
  final StoreProductUiController storeProductUiController;

  @override
  Widget build(BuildContext context) {
    StoreProductController storeProductController =
        Get.find<StoreProductController>();
    var product = storeProductController
        .store
        .value
        .categories![storeProductUiController.fragIndex.value]
        .filteredProducts![index];
    product.shop = storeProductController.store.value;

    UserController userController = Get.find<UserController>();
    return Container(
      // height: 300,
      decoration: BoxDecoration(
          color: ThemeConfig.whiteColor,
          border: Border.all(
            width: 0.5,
            color: ThemeConfig.greyColor,
          )),
      padding: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 4,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      productController.fetchProductDetails(
                          product.shop!.id,
                          product.id,
                          storeProductController
                              .store
                              .value
                              .categories![
                                  storeProductUiController.fragIndex.value]
                              .filteredProducts![index]
                              .quantity,
                          storeProductController
                              .store
                              .value
                              .categories![
                                  storeProductUiController.fragIndex.value]
                              .filteredProducts![index]
                              .variants![storeProductController
                                  .store
                                  .value
                                  .categories![
                                      storeProductUiController.fragIndex.value]
                                  .filteredProducts![index]
                                  .selectedVaritent!]
                              .id);

                      Get.toNamed('/product-detail');
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          // color: ThemeConfig.redColor,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          child: CachedNetworkImage(
                            imageUrl: product.photo!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        product.productStock == 0
                            ? Container(
                                color: ThemeConfig.greyColor.withOpacity(0.5),
                                child: const Center(
                                    child: LabelText(
                                  text: 'Out of stock',
                                )),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: 35,
                      child: LabelText(
                        text: product.name!.split('-')[0].trim(),
                        isDotDot: true,
                        isSecondary: true,
                      ),
                    ),
                    Container(
                      height: 35,
                      child: LabelText(
                        maxlines: 2,
                        text: product.name!.split('-').length > 1
                            ? product.name!.split('-')[1].trim()
                            : product.name!,
                        isDotDot: true,
                      ),
                    ),
                    // SB.small(),
                    CustomDropDownMenu(
                      list: product,
                      pindex: index,
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              right: 0,
              child: Obx(
                () => FavButtonWidget(
                  isSelected: storeProductController
                      .store
                      .value
                      .categories![storeProductUiController.fragIndex.value]
                      .Products![index]
                      .isFavorite,
                  op: () {
                    product.isFavorite == false
                        ? userController
                            .addFavFood(product.id!,
                                storeProductController.store.value.id!)
                            .then((value) {
                            print(value);
                            if (value) {
                              storeProductController
                                  .store
                                  .value
                                  .categories![
                                      storeProductUiController.fragIndex.value]
                                  .Products![index]
                                  .isFavorite = true;
                              storeProductController.store.refresh();
                            } else {
                              storeProductController
                                  .store
                                  .value
                                  .categories![
                                      storeProductUiController.fragIndex.value]
                                  .Products![index]
                                  .isFavorite = false;
                            }
                          })
                        : userController
                            .removeFavFood(product.id!,
                                storeProductController.store.value.id!)
                            .then((value) {
                            if (value) {
                              storeProductController
                                  .store
                                  .value
                                  .categories![
                                      storeProductUiController.fragIndex.value]
                                  .Products![index]
                                  .isFavorite = false;

                              storeProductController.store.refresh();
                            } else {
                              storeProductController
                                  .store
                                  .value
                                  .categories![
                                      storeProductUiController.fragIndex.value]
                                  .Products![index]
                                  .isFavorite = true;

                              storeProductController.store.refresh();
                            }
                          });
                  },
                ),
              )),
        ],
      ),
    );
  }
}
