import 'dart:io';

import 'package:get/get.dart';
import 'package:seller_app/infrastructure/addshopservices/add_shop_services.dart';
import 'package:seller_app/infrastructure/my_store/add_photo_service.dart';
import 'package:seller_app/models/store/add_photo_request_model.dart';
import 'package:seller_app/models/store_delivery/store_registration.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';

class AddPhotoRequestController extends GetxController {
  Rx<AddPhotoRequestModel> request =
      Rx<AddPhotoRequestModel>(AddPhotoRequestModel());

  addPhotoIdName(String value) {
    request.value.productID = value;
  }

   File get file1 => request.value.files[0];
   File get file2 => request.value.files[1];
   File get file3 => request.value.files[2];

  //  bool checkFile1(){ 
  //    if(request.value.files.len){
  //      return false;
  //    }else{
  //      return true;
  //    }
  //  }


  addfile(bool value) async {
    await request.value.addShopImage(value);
    Get.back();
    request.refresh();
  }
 
 


  addShop() async {
    // _state.value = States.LOADING_STATE;
    try {
      // AuthResponseModel? response =
      print(request.value.productID);
      var success = await AddPhotoService.addPhoto(request.value);
      if (success == true) {
        // Get.toNamed("/");
        // Get.toNamed("/delivery-schedule");
        CustomSnackbar.SucessSnackbar('Request Sent Successfully');
        request.value.files = [];
        request.value.productID = '';
      }else{
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar();
    }
  }
}
