import 'package:get/get.dart';
import 'package:seller_app/models/shop_close_request.dart';
import 'package:seller_app/models/store/catagories.dart';
import 'package:seller_app/models/store/items.dart';
import 'package:seller_app/screens/global_store_screen/modals.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class StoreService {
  static Future<bool> shopClose(ShopCloseRequest request) async {
    var res =
        await Request.postData(Urls.SHOP_STATUS_CHANGE, request.toJson(), true);

    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static fetchMainCat() async {
    var res = await Request.getData(Urls.MAIN_CATAGORY, true);
    print(res.statusCode);
    if (res.statusCode == 200) {
      print(res.data);
      var data = MainCatModel.fromJson(res.data);
      // print(data.data!.data![0].name);
      return data;
    } else {
      print('there');
      return null;
    }
  }

  static fetchSubCat(int id) async {
    // print('id $id');
    var res = await Request.getData(Urls.SUB_CATAGORY(id), true);
    // print(res.statusCode);
    if (res.statusCode == 200) {
      // print(res.data);
      var data = SubCatModel.fromJson(res.data);
      // print(data.data);
      return data;
    } else {
      return null;
    }
  }

  static fetchItems(int id, bool fromCat) async {
    var res = await Request.getData(
        fromCat ? Urls.PRODUCTS(id) : Urls.PRODUCTS_BY_CAT(id), true);
    print(res.data);
    if (res.statusCode == 200) {
      // print(res.data);
      var data = ItemModel.fromJson(res.data);
      print(data);
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
      var data = ItemModel.fromJson(res.data);
      // print(data);
      return data;
    } else {
      return null;
    }
  }
  static fetchItemsBySearch(String name) async {
    var res = await Request.getData(Urls.GET_ALL_FOOD(name), true);
    print(res.data);
    if (res.statusCode == 200) {
      // print(res.data);
      var data = ItemModel.fromJson(res.data);
      // print(data);
      return data;
    } else {
      return null;
    }
  }

  // static fetchSubCat(int id) async {
  //   var res = await Request.getData(Urls.SUB_CATAGORY(id), true);
  //   if (res.statusCode == 200) {
  //     var data = Data.fromJson(res.data, 1);
  //     return data;
  //   } else {
  //     return null;
  //   }
  // }

  static fetchCat(int id) async {
    var res = await Request.getData(Urls.CATAGORY(id), true);
    if (res.statusCode == 200) {
      var data = Catagory.fromJson(res.data);
      return data;
    } else {
      return null;
    }
  }

  static Future<bool> appProducts(SelectedItems selectedItems) async {
    print(selectedItems.litsOfItems);
    var res =
        await Request.postData(Urls.ADD_PRODUCTS, selectedItems.toJson(), true);
    if (res.statusCode == 200) {
      print("data added succesfully");
      return true;
    } else {
      return false;
    }
  }
}
