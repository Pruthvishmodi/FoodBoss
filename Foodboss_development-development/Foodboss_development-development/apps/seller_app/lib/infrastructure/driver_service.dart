import 'package:seller_app/models/driver/add_driver_model.dart';
import 'package:seller_app/models/driver/all_driver_model.dart';
import 'package:seller_app/models/driver/my_driver_model.dart';
import 'package:seller_app/models/driver/remove_driver_model.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class DriverService {
  static getMyDriversCall() async {
    var res = await Request.getData(Urls.MYDRIVERS, true);
    print(res.data);
    if (res.statusCode == 200) {
      return MyDriverModel.fromJson(res.data);
    } else {
      print('error');
      return false;
    }
  }

  static Future<AllDriverModel> getAllDriverCall() async {
    var response = await Request.getData(Urls.ALLDRIVERS, true);
    if (response.statusCode == 200) {
      return AllDriverModel.fromJson(response.data);
    } else {
      return AllDriverModel();
    }
  }

  static searchGetAllDriverCall(int val) async {
    var response = await Request.getData(Urls.SEARCHLLDRIVERS(val), true);
    if (response.statusCode == 200) {
      return AllDriverModel.fromJson(response.data);
    } else {
      print('Error');
    }
  }

  static Future<bool> addDriverRequest(AddDriverRequestModel request) async {
    var res = await Request.postData(Urls.ADDDRIVER, request.toJson(), true);
    print(res);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> removeDriverRequest(
      RemoveDriverReqestModel request) async {
    var res = await Request.postData(Urls.REMOVEDRIVER, request.toJson(), true);
    print(res.data["success"]);

    return res.data["success"].toString();
  }
}
