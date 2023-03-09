// import 'package:get/get.dart';
// import 'package:rider_app/infrastructure/addshopservices/add_shop_services.dart';
// import 'package:rider_app/models/store_delivery/store_registration.dart';

// class StoreRegistrationController extends GetxController {
//   Rx<StoreregistrationModel> store =
//       Rx<StoreregistrationModel>(StoreregistrationModel());
//   addShopName(String value) {
//     store.value.name = value;
//   }

//   addShopAddress(String value) {
//     store.value.address1 = value;
//   }

//   addShopAddress2(String value) {
//     store.value.address2 = value;
//   }

//   addShopArea(String value) {
//     store.value.area = value;
//   }

//   addShopCity(String value) {
//     store.value.city = value;
//     store.value.taluka = value;
//   }

//   addShopState(String value) {
//     store.value.state = value;
//   }

//   addShopZip(String value) {
//     store.value.pincode = value;
//   }

//   addShopDist(String value) {
//     store.value.district = value;
//   }

//   addShopLetLang(String lat, String lang, String add1, String add2, String city,
//       String dist, String state, String pin, String area) {
//     store.value.latitude = lat;
//     store.value.longitude = lang;
//     addShopAddress(add1);
//     addShopAddress2(add2);
//     addShopArea(area);
//     addShopCity(city);
//     addShopState(state);
//     addShopZip(pin);
//     addShopDist(dist);
//   }

//   addShopImages(bool fromCamera) async {
//     await store.value.addShopImage(fromCamera);
//     store.refresh();
//     Get.back();
//   }

//   addOwnerImage(bool fromCamera) async {
//     await store.value.addOwnerImage(fromCamera);
//     store.refresh();
//     Get.back();
//   }

//   addGstImages(bool fromCamera) async {
//     await store.value.addGst(fromCamera);
//     store.refresh();
//     Get.back();
//   }

//   addShopRegImages(bool fromCamera) async {
//     await store.value.addShopRegistration(fromCamera);
//     store.refresh();
//     Get.back();
//   }

//   addQrImages(bool fromCamera) async {
//     await store.value.addQrImage(fromCamera);
//     store.refresh();
//     Get.back();
//   }

//   addShop() async {
//     // _state.value = States.LOADING_STATE;
//     try {
//       // AuthResponseModel? response =
//       var success = await AddShopServices.addShop(store.value);
//       if (success == true) {
//         // Get.toNamed("/");
//         Get.toNamed("/delivery-schedule");
//       }
//       // if (response == null) {
//       //   _state.value = States.ERROR_STATE;
//       //   Get.snackbar("Opps", "Something went wrong");
//       // } else {
//       //   if (response.success == false) {
//       //     _state.value = States.ERROR_STATE;
//       //     Get.snackbar("Opps", response.message!);
//       //   } else {
//       //     _state.value = States.SUCCESS_STATE;
//       //     controllerAuth.changeType(false);
//       //     Get.toNamed("/otpverify",arguments: {'phone':_phone.value,'from_login': true});
//       //   }
//       // }
//       // _state.value = States.SUCCESS_STATE;
//     } catch (e) {
//       print(e);
//       Get.snackbar("Opps", "Something went wrong");
//       // _state.value = States.ERROR_STATE;
//     }
//   }
// }
