import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/category_page_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Models/shop_model.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/heading_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/components/rating_widget.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ChooseStoreList extends StatelessWidget {
  ChooseStoreList({Key? key}) : super(key: key);

  var args = Get.arguments;

  CategoryPageController categoryPageController =
      Get.find<CategoryPageController>();

  @override
  Widget build(BuildContext context) {
    int id = args[0];
    return Scaffold(
      backgroundColor: ThemeConfig.whiteColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ThemeConfig.mainTextColor),
        backgroundColor: ThemeConfig.whiteColor,
        elevation: 0,
        // title: Text(""),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () {
              if (categoryPageController.categories.value.data!
                      .firstWhere((element) => element.id == id)
                      .listOfShops ==
                  null) {
                return Shimmer.fromColors(
                  enabled: true,
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[50]!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: ThemeConfig.screenPadding,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ShimmerContainer(),
                            ShimmerContainer(
                              width: double.infinity,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          // shrinkWrap: true,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemBuilder: (BuildContext context, int index) {
                            return const ShimmerListTile();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                var shops = categoryPageController.categories.value.data!
                    .firstWhere((element) => element.id == id)
                    .listOfShops;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: ThemeConfig.screenPadding,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HeadingText(text: "Select Store"),
                          MainLabelText(
                            text: '${shops!.length} stores near your location',
                            isBold: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: shops.isEmpty
                          ? const Center(
                              child: MainLabelText(text: 'No shops found'))
                          : RefreshIndicator(
                              onRefresh: () async => categoryPageController
                                  .getShopListByCategory(id),
                              child: ListView.builder(
                                itemCount: shops.length,
                                // shrinkWrap: true,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                itemBuilder: (BuildContext context, int index) {
                                  return StoreListTile(
                                    shopModel: shops[index],
                                    catId: id,
                                  );
                                },
                              ),
                            ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class StoreListTile extends StatelessWidget {
  final ShopModel shopModel;
  final int catId;
  const StoreListTile({
    Key? key,
    required this.shopModel,
    required this.catId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreProductController storeProductController =
        Get.put(StoreProductController());
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print(shopModel.isShopClose!);
        if (!shopModel.isShopClose!) {
          storeProductController.setStore(shopModel, catId);
          Get.toNamed('/store-products-screen');
        } else {
          CustomSnackbar.infoSnackbar('Store is temporary closed');
        }
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  foregroundDecoration: shopModel.isShopClose!
                      ? BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          backgroundBlendMode: BlendMode.saturation,
                        )
                      : null,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: shopModel.shopImage!,
                      fit: BoxFit.fill,
                      progressIndicatorBuilder:
                          (BuildContext context, child, loadingProgress) {
                        return Center(
                            child: Shimmer.fromColors(
                          child: const ShimmerContainerSquare(size: 100),
                          baseColor: Colors.grey[200]!,
                          highlightColor: Colors.grey[50]!,
                          enabled: true,
                        ));
                      },
                    ),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainLabelText(
                      text: shopModel.name!,
                      isBold: true,
                    ),
                    SB.small(),
                    DescriptionText(
                        text:
                            '${shopModel.city} - ${(shopModel.distance! / 1000).toStringAsFixed(1)} km away'),
                    SB.small(),
                    shopModel.totalRatings == null
                        ? const SizedBox()
                        : Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ThemeConfig.primaryColorLite,
                                  border: Border.all(
                                      width: 1,
                                      color: ThemeConfig.primaryColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(3),
                                child: Row(
                                  children: [
                                    LabelText(
                                        text:
                                            shopModel.totalRatings.toString()),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    StarRatingWidget(
                                        value: double.parse(
                                            shopModel.totalRatings!)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              DescriptionText(
                                text: ' (${shopModel.totalReviews})',
                                // isBold: true,
                              ),
                            ],
                          ),
                    shopModel.isShopClose!
                        ? const LabelText(text: 'Temporarily closed')
                        : const SizedBox()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
