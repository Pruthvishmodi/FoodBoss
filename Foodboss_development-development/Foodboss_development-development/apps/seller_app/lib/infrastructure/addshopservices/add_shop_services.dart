import 'package:seller_app/models/store_delivery/delivry_module.dart';
import 'package:seller_app/models/store_delivery/get_delivery_setting_model.dart';
import 'package:seller_app/models/store_delivery/store_registration.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class AddShopServices {
  static addShop(StoreregistrationModel request) async {
    print("here");
    // CustomSnackbar.errorSnackbar2('here');
    var json = await request.toJson();
    // print(json);
    // CustomSnackbar.errorSnackbar2(json.toString());
    var response = await Request.postData(Urls.UPDATE_SHOP, json, true);
    print(response);
    if (response.statusCode == 200) {
      // final Map<String, dynamic> responseData = json.decode(response.body);
      // var userData = AuthResponseModel.fromJson(response.data);
      return response.data['success'];
      // print(response.data.success);
    } else {
      print(response);
      return null;
    }
    // return false;
  }

  static getDeliveySet() async {
    var response = await Request.getData(Urls.GET_SETTINGS, true);

    print(response);
    if (response.statusCode == 200) {
      return GetDeliverySettings.fromJson(response.data);
    } else {
      return null;
    }
  }

  static updateDelivery(DeliveryModelMain request) async {
    print(request.toJson());
    var response =
        await Request.postData(Urls.UPDATE_SETTINGS, request.toJson(), true);
    if (response.statusCode == 200) {
      // final Map<String, dynamic> responseData = json.decode(response.body);
      // var userData = AuthResponseModel.fromJson(response.data);
      return response.data['success'];

      // print(response.data.success);
    } else {
      print(response);
      return null;
    }
  }
}
