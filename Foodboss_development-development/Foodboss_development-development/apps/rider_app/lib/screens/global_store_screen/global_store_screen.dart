// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:seller_app/config/page_layout.dart';
// import 'package:shared_widgets/Config/theme_config.dart';
// import 'package:seller_app/controller/business_controller/store/store_controller.dart';
// import 'package:seller_app/screens/global_store_screen/global_store_controller.dart';
// import 'package:seller_app/screens/global_store_screen/mockData.dart';
// import 'package:seller_app/screens/global_store_screen/side_screen.dart';
// import 'package:seller_app/widgets/CustomAppBar.dart';
// import 'package:seller_app/widgets/SubText.dart';
// import 'package:seller_app/widgets/text_widgets/desc.dart';

// class GlobalStoreScreen extends StatelessWidget {
//   final int _selectedIndex = 0;

//   final GlobalStoreController controller =
//       Get.put(GlobalStoreController(), permanent: false);

//   final  StoreController storeController = Get.put(StoreController(),permanent: false);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return PageLayout(
//       appBar: true,
//       bottombar: false,
//       backArrow: false,
//       title: "Global Store",
//       color: ThemeConfig.PRIMARY_COLOR,
//       appbarFunc: () {},
//       child: SafeArea(
//         child: Container(
//           height: size.height,
//           width: size.width,
//           color: ThemeConfig.FORM_COLOR,
//           padding: EdgeInsets.only(
//               // right: size.width * 0.03,
//               top: size.width * 0.01,
//               bottom: size.width * 0.01),
//           child: SingleChildScrollView(
//             child: Obx(
//               () {
//               // var mainCatdata = storeController.mainCatagories.value;
//                 return Row(
//                 children: [
//                   Expanded(
//                     // flex: controller.selectedWidget.value == 0 ? 4 : 1,
//                     flex: 2,
//                     child: AnimatedContainer(
//                       duration: const Duration(microseconds: 100),
//                       height: MediaQuery.of(context).size.height,
//                       color: ThemeConfig.WHITE_COLOR,
//                       child: ListView.builder(
//                         itemCount:  storeProductList.length,
//                         itemBuilder: (context, index) => NavigationContainer(
//                           index: index,
//                           title: "mainCatdata[index].catModel",
//                           imageLocation: "mainCatdata[index].imageLocation",
//                           widgetIndex: 0,
//                         ),
//                       ),
//                     ),
//                   ),
//                   controller.selectedWidget.value >= 1
//                       ? Expanded(
//                           // flex: controller.selectedWidget.value == 1 ? 4 : 1,
//                           flex: controller.selectedWidget.value == 1 ? 8 : 2,
//                           child: AnimatedContainer(
//                             duration: const Duration(microseconds: 100),
//                             height: MediaQuery.of(context).size.height,
//                             color: ThemeConfig.WHITE_COLOR,
//                             child: ListView.builder(
//                               itemCount:
//                                   storeProductList[controller.tabIndex.value]
//                                       .list
//                                       .length,
//                               itemBuilder: (context, index) =>
//                                   NavigationContainer(
//                                 index: index,
//                                 title: storeProductList[controller.tabIndex.value]
//                                     .list[index]
//                                     .subCategoryName,
//                                 imageLocation:
//                                     storeProductList[controller.tabIndex.value]
//                                         .list[index]
//                                         .imageLocation,
//                                 widgetIndex: 1,
//                               ),
//                             ),
//                           ),
//                         )
//                       : const SizedBox(
//                           width: 0,
//                         ),
//                   controller.selectedWidget.value == 2
//                       ? Expanded(
//                           // flex: controller.selectedWidget.value == 2 ? 8 : 5,
//                           flex: 6,
//                           child: Obx(
//                             () => SideScreen(
//                               subCategory: storeProductList[
//                                           controller.tabIndex.value]
//                                       .list[controller.secondTabIndex.value]
//                                       .containsCat
//                                   ? storeProductList[controller.tabIndex.value]
//                                       .list[controller.secondTabIndex.value]
//                                       .catagories
//                                   : storeProductList[controller.tabIndex.value]
//                                       .list[controller.secondTabIndex.value]
//                                       .items,
//                               contains:
//                                   storeProductList[controller.tabIndex.value]
//                                       .list[controller.secondTabIndex.value]
//                                       .containsCat,
//                             ),
//                           ),
//                         )
//                       : const SizedBox(
//                           width: 0,
//                         ),
//                 ],
//               );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NavigationContainer extends StatelessWidget {
//   final String title;
//   final String imageLocation;
//   final int index;
//   final int widgetIndex;

//   const NavigationContainer(
//       {Key? key,
//       required this.title,
//       required this.imageLocation,
//       required this.index,
//       required this.widgetIndex})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final GlobalStoreController controller =
//         Get.put(GlobalStoreController(), permanent: false);
//     return GestureDetector(
//       onTap: () {
//         controller.changeWidgetIndex(widgetIndex,0);
//         if (widgetIndex == 0) {
//           controller.changeTabIndex(index);
//         } else {
//           controller.changeSecondTabIndex(index);
//         }
//       },
//       child: Obx(
//         () => Container(
//           // duration: const Duration(microseconds: 300),
//           padding: const EdgeInsets.all(5),
//           margin: const EdgeInsets.symmetric(horizontal: 2),
//           decoration: BoxDecoration(
//               color: widgetIndex == 0
//                   ? controller.tabIndex.value == index
//                       ? ThemeConfig.FORM_COLOR
//                       : ThemeConfig.WHITE_COLOR
//                   : controller.secondTabIndex.value == index
//                       ? ThemeConfig.FORM_COLOR
//                       : ThemeConfig.WHITE_COLOR,
//               border: Border.all(width: 1, color: ThemeConfig.FORM_COLOR)),
//           child: controller.selectedWidget.value == widgetIndex
//               ? Row(
//                   children: [
//                     Container(
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           image: const DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage(
//                               // imageLocation,
//                               "assets/images/healthy-food.png",
//                             ),
//                           )),
//                     ),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Expanded(
//                       child: Desc(
//                         descString: title,
//                         alignment: TextAlign.left,
//                       ),
//                     )
//                   ],
//                 )
//               : Column(
//                   children: [
//                     Container(
//                       height: 30,
//                       width: 30,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           image: const DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage(
//                               // imageLocation,
//                               "assets/images/healthy-food.png",
//                             ),
//                           )),
//                     ),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }
// }
