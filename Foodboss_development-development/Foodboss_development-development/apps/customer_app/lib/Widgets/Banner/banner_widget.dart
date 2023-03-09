import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/category_page_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Models/network_call_models.dart/banner_call.dart'
    as bn;
import 'package:customer_app/Widgets/Banner/cbw.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BannerWidget extends StatelessWidget {
  final int index;
  ScrollController _scrollController = ScrollController();
  BannerWidget({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200), curve: Curves.easeOut);
    }

    UserController userController = Get.find<UserController>();
    CategoryPageController categoryPageController =
        Get.find<CategoryPageController>();
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {},
        child: Obx(
          () {
            if (userController.banners.value.data == null) {
              return Shimmer.fromColors(
                enabled: true,
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[50]!,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: ThemeConfig.screenPadding,
                  child: ShimmerContainer(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                  ),
                ),
              );
            } else {
              var banner = userController.banners.value.data != null
                  ? userController.banners.value.data![index]
                  : bn.Banner();
              return CustomBanner(banner: banner);
            }
          },
        ));
  }
}
