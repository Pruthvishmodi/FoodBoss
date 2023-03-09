import 'dart:developer';

import 'package:seller_app/models/store/my_food_detail_model.dart';
import 'package:seller_app/models/store/mystore_cat.dart';
import 'package:seller_app/models/store/mystore_item.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class MyStoreServices {
  static getCatagories() async {
    var response = await Request.getData(Urls.MYSTORE_CAT, true);
    print(response);
    if (response.statusCode == 200) {
      var data = response.data;
      if (data['success'] != null) {
        var catData = MyStoreCat.fromJson(response.data);
        print(data);
        return catData;
        // return true;
      } else {
        return null;
      }
      // print(response.data);
    } else {
      return null;
    }
  }

  static getMyStoreItems(int id) async {
    // return null;
    var response = await Request.getData(Urls.MYSTORE_CAT_ITEM(id), true);
    if (response.statusCode == 200) {
      var data = response.data;
      if (data['success'] != null) {
        // var catData = MyStoreCat.fromJson(response.data);
        // return catData;

        var itemData = MyStoreItems.fromJson(response.data);
        // print(response.data);
        return itemData;
        // return true;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static searchItemsByCat(String id, String name) async {
    var res = await Request.getData(Urls.GET_STORE_SEARCH(id, name), true);
    print(res);
    if (res.statusCode == 200) {
      // print(res.data);
      var data = MyStoreItems.fromJson(res.data);
      // print(data);
      return data;
    } else {
      return null;
    }
  }

  static fetchItemsByPage(String url) async {
    var res = await Request.getData(url, true);
    // print(res.data);
    if (res.statusCode == 200) {
      // print(res.data);
      var data = MyStoreItems.fromJson(res.data);
      // print(data);
      return data;
    } else {
      return null;
    }
  }

  static getMyStoreDetails(String id) async {
    var res = await Request.getData(Urls.PRODUCT_DETAILS(id), true);
    if (res.statusCode == 200) {
      print(res.data);
      var data = MyStoreItemDetails.fromJson(res.data);
      return data;
    } else {
      return null;
    }
  }

  static updateFood(MyStoreItemDetails request) async {
    print(request.data!.toJson());
    var res =
        await Request.postData(Urls.UPDATE_FOOD, request.data!.toJson(), true);
    print(res);
    if (res.statusCode == 200) {
      var data = res.data;
      if (data['success'] == true) {
        return true;
      } else {
        return false;
      }

      // print(data['success']);
      // return true;
    } else {
      return false;
    }
  }
}
