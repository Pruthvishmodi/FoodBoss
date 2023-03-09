

import 'package:seller_app/models/khata/set_khata_limit_model.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class SetKhataCall {
  static sendLimitAmount(var request) async {
    var response =
        await Request.postData(Urls.SETKHATAURL, request.toJson(), true);
    print(response);
    if (response.statusCode == 200) { 
      print('data added');
      return true;
    } else {
      return false;
    }
  }

  static quickEditKhata(var request) async {
    var response =
        await Request.postData(Urls.QUICKEDITKHATA, request, true);
    print(response);
    if (response.statusCode == 200) { 
      print('data added');
      return true;
    } else {
      return false;
    }
  }
}
