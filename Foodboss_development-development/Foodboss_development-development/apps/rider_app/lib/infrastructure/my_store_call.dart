import 'package:rider_app/models/my_store_list_model.dart';
import 'package:rider_app/models/my_store_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class MyAvailableStoreCall {
  static getAvailableStore() async {
    var response = await Request.getData(Urls.MYAVAILABLESTORE_URL, true);

    if (response.statusCode == 200) {
      print(response);

      var dashboard = MyAvailableStoreModel.fromJson(response.data);

      return dashboard;
    } else {
      return null;
    }
  }

  static removeStore(int id) async {
    var response =
        await Request.postData(Urls.REMOVESTORE, {"shop_id": id}, true);

    if (response.statusCode == 200) {
      return response.data['success'];
    } else {
      return false;
    }
  }

  static getMyStoreStore() async {
    var response = await Request.getData(Urls.MYSTORE_URL, true);

    if (response.statusCode == 200) {
      print(response);

      var store = MyStoreListModel.fromJson(response.data);

      return store;
    } else {
      return null;
    }
  }
}
