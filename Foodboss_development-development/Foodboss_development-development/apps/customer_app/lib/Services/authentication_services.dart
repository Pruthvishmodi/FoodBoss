import 'package:customer_app/utils/requests.dart';
import 'package:customer_app/utils/urls.dart';

class AuthenticationSerices {
  static login(String number, String fcmToken, String signature) async {
    var response = await Request.postData(Urls.LOGIN,
        {"phone": number, "fcmToken": fcmToken, "signature": signature}, false);

    print(response);
    if (response.statusCode == 200) {
      return response;
    } else {
      return false;
    }
  }

  static verifyOtp(String number, String code) async {
    var response = await Request.postData(
        Urls.VERIFYOTP, {"otp": code, "phone": number}, false);

    print(response);
    if (response.statusCode == 200) {
      return response;
    } else {
      return false;
    }
  }

  static splashScreen() async {
    var response = await Request.getData(Urls.SPLASHSCREEN, true);

    print(response);
    if (response.statusCode == 200) {
      return response;
    } else {
      return false;
    }
  }

  static getBanners() async {
    var response = await Request.getData(Urls.BANNERS, true);

    print(response);
    if (response.statusCode == 200) {
      return response;
    } else {
      return false;
    }
  }
}
