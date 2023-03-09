import 'dart:developer';

import 'package:customer_app/Models/network_call_models.dart/get_fav_food_call.dart';
import 'package:customer_app/Models/network_call_models.dart/get_fav_store_call.dart';
import 'package:customer_app/Models/network_call_models.dart/order_history_model.dart';
import 'package:customer_app/Models/network_call_models.dart/product_detail_call.dart';
import 'package:customer_app/utils/requests.dart';
import 'package:customer_app/utils/urls.dart';

class GeneralServices {
  static generateDeliveryCode(json) async {
    print(json);
    var respones = await Request.postData(Urls.GIVERIDERCODE, json, true);
    print(respones);
    if (respones.statusCode == 200) {
      return respones.data['success'];
    } else {
      return null;
    }
  }

  static getFavFood() async {
    var respones = await Request.getData(Urls.GETFAVFOOD, true);

    if (respones.statusCode == 200) {
      return GetFavFoodCall.fromJson(respones.data);
    } else {
      return null;
    }
  }

  static removeFavFood(json) async {
    var respones = await Request.postData(Urls.REMOVEFAVFOOD, json, true);
    print(respones);
    if (respones.statusCode == 200) {
      return respones.data['success'];
    } else {
      return null;
    }
  }

  static addFavFood(json) async {
    var respones = await Request.postData(Urls.ADDFAVFOOD, json, true);

    if (respones.statusCode == 200) {
      return respones.data['success'];
    } else {
      return null;
    }
  }

  static getFavStores() async {
    var respones = await Request.getData(Urls.GETFAVSTORE, true);

    if (respones.statusCode == 200) {
      return GetFavStoreCall.fromJson(respones.data);
    } else {
      return null;
    }
  }

  static addFavStore(json) async {
    var respones = await Request.postData(Urls.ADDFAVSTORE, json, true);

    if (respones.statusCode == 200) {
      return respones.data['success'];
    } else {
      return null;
    }
  }

  static removeFavStore(json) async {
    var respones = await Request.postData(Urls.REMOVEFAVSTORE, json, true);

    if (respones.statusCode == 200) {
      return respones.data['success'];
    } else {
      return null;
    }
  }

  static getProductDetials(int shopId, int productId) async {
    log(Urls.PRODUCTDETAILS(shopId, productId));
    var respones =
        await Request.getData(Urls.PRODUCTDETAILS(shopId, productId), true);

    if (respones.statusCode == 200) {
      return ProductDetailCall.fromJson(respones.data);
    } else {
      return null;
    }
  }

  static getOrderHistory() async {
    var respones = await Request.getData(Urls.ORDERHISTORY, true);

    if (respones.statusCode == 200) {
      return OrderHistoryCall.fromJson(respones.data);
    } else {
      return null;
    }
  }

  // static contactUs()async{
  //   var respones = await Dio().get(Urls.CONTACTUS);
  //   print(respones);
  //   if(respones.statusCode == 200){
  //     return ContactUs.fromJson(respones.data);
  //   }else{
  //     return null;
  //   }
  // }

}
