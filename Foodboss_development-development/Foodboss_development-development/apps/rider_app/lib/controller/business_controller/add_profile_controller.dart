import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:rider_app/infrastructure/profile_service.dart';
import 'package:rider_app/models/ProfileRegistrationModel.dart';

class AddProfileController extends GetxController {
  Rx<ProfileRegistrationModel> store =
      Rx<ProfileRegistrationModel>(ProfileRegistrationModel());

  addVehicleNo(String value) {
    store.value.vehicalNo = value;
    print(value);
  }

  addLicenceNo(String value) {
    store.value.licenceNo = value;
    print(value);
  }

  addLatitute(String value) {
    store.value.latitude = value;
  }

  addLongitude(String value) {
    store.value.longitude = value;
  }

  addAddressLine1(String value) {
    store.value.address!.line1 = value;
  }

  addAddressLine2(String value) {
    store.value.address!.line2 = value;
  }

  addAddressArea(String value) {
    store.value.address!.area = value;
    printInfo(info: store.value.address!.area.toString());
  }

  addAddressCity(String value) {
    store.value.address!.city = value;
  }

  addAddressState(String value) {
    store.value.address!.state = value;
  }

  addAddressZip(String value) {
    store.value.address!.zip = value;
  }

  addShopLetLang(String lat, String lang, String add1, String add2, String city,
      String state, String pin, String area) {
    print(lat);
    print(lang);
    print(add1);
    print(add2);
    print(city);
    print(state);
    print(pin);
    print(area);

    store.value.latitude = lat;
    store.value.longitude = lang;
    store.value.address = Address(
        line1: add1,
        area: area,
        state: state,
        line2: add2,
        city: city,
        zip: pin);
    // store.refresh();
    // addAddressLine1(add1);
    // addAddressLine2(add2);
    // addAddressArea(area);
    // addAddressCity(city);
    // addAddressState(state);
    // addAddressZip(pin);
  }

  addDriverImages() async {
    await store.value.addDriverImage();
    store.refresh();
  }

  addLicenceImage() async {
    await store.value.addLicenceImage();
    store.refresh();
  }

  // addGstImages() async {
  //   await store.value.addGst();
  //   store.refresh();
  // }

  // addShopRegImages() async {
  //   await store.value.addShopRegistration();
  //   store.refresh();
  // }

  // addQrImages() async {
  //   await store.value.addQrImage();
  //   store.refresh();
  // }

  addProfileDetials() async {
    // _state.value = States.LOADING_STATE;
    try {
      // AuthResponseModel? response =
      dio.FormData data = await store.value.toJson();
      printInfo(info: data.files.toString());
      printInfo(info: data.fields.toString());
      var success = await ProfileService.addProfile(store.value);
      print(success);
      if (success == true) {
        // Get.toNamed("/");
        Get.snackbar('Done! ', 'Profile Registered');
        Get.toNamed("/delivery-schedule", arguments: [true]);
      } else {
        Get.snackbar('Opps', 'errorrrr');
      }
      // if (response == null) {
      //   _state.value = States.ERROR_STATE;
      //   Get.snackbar("Opps", "Something went wrong");
      // } else {
      //   if (response.success == false) {
      //     _state.value = States.ERROR_STATE;
      //     Get.snackbar("Opps", response.message!);
      //   } else {
      //     _state.value = States.SUCCESS_STATE;
      //     controllerAuth.changeType(false);
      //     Get.toNamed("/otpverify",arguments: {'phone':_phone.value,'from_login': true});
      //   }
      // }
      // _state.value = States.SUCCESS_STATE;
    } catch (e) {
      printInfo(info: e.toString());
      Get.snackbar("Opps", "Something went wrong");
      // _state.value = States.ERROR_STATE;
    }
  }
}
