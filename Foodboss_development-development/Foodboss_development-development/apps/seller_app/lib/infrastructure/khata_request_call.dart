import 'package:seller_app/models/get_my_users_khata_list_model.dart';
import 'package:seller_app/models/khata/khata_user_detail_model.dart';
import 'package:seller_app/models/khata_request_model.dart';
import 'package:seller_app/models/plan_history.dart';

import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class KhataRequestCall {
  static getKhatalist() async {
    var response = await Request.getData(Urls.KHATA_REQUEST_URL, true);
    
    if (response.statusCode == 200) {
     
      var khataRequest = KhataRequestModel.fromJson(response.data);
      print(response.data);
      return khataRequest;
    } else {
      return null;
    }
  }

  static getMyKhatalist() async {
    var response = await Request.getData(Urls.GETMYKHATAS, true);
    
    if (response.statusCode == 200) {
     
      print(response.data);
      var khatalist = GetMyUserKhata.fromJson(response.data);
      return khatalist;
    } else {
      return null;
    }
  }

  static getKhataUserDetails(int userId) async {
    var response = await Request.getData(Urls.GETKHATAUSERDETAILS(userId), true);
    
    if (response.statusCode == 200) {
     
      print(response.data);
      var userKhatadetails = KhataUserDetailModel.fromJson(response.data);
      return userKhatadetails;
    } else {
      return null;
    }
  }
}
