import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/category_page_controller.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/title_text.dart';
import 'package:customer_app/Widgets/card_tile.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryPageController categoryPageController =
        Get.put(CategoryPageController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeConfig.whiteColor,
      body: SafeArea(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          padding: ThemeConfig.screenPadding,
          constraints:
              const BoxConstraints(maxWidth: ThemeConfig.maxScreenSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SB.large(),
              const TitleText(text: 'All Categories'),
              SB.small(),

              const LabelText(text: 'Curated with the best range of products'),
              // const MainLabelText(
              //     text: 'Curated with the best range of products'),
              const SizedBox(height: 30),
              Expanded(
                child: CategoriesWidget(
                    categoryPageController: categoryPageController, size: size),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
    required this.categoryPageController,
    required this.size,
  }) : super(key: key);

  final CategoryPageController categoryPageController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (categoryPageController.categories.value.data == null) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            enabled: true,
            child: GridView.builder(
              padding: const EdgeInsets.all(5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .8,
                crossAxisCount: size.width > 500 ? 6 : 4,
                // crossAxisSpacing: 5,
                mainAxisSpacing: 0,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ShimmerContainerSquare(
                      size: 75,
                    ),
                    ShimmerContainer(
                      height: 20,
                    )
                  ],
                );
              },
            ),
          );
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(5),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .69,
              crossAxisCount: size.width > 500 ? 6 : 4,
              // crossAxisSpacing: 5,
              mainAxisSpacing: 10,
            ),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: categoryPageController.categories.value.data!.length,
            itemBuilder: (context, index) {
              return CardTile(
                  name: categoryPageController
                      .categories.value.data![index].name!,
                  price: 123,
                  imageUrl: categoryPageController
                      .categories.value.data![index].photo!,
                  isFavourite: true,
                  changeType: () {
                    categoryPageController.getShopListByCategory(
                        categoryPageController
                            .categories.value.data![index].id!);

                    Get.toNamed('/shop-list', arguments: [
                      categoryPageController.categories.value.data![index].id
                    ]);
                  });
            },
          );
        }
      },
    );
  }
}
