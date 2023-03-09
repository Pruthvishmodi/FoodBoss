import 'package:rider_app/models/store_delivery/delivry_module.dart';
import 'package:rider_app/models/store_delivery/get_delivery_settings.dart';
import 'package:rider_app/models/store_delivery/store_registration.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class AddShopServices {
  // static addShop(StoreregistrationModel request) async {
  //   var json = await request.toJson();
  //   var response = await Request.postData(Urls.UPDATE_SHOP, json, true);
  //   print(response);
  //   if (response.statusCode == 200) {
  //     // final Map<String, dynamic> responseData = json.decode(response.body);
  //     // var userData = AuthResponseModel.fromJson(response.data);
  //     return response.data['success'];
  //     // print(response.data.success);
  //   } else {
  //     print(response);
  //     return null;
  //   }
  // }

  static getDeliveySet()async{
    var response = await Request.getData(Urls.GET_SETTINGS, true);

    print(response);
    if(response.statusCode == 200){
      return GetDeliverySettings.fromJson(response.data);
    }else{
      return null; 
    }
  }

  static updateDelivery(DeliveryModelMain request) async {
    print(request.toJson());
    var response =
        await Request.postData(Urls.UPDATE_SETTINGS, request.toJson(), true);
        print(response.data);
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
