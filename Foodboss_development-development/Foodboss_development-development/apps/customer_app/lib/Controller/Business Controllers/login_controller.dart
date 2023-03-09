import 'dart:developer';

import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/map_address_controller.dart';
import 'package:customer_app/Models/user_model.dart';
import 'package:customer_app/Services/authentication_services.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/utils/token_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:otp_autofill/otp_autofill.dart';

// import 'package:telephony/telephony.dart';
// backgrounMessageHandler(SmsMessage message) async {
//     //Handle background message
//     print(message.body);
//     print(message);
//     // otp.value = getCode(message.body!);
//   }
class LoginController extends GetxController {
  // final Telephony telephony = Telephony.instance;
  UserController userController = Get.find<UserController>();
  MapAdressController mapAdressController = Get.find<MapAdressController>();

  var mobileNumber = ''.obs;

  onChangeNumber(val) {
    mobileNumber.value = val;
    mobileNumber.refresh();
  }

  onSplashScreen() async {
    try {
      print(await TokenService.getToken());
      if (await TokenService.getToken() != null ||
          await TokenService.getToken() != null) {
        var call = await AuthenticationSerices.splashScreen();
        if (call != null) {
          print(call.data["data"]["phone"]);
          userController.user.value.isLogedin = true;
          userController.user.value.phoneNumber = call.data["data"]["phone"];
          userController.user.value.token = call.data["data"]["token"];
          userController.user.value.name = call.data["data"]["name"];
          userController.user.value.userId = call.data['data']['id'].toString();
          TokenService.setToken(call.data["data"]["token"]);
          userController.user.refresh();
          mapAdressController.getAllAddress();
          // mapAdressController.start();
          // await mapAdressController.getAllAddress();
          // print(mapAdressController.selectedAddress.id);
          await userController.cartController.fetchCart();
          userController.getBanners();
          Get.offNamed('/home');
        }
      } else {
        Get.offNamed('/loginpage');
      }
    } catch (e) {
      Get.offNamed('/loginpage');
    }
  }

  var sign = ''.obs;
  var fcmTokenn = ''.obs;
  late String fcmToken;
  getToken() async {
    fcmToken = (await FirebaseMessaging.instance.getToken())!;
    fcmTokenn.value = fcmToken;
    print('fcm token - $fcmToken');
  }

  onLogin() async {
    try {
      if (GetPlatform.isAndroid) {
        await OTPInteractor().getAppSignature().then((value) {
          sign.value = value!;
          print('signature - $value');
        });
      }
      await getToken();
      var call = await AuthenticationSerices.login(
          mobileNumber.value, fcmTokenn.value, sign.value);

      if (call != null) {
        Get.toNamed('/verify-otp');
        // startOtpListening();
      } else {
        // Get.snackbar('Error', 'Something went wrong');
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      // Get.snackbar('Something went wrong', 'Network Error');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  var otp = ''.obs;

  onChangeOtp(val) {
    otp.value = val;
    otp.refresh();
  }

  getCode(String sms) {
    if (sms != null) {
      final intRegex = RegExp(r'\\d{4}', multiLine: true);
      final code = intRegex.allMatches(sms).first.group(0);
      print(code);
      return code;
    }
    return "NO SMS";
  }

  // startOtpListening() async {
  //   // print('searching');
  //   // String? appSignature = await AndroidSmsRetriever.getAppSignature();
  //   // print(appSignature);
  //   // String? message = await AndroidSmsRetriever.listenForSms();
  //   // print(message);
  //   // otp.value = getCode(message!);
  //   // telephony.listenIncomingSms(
  //   //   listenInBackground: true,
  //   //   onNewMessage: (SmsMessage message) {
  //   //     print(message.body);
  //   //     print(message);
  //   //     otp.value = getCode(message.body!);
  //   //     // Handle message
  //   //   },
  //   //   onBackgroundMessage: backgrounMessageHandler,
  //   // );

  //   // String smsCode = await SmsRetriever.startListening();
  //   // print(smsCode);
  //   // otp.value = getCode(smsCode);

  //     var autofill = SmsAutoFill();
  //    var sign = await autofill.getAppSignature;
  //    print(sign);
  //      await autofill.listenForCode(smsCodeRegexPattern: '\\d{4}');
  //     //  .then((value) async{

  //     //  });
  //   //   await autofill.code;
  //   //      var val =  await autofill.code.first;
  //   //    print( val);
  //   //    otp.value = autofill.code.toString();
  //   print('searched');
  // }

  onVerifyOtp() async {
    try {
      log('here ins on Verify function');
      var call =
          await AuthenticationSerices.verifyOtp(mobileNumber.value, otp.value);

      if (call != null) {
        if (call.data["success"] == true) {
          log(call.data["data"]["phone"]);
          userController.user.value.isLogedin = true;
          userController.user.value.phoneNumber = call.data["data"]["phone"];
          userController.user.value.token = call.data["data"]["api_token"];
          userController.user.value.userId = call.data["data"]["unique_id"];
          TokenService.setToken(call.data["data"]["api_token"]);
          userController.user.refresh();
          await mapAdressController.getAllAddress();
          userController.getBanners();

          if (mapAdressController.allAddress.value.addressess!.isEmpty) {
            // await mapAdressController.getloc();
            // log('here aij ofaie ');
            bool isLocationEnabled = await Location.instance.serviceEnabled();
            if (isLocationEnabled) {
              await mapAdressController.getloc();
              Get.toNamed('/pick-location-screen', arguments: [false, 0]);
            } else {
              Get.defaultDialog(
                  title: "Alert",
                  contentPadding: EdgeInsets.all(0),
                  titlePadding: EdgeInsets.only(top: 20),
                  titleStyle: TextStyle(fontWeight: FontWeight.bold),
                  content: BottomSheetLocation(op: mapAdressController.getloc),
                  barrierDismissible: false);
            }
            // Get.offNamed('/pick-location-screen', arguments: [false, 0]);
          } else {
            Get.offAllNamed('/home');
          }
        } else {
          Get.snackbar("Login Failed", call.data["message"]);
        }
      } else {
        // Get.snackbar('Error', 'Something went wrong');
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      // Get.snackbar('Something went wrong', 'Network Error');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  onLogout() async {
    await TokenService.removeAuth();
    userController.user.value = UserModel();
    Get.offNamed('/loginpage');
  }

  // getPhoneNumber(){

  //   AndroidSmsRetriever.requestPhoneNumber().then((value) => print(value));
  //   // print(phoneNumber);
  // }
  @override
  void onInit() async {
    // await getPhoneNumber();
    // TODO: implement onInit
    super.onInit();
  }
}
