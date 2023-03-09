import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/store_product_ui_controller.dart';
import 'package:customer_app/Screens/Store%20products%20screen/header_section.dart';
import 'package:customer_app/Screens/Store%20products%20screen/product_tab_widget.dart';
import 'package:customer_app/Screens/Store%20products%20screen/product_tile.dart';
import 'package:customer_app/Screens/Store%20products%20screen/search_box_widget.dart';
import 'package:customer_app/Widgets/Buttons/fav_button_widget.dart';
import 'package:customer_app/Widgets/Buttons/share_button_widget.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/cart_widget.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:customer_app/utils/dylink_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class StoreProductScreen extends StatelessWidget {
  StoreProductScreen({Key? key}) : super(key: key);
  StoreProductUiController storeProductUiController =
      Get.put(StoreProductUiController(), permanent: false);

  StoreProductController storeProductController =
      Get.put(StoreProductController());

  UserController userController = Get.find<UserController>();
  CartController cartController = Get.find<CartController>();
  // CategoryPageController categoryPageController = Get.find<CategoryPageController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ThemeConfig.whiteColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: ThemeConfig.mainTextColor,
          elevation: 0,
          actions: [
            Obx(
              () => FavButtonWidget(
                isSelected: storeProductController.store.value.isFavorite,
                op: () {
                  storeProductController.store.value.isFavorite == false
                      ? userController
                          .addFavStore(storeProductController.store.value.id!)
                          .then((value) {
                          print(value);
                          if (value) {
                            storeProductController.store.value.isFavorite =
                                true;
                            storeProductController.store.refresh();
                            CustomSnackbar.SucessSnackbar(
                                'Store Added to Favorites');
                          } else {
                            storeProductController.store.value.isFavorite =
                                false;
                            CustomSnackbar.SucessSnackbar(
                                'Store removed from Favorites');
                            storeProductController.store.refresh();
                          }
                        })
                      : userController
                          .removeFavStore(
                              storeProductController.store.value.id!)
                          .then((value) {
                          if (value) {
                            storeProductController.store.value.isFavorite =
                                false;
                            CustomSnackbar.SucessSnackbar(
                                'Store removed from Favorites');

                            storeProductController.store.refresh();
                          } else {
                            storeProductController.store.value.isFavorite =
                                true;
                            CustomSnackbar.SucessSnackbar(
                                'Store Added to Favorites');
                            storeProductController.store.refresh();
                          }
                        });
                },
              ),
            ),
            ShareButtonWidget(
              op: () async {
                var link = await DyLinkHelperClass().createDynamicStoreLink(
                    storeProductController.store.value.id!,
                    storeProductController.store.value.shopImage!,
                    storeProductController.store.value.name!);
                print(link);
                Share.share(link);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: HeaderSection(),
                    ),
                    Expanded(
                      flex: 7,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Obx(
                              () {
                                if (storeProductController
                                        .store.value.categories ==
                                    null) {
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey[200]!,
                                    highlightColor: Colors.grey[50]!,
                                    enabled: true,
                                    child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: 7,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: const [
                                              ShimmerContainerSquare(
                                                size: 55,
                                              ),
                                              ShimmerContainer(
                                                height: 15,
                                              )
                                            ],
                                          );
                                        }),
                                  );
                                }
                                return ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: storeProductController
                                        .store.value.categories!.length,
                                    itemBuilder: (context, index) {
                                      return ProductTabWidget(
                                        id: storeProductController
                                            .store.value.categories![index].id!,
                                        storeProductUiController:
                                            storeProductUiController,
                                        index: index,
                                      );
                                    });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SearchBox(
                                    // onChange: (v) {},
                                    onChange: (val) {
                                      if (val == '') {
                                        storeProductController.getCatProducts(
                                            storeProductController
                                                .store.value.id!,
                                            storeProductController
                                                .store
                                                .value
                                                .categories![
                                                    storeProductUiController
                                                        .fragIndex.value]
                                                .id!);
                                      } else {
                                        storeProductController.filterProducts(
                                            storeProductController
                                                .store.value.id!,
                                            val);
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Obx(
                                    () {
                                      if (storeProductController
                                              .store.value.categories ==
                                          null) {
                                        return const ShimmerGrid();
                                      }
                                      if (storeProductController
                                                  .store
                                                  .value
                                                  .categories![
                                                      storeProductUiController
                                                          .fragIndex.value]
                                                  .Products ==
                                              null ||
                                          storeProductController
                                                  .store.value.id ==
                                              null) {
                                        return const ShimmerGrid();
                                      } else {
                                        return Container(
                                            color: ThemeConfig.whiteColor,
                                            child: storeProductController
                                                        .store
                                                        .value
                                                        .categories![
                                                            storeProductUiController
                                                                .fragIndex
                                                                .value]
                                                        .filteredProducts!
                                                        .length ==
                                                    0
                                                ? Container(
                                                    child: MainLabelText(
                                                        text:
                                                            'No Products Found'),
                                                    alignment: Alignment.center,
                                                  )
                                                : GridView.builder(
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    controller:
                                                        storeProductController
                                                            .ctrlScroll,
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing: 1,
                                                            childAspectRatio:
                                                                0.5,
                                                            mainAxisSpacing: 1),
                                                    itemCount:
                                                        storeProductController
                                                            .store
                                                            .value
                                                            .categories![
                                                                storeProductUiController
                                                                    .fragIndex
                                                                    .value]
                                                            .filteredProducts!
                                                            .length,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            ProductTile(
                                                              storeProductUiController:
                                                                  storeProductUiController,
                                                              index: index,
                                                            )));
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      return cartController.count.value == 0
                          ? const SizedBox()
                          : const SizedBox(
                              height: 45,
                            );
                    })
                  ],
                ),
              ),
              CartWidget(),
            ],
          ),
        ));
  }
}

class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[50]!,
      enabled: true,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              childAspectRatio: 0.6,
              mainAxisSpacing: 1),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SB.large(),
                  const Center(
                    child: ShimmerContainerSquare(
                      size: 100,
                    ),
                  ),
                  const ShimmerContainer(
                    height: 20,
                    // width: 120,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: const [
                            ShimmerContainer(
                              height: 15,
                              // width: 120,
                            ),
                            ShimmerContainer(
                              height: 15,
                              // width: 120,
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: ShimmerContainer(
                          height: 40,
                          // width: 120,
                        ),
                      ),
                    ],
                  )
                ]);
          }),
    );
  }
}
