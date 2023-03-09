// import 'package:get/get.dart';
// import 'package:seller_app/infrastructure/my_store/get_cat.dart';
// import 'package:seller_app/models/store/mystore_cat.dart';
// import 'package:seller_app/models/store/mystore_item.dart';

// class MyStoreItemController extends GetxController {

//   final int id;
//   MyStoreItemController({required this.id});

//   var myStoreItems = ListItemMyStoreData().obs;
  
//   getDataofCategory(int id)async{

//     try {
//       MyStoreItems? data = await MyStoreServices.getMyStoreItems(id);
//       print(data);

//       if(data == null){
//         Get.snackbar('Error', 'No data found');
//       }else{
//         if(data.success == false){
//           Get.snackbar('Opps', 'Something went wrong');
//         }else{
//           myStoreItems.value = data.data!;
//         }
//       }
//     } catch (e) {

//       print(e);
//       Get.snackbar('Something went wrong', 'Something went wrong');
//     }
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     // getCatCotroller();
 
//       getDataofCategory(id);
    
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
