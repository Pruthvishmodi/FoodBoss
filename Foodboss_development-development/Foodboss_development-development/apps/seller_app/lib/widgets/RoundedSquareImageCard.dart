// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:seller_app/controller/business_controller/store_registration/store_registration_controller.dart';
// import 'package:shared_widgets/Config/theme_config.dart';

// class RoundedSquareImageCard extends StatelessWidget {
//   final String? image;
//   final int index;
//   final void Function()? onTap;
//   const RoundedSquareImageCard({
//     Key? key,
//     this.image,
//     this.onTap,
//     required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     StoreRegistrationController controller =
//         Get.find<StoreRegistrationController>();
//     return GestureDetector(
//       onTap: () {
//         controller.addShopImages();
//       },
//       child: Obx(
//         () {
//           if(){
//           // print(controller.store.value.shopImages![index].path);
//              return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
//               decoration: BoxDecoration(
//                 color: ThemeConfig.WHITE_COLOR,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               height: 100,
//               width: 100,
//               child: const Center(
//                 child: Icon(Icons.add),
//               ),
//             );
//           } else {
//             return Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
//                 decoration: BoxDecoration(
//                   color: ThemeConfig.WHITE_COLOR,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 height: 100,
//                 width: 100,
//                 child: controller.store.value.shopImages[index].path == null
//                     ? const Center(
//                         child: Icon(Icons.check),
//                       )
//                     : Image.file(
//                         controller.store.value.shopImages[index],
//                         fit: BoxFit.fill,
//                       ));
//           }
//         },
//       ),
//     );
//   }
// }
