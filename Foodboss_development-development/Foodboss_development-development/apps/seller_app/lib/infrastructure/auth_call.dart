import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seller_app/infrastructure/token_service.dart';
import 'package:seller_app/models/auth/ProfileModel.dart';
import 'package:seller_app/models/auth/VerifyTokenModel.dart';
import 'package:seller_app/models/login_model.dart';
import 'package:seller_app/models/otp_model.dart';
import 'package:seller_app/models/register_model.dart';
import 'package:seller_app/utils/local_storage.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

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
    // print("userData");
    var response = await Request.getData(Urls.CHECK_USER_URL, true);
    if (response == null) {
      return null;
    } else {
      // print(response.data);
      if (response.statusCode == 200) {
        var userData = Verified.fromJson(response.data);
        print("userData called");
        // print(response.data);
        // var userData = Verified();
        return userData;
      } else {
        print("userData also called");
        return null;
      }
    }
  }

  static getProfile() async {
    var response = await Request.getData(Urls.GET_PROFILE_URL, true);
    if (response.statusCode == 200) {
      var userData = ProfileModel.fromJson(response.data);
      print(userData);
      return userData;
    } else {
      return ProfileModel();
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

  static setPaymentQrCode(String qr)async {
    var res = await Request.postData(Urls.UPDATE_QR_CODE, {"qr_number": qr}, true);

    if(res.statusCode ==200){
      print(res.data['success']);
      return res.data['success'];
    }
  }

  static setIntro(bool step) async {
    if (step == true) {
      await LocalStorageOperations.setItem("intro", 1.toString());
      print("object called");
    } else if (step == false) {
      await LocalStorageOperations.setItem("intro", 0.toString());
    }
  }

  static Future<bool> getIntro() async {
    var isIntro = await LocalStorageOperations.getItem("intro");
    if (isIntro != null) {
      if (isIntro == "1") {
        return false;
      } else {
        print("here");
        return true;
      }
    } else {
      print("here null");
      return true;
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
