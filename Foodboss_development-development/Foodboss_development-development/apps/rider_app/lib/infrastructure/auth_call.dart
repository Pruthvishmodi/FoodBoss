import 'dart:convert';

import 'package:rider_app/controller/business_controller/profile_controller.dart';
import 'package:rider_app/infrastructure/token_service.dart';
import 'package:rider_app/models/auth/ProfileModel.dart';
import 'package:rider_app/models/auth/VerifyTokenModel.dart';
import 'package:rider_app/models/login_model.dart';
import 'package:rider_app/models/otp_model.dart';
import 'package:rider_app/models/profile_model.dart';
import 'package:rider_app/models/register_model.dart';
import 'package:rider_app/utils/local_storage.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class AuthCall {
  static login(LoginRequestModel request) async {
    print(request.toJson());
    var response =
        await Request.postData(Urls.LOGIN_URL, request.toJson(), false);

    if (response.statusCode == 200) {
      // final Map<String, dynamic> responseData = json.decode(response.body);
      var userData = AuthResponseModel.fromJson(response.data);
      return userData;
    } else {
      return null;
    }
  }
  static resendOtp(LoginRequestModel request) async {
    print(request.toJson());
    var response =
        await Request.postData(Urls.RESEND_OTP_URL, request.toJson(), false);

    if (response.statusCode == 200) {
      // final Map<String, dynamic> responseData = json.decode(response.body);
      var userData = AuthResponseModel.fromJson(response.data);
      return userData;
    } else {
      return null;
    }
  }

  static register(RegisterRequestModel request) async {
    var response =
        await Request.postData(Urls.REGISTRATION_URL, request.toJson(), false);
    if (response.statusCode == 200) {
      // final Map<String, dynamic> responseData = json.decode(response.data);
      var userData = AuthResponseModel.fromJson(response.data);
      return userData;
    } else {
      return null;
    }
  }

  static otpverify(OtpRequestModel request) async { 
    var response =
        await Request.postData(Urls.OTP_URL, request.toJson(), false);
    if (response.statusCode == 200) {
      var userData = OtpResponseModel.fromJson(response.data);
      return userData;
    } else {
      return null;
    }
  }

  static checkToken() async {
    var response = await Request.getData(Urls.SPLASH_SCREEN, true);
  // print(response);
    if (response.statusCode == 200) {
      var userData = Verified.fromJson(response.data);
      print(userData);
      return userData;
    } else {
      return null;
    }
  }

  static getProfile() async {
    var response = await Request.getData(Urls.GET_PROFILE_URL, true);
    if (response.statusCode == 200) {
      var userData = GetProfileModel.fromJson(response.data);
      print(userData);
      return userData;
    } else {
      return null;
    }
  }

  static setSteps(int step) async {
    var token = await TokenService.getToken();
    if (token != null) {
      Map<String, int> stepByUser = {token: step};
      String json = const JsonEncoder().convert(stepByUser);
      print(json);
      await LocalStorageOperations.setItem("steps", json);
    }
  }

  static Future<int> getSteps() async {
    var token = await TokenService.getToken();
    var steps = await LocalStorageOperations.getItem("steps");
    print(steps);
    if (steps != null) {
      Map<String, dynamic> stepByUser = const JsonDecoder().convert(steps);
      if (stepByUser[token] != null) {
        return stepByUser[token]!;
      } else {
        return 5;
      }
    } else {
      return 5;
    }
  }

  static Future<void> setLocation(double let,double long) async {
      await LocalStorageOperations.setItem("lettitude", let.toString()); 
      await LocalStorageOperations.setItem("longitude", long.toString()); 
  }

  static Future<List<double>> getLocation() async {
      String let = await LocalStorageOperations.getItem("lettitude"); 
      String long = await LocalStorageOperations.getItem("longitude");
      return [double.parse(let),double.parse(long)]; 
  }
 
}
