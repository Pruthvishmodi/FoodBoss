import 'package:rider_app/models/store/qr.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class QrCall {
  static getQr(int id) async {
    var response = await Request.getData(Urls.OR_URL(id), true);
    print(response);
    if (response.statusCode == 200) {
      var qr = QrModel.fromJson(response.data);
      print(qr);
      return qr;
    } else {
      return null;
    }
  }
}
