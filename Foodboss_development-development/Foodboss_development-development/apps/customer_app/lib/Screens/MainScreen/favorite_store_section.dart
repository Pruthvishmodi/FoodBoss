import 'package:customer_app/Controller/UI%20Controllers/main_screen_ui_controller.dart';
import 'package:customer_app/Models/shop_model.dart';
import 'package:customer_app/Screens/MainScreen/store_container.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteStoreSection extends StatelessWidget {
  const FavoriteStoreSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainScreenController mainScreenController =
        Get.find<MainScreenController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MainLabelText(
                text: 'Favourite Stores',
                isBold: true,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/favroitestore', arguments: [1]);
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
          if (mainScreenController.userController.favStores.value.stores ==
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
                .userController.favStores.value.stores!.isEmpty) {
              return const Center(
                child: MainLabelText(text: 'No Favorite Stores added yet'),
              );
            } else {
              return SizedBox(
                height: 180,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: true,
                  itemCount: mainScreenController
                      .userController.favStores.value.stores!.length,
                  itemBuilder: (BuildContext context, int index) {
                    ShopModel store = mainScreenController
                        .userController.favStores.value.stores![index];
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: StoreContainer(shopModel: store),
                    );
                  },
                ),
              );
            }
          }
        }),
        // SB.medium(),
        // BannerWidget(
        //   index: 3,
        // ),
      ],
    );
  }
}
