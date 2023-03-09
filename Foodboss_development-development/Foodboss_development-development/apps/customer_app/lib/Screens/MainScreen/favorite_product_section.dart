import 'package:customer_app/Controller/UI%20Controllers/main_screen_ui_controller.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Screens/MainScreen/fav_product_container.dart';
import 'package:customer_app/Widgets/Banner/banner_widget.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteProductSection extends StatelessWidget {
  const FavoriteProductSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainScreenController mainScreenController =
        Get.find<MainScreenController>();
    return Column(
      children: [
        BannerWidget(index: 1),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MainLabelText(
                text: 'Favourite Products',
                isBold: true,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/favroitestore', arguments: [0]);
                },
                behavior: HitTestBehavior.translucent,
                child: const LabelText(
                  text: 'See all',
                  isSecondary: true,
                ),
              )
            ],
          ),
        ),
        SB.medium(),
        Obx(() {
          if (mainScreenController.userController.favFoods.value.products ==
              null) {
            return Shimmer.fromColors(
                child: const ShimmerContainer(
                  height: 200,
                  width: double.infinity,
                ),
                baseColor: Colors.white,
                highlightColor: Colors.grey.shade200);
          } else {
            if (mainScreenController
                .userController.favFoods.value.products!.isEmpty) {
              return const Center(
                child: MainLabelText(text: 'No Favorite products added yet'),
              );
            } else {
              return SizedBox(
                height: 230,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: mainScreenController
                      .userController.favFoods.value.products!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product product = mainScreenController
                        .userController.favFoods.value.products![index];
                    return Padding(
                        padding: const EdgeInsets.all(5),
                        child: FavProductContainer(
                          product: product,
                          index: index,
                        ));
                  },
                ),
              );
            }
          }
        }),
        SB.medium(),
        // BannerWidget(
        //   index: 2,
        // ),
      ],
    );
  }
}
