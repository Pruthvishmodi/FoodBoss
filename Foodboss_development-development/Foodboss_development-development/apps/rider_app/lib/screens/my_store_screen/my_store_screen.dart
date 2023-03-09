import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/screens/global_store_screen/global_store_controller.dart';
import 'package:rider_app/screens/global_store_screen/global_store_screen.dart';
import 'package:rider_app/screens/global_store_screen/mockData.dart';
import 'package:rider_app/screens/global_store_screen/side_screen.dart';
import 'package:rider_app/screens/my_store_screen/demo_my_store.dart';
import 'package:rider_app/screens/my_store_screen/my_store_body.dart';
import 'package:rider_app/widgets/CustomAppBar.dart';
import 'package:rider_app/widgets/SubText.dart';
import 'package:rider_app/widgets/drawer/drawer_main.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:shared_widgets/shared_widgets.dart';

class MyStoreScreen extends StatelessWidget {
  TabBar get _tabBar => TabBar(
        padding: const EdgeInsets.all(5),
        isScrollable: true,
        unselectedLabelColor: ThemeConfig.WHITE_COLOR,
        labelColor: ThemeConfig.MAIN_TEXT_COLOR,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: ThemeConfig.WHITE_COLOR),
        tabs: democategoryList
            .map(
              (e) => Container(
                  height: 40, child: Center(child: Text(e.categoryName!))),
            )
            .toList(),
        // tabs: [
        //   Container(height: 40, child: const Center(child: Text("Fruits and Vegitables"))),
        //   const Text("Ready to Ship"),
        //   const Text("Shipped"),
        //   const Text("Completed"),
        //   const Text("Cancelled"),
        //   const Text("Returned"),
        //   const Text("CRP"),

        // ],
      );

  const MyStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: democategoryList.length,
      child: PageLayout(
        appBar: true,
        bottombar: true,
        backArrow: false,
        title: "My Store",
        tabBar: _tabBar,
        selectedIndex: 0,
        color: ThemeConfig.PRIMARY_COLOR,
        appbarFunc: () {
          Get.toNamed("/global-store");
        },
        child: const MyStoreBody(),
      ),
    );
  }
}

class NavigationContainer extends StatelessWidget {
  final String title;
  final String imageLocation;
  final int index;

  const NavigationContainer(
      {Key? key,
      required this.title,
      required this.imageLocation,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalStoreController controller =
        Get.put(GlobalStoreController(), permanent: false);
    return GestureDetector(
      onTap: () {
        // controller.changeTabIndex(index);
      },
      child: Obx(
        () => Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
                color: controller.tabIndex.value == index
                    ? ThemeConfig.FORM_COLOR
                    : ThemeConfig.WHITE_COLOR,
                border: Border.all(width: 1, color: ThemeConfig.FORM_COLOR)),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          imageLocation,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                Desc(
                  descString: title,
                  alignment: TextAlign.center,
                )
              ],
            )),
      ),
    );
  }
}
