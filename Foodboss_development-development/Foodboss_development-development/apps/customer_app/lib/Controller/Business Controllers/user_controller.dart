import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Models/network_call_models.dart/banner_call.dart';
import 'package:customer_app/Models/network_call_models.dart/contact_us_call.dart';
import 'package:customer_app/Models/network_call_models.dart/get_fav_food_call.dart';
import 'package:customer_app/Models/network_call_models.dart/get_fav_store_call.dart';
import 'package:customer_app/Models/user_model.dart';
import 'package:customer_app/Services/general_services.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:get/get.dart';

import '../../Services/authentication_services.dart';

class UserController extends GetxController {
  var user = UserModel().obs;

  CartController cartController = Get.put(CartController(), permanent: true);
  UserModel get getUser => user.value;

  var banners = BannerCall().obs;

  getBanners() async {
    var bannerCall = await AuthenticationSerices.getBanners();
    print(bannerCall.data);
    banners.value = BannerCall.fromJson(bannerCall.data);
  }

  //fav food
  var favFoods = GetFavFoodCall().obs;
  getFavoritesFoods() async {
    try {
      var call = await GeneralServices.getFavFood();

      if (call != null) {
        favFoods.value = call;
        if (favFoods.value.products != null) {
          // List<Product> data = CatwiseProductCall.fromJson(call).data!=null?CatwiseProductCall.fromJson(call).data!:<Product>[];
          // if (favFoods.value.products!.isNotEmpty) {
          //   favFoods.value.products!.forEach((element) {
          //     cartController.cart.forEach((e) {
          //       if (e.name == element.name) {
          //         element.quantity = e.quantity;
          //       }
          //     });
          //   });
          // }
          print('here');

          favFoods.value.products!.forEach((element) {
            cartController.getCart.value.store!.forEach((x) {
              x.items!.forEach((ele) {
                // print(ele.foodId);
                // print(element.id);
                if (element.id == ele.foodId) {
                  element.quantity = ele.quantity;
                  element.deleteCartId = ele.id;
                }
              });
            });
          });
          favFoods.refresh();
        }
      } else {
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar2('Something went Wrong,DIO');
    }
  }

  Map<String, dynamic> foodRequestToJson(
      int foodId, int shopId, String userId) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['food_id'] = foodId;
    data['user_id'] = userId;
    data['shop_id'] = shopId;
    return data;
  }

  removeFavFood(int foodId, int shopId) async {
    try {
      print(foodId);
      var json = foodRequestToJson(foodId, shopId, user.value.userId!);
      var call = await GeneralServices.removeFavFood(json);
      print(call);
      if (call == true) {
        favFoods.value.products!.removeWhere((element) => element.id == foodId);
        favFoods.refresh();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  addFavFood(int foodId, int shopId) async {
    try {
      print(foodId);
      print(shopId);
      var json = foodRequestToJson(foodId, shopId, user.value.userId!);
      var call = await GeneralServices.addFavFood(json);
      print(call);
      if (call == true) {
        // favFoods.value.products!.removeWhere((element) => element.id == foodId);
        // favFoods.refresh();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  var favStores = GetFavStoreCall().obs;
  getFavoritesStores() async {
    try {
      var call = await GeneralServices.getFavStores();

      if (call != null) {
        favStores.value = call!;
      } else {
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  Map<String, dynamic> storeRequestToJson(int shopId) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['shop_id'] = shopId;
    return data;
  }

  Future<bool> addFavStore(int shopId) async {
    try {
      print(shopId);
      var json = storeRequestToJson(shopId);
      var call = await GeneralServices.addFavStore(json);
      print(call);
      if (call == true) {
        // favFoods.value.products!.removeWhere((element) => element.id == foodId);
        // favFoods.refresh();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> removeFavStore(int shopId) async {
    try {
      print(shopId);
      var json = storeRequestToJson(shopId);
      var call = await GeneralServices.removeFavStore(json);
      print(call);
      if (call == true) {
        favStores.value.stores!.removeWhere((element) => element.id == shopId);
        favStores.refresh();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('here $e');
      return false;
    }
  }

  var contactUs = ContactUs().obs;
}
