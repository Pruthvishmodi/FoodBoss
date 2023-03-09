import 'dart:developer';

import 'package:customer_app/Models/cart_model.dart';
import 'package:customer_app/Models/network_call_models.dart/ongoing_order_call.dart';
import 'package:customer_app/Models/network_call_models.dart/order_detail_call.dart';
import 'package:customer_app/utils/requests.dart';
import 'package:customer_app/utils/urls.dart';

class StoreServices {
  static getProductsCategoryWise(int storeid, int catid) async {
    var response =
        await Request.getData(Urls.GETPRODUCTSTOREWISE(storeid, catid), true);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return false;
    }
  }

  static searchProductFromStore(int storeid, String val) async {
    var response =
        await Request.getData(Urls.SEARCHPRODUCTSFROMSTORE(storeid, val), true);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return false;
    }
  }

  static getProductsCategoryWisePagination(String url) async {
    var response = await Request.getData(url, true);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return false;
    }
  }

  static getStoreCategories(int storeid) async {
    var response =
        await Request.getData(Urls.GETSTORECATEGORIES(storeid), true);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return false;
    }
  }

  static getStoreDetails(int storeid) async {
    var response = await Request.getData(Urls.GETSTOREDETAILS(storeid), true);
    // print(response);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return false;
    }
  }

  static addToCart(var request) async {
    var response = await Request.postData(Urls.ADDTOCART, request, true);
    print(response);
    if (response.statusCode == 200) {
      print(response.data['success']);
      if (response.data['success']) {
        return response.data;
      } else {
        return {
          "success": false,
          "cart_id": null,
        };
      }
    } else {
      return {
        "success": false,
        "cart_id": null,
      };
    }
  }

  // static addToCartNew(var request) async {
  //   var response = await Request.postData(Urls.ADDTOCARTNEW, request, true);
  //   print(response);
  //   if (response.statusCode == 200) {
  //     print(response.data['success']);
  //     if (response.data['success']) {
  //       return response.data;
  //     } else {
  //       return {
  //         "success": false,
  //         "cart_id": null,
  //       };
  //     }
  //   } else {
  //     return {
  //       "success": false,
  //       "cart_id": null,
  //     };
  //   }
  // }

  static removeToCart(int id) async {
    print(id);
    var response =
        await Request.postData(Urls.REMOVEFROMCART, {"id": id}, true);
    if (response.statusCode == 200) {
      print(response.data);
      if (response.data['success']) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static getCartItems() async {
    var response = await Request.getData(Urls.GETCARTITEMS, true);

    log(response.toString());
    if (response.statusCode == 200) {
      return CartModel.fromJson(response.data);
    } else {
      return false;
    }
  }

  static getOngoingOrders() async {
    var response = await Request.getData(Urls.ONGOINGORDERLIST, true);
    if (response.statusCode == 200) {
      return OngoingOrderCall.fromJson(response.data);
    } else {
      return false;
    }
  }

  static Future<GetOrderDetails> getOrderDetails(int orderId) async {
    var response = await Request.getData(Urls.ORDERDETAILS(orderId), true);
    if (response.statusCode == 200) {
      return GetOrderDetails.fromJson(response.data);
    } else {
      return GetOrderDetails();
    }
  }

  static checkoutCartItems(json) async {
    print(json);
    var response = await Request.postData(Urls.CARTCHECKOUT, json, true);
    print(response);
    if (response.statusCode == 200) {
      return response.data['success'];
    } else {
      return false;
    }
  }
}
