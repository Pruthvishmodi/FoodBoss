import 'package:customer_app/Models/my_khata_list.dart';
import 'package:customer_app/Services/khata_services.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/utils/requests.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class KhataController extends GetxController {
  var khataList = MyKhataList().obs;

  fetchKhatas() async {
    try {
      MyKhataList? call = await KhataServices.getKhataList();

      if (call != null) {
        if (call.success == true) {
          khataList.value = call;
        } else {
          khataList.value.data = [];
          CustomSnackbar.errorSnackbar2("Khata not available");
        }
      } else {
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar();
    }
  }

  fetchKhataDetails(int id) async {
    try {
      var call = await KhataServices.getKhataDetails(id);

      if (call != null) {
        khataList.value.data!
            .firstWhere((element) => element.khataId == id)
            .paymentHistory = call.paymentHistory;
        khataList.value.data!
            .firstWhere((element) => element.khataId == id)
            .shopImage = call.shopImage;
        khataList.refresh();
      } else {
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar();
    }
  }
}
