import 'package:customer_app/Models/category_model.dart';
import 'package:customer_app/Models/network_call_models.dart/get_shops_call.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/utils/requests.dart';
import 'package:customer_app/utils/urls.dart';
import 'package:get/get.dart';

class CategoryPageController extends GetxController {
  var categories = Categories().obs;

  fetchCategories() async {
    try {
      var call = await Request.getData(Urls.LIST_CATEGORIES, true);

      if (call.statusCode == 200) {
        if (call != null) {
          categories.value = Categories.fromJson(call.data);
          categories.refresh();
          // while (categories.value.data!.length < categories.value.total!) {
          //   await getItemsByPage(categories.value.nextPageUrl!);
          // }
        } else {
          // Get.snackbar('Error', 'Something went wrong');
          CustomSnackbar.errorSnackbar();
        }
      }
    } catch (e) {
      // Get.snackbar('Something went wrong', 'Network Error');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  // getItemsByPage(String url) async {
  //   // _state.value = States.LOADING_STATE;
  //   try {
  //     var data = await Request.getData(url, true);
  //     print(data);
  //     if (data == null) {
  //       Get.snackbar('Error', 'Something went wrong');
  //       // CustomSnackbar.errorSnackbar();
  //     } else {
  //       if (data.success == false) {
  //         Get.snackbar('Error', 'Something went wrong');
  //         // CustomSnackbar.errorSnackbar();
  //       } else {
  //         categories.value.nextPageUrl = data.nextPageUrl;
  //         data.data!.forEach((element) {
  //           categories.value.data!.add(element);
  //         });

  //       }
  //     }
  //   } catch (e) {
  //     // _state.value = States.ERROR_STATE;
  //     Get.snackbar('Error', 'Something went wrong');

  //     print(e);
  //     // CustomSnackbar.errorSnackbar();
  //   }
  // }

  getShopListByCategory(int id) async {
    try {
      var call = await Request.getData(Urls.GETSHOPLIST(id), true);
      print(call);
      if (call.statusCode == 200) {
        if (call != null) {
          var shops = GetShopsCall.fromJson(call.data);
          categories.value.data!
              .firstWhere((element) => element.id == id)
              .listOfShops = shops.data;
          categories.refresh();
          // while (categories.value.data!.length < categories.value.total!) {
          //   await getItemsByPage(categories.value.nextPageUrl!);
          // }
        } else {
          // Get.snackbar('Error', 'Something went wrong');
          CustomSnackbar.errorSnackbar();
        }
      }
    } catch (e) {
      print(e);
      // Get.snackbar('Something went wrong', 'Network Error');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  @override
  void onInit() {
    fetchCategories();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
