import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:rider_app/controller/business_controller/auth/user_controller.dart';
import 'package:rider_app/infrastructure/auth_call.dart';
import 'package:rider_app/models/register_model.dart';
import 'package:rider_app/ui_logic/login_to_otp.dart';

import '../../../infrastructure/token_service.dart';
import '../../../models/auth/UserModel.dart';
import '../../../models/auth/VerifyTokenModel.dart';
import '../../../models/login_model.dart';
import '../../../models/otp_model.dart';
import '../../../utils/states.dart';

class AuthController extends GetxController {
  var textEditingController = TextEditingController().obs;
  final LoginController controllerAuth =
      Get.put(LoginController(), permanent: false);
  UserController userController = Get.put(UserController(), permanent: true);
  var _state = States.INITIAL_STATE.obs;
  var _phone = ''.obs;
  var _otp_final = ''.obs;
  var _otp1 = ''.obs;
  var _otp2 = ''.obs;
  var _otp3 = ''.obs;
  var _otp4 = ''.obs;
//  RxList<String> _otp = RxList<String>(['','','','']);
  var _email = ''.obs;
  var _name = ''.obs;
  var _reffercode = ''.obs;
  String get login_state => _state.value;
  String get phone => _phone.value;
  String get email => _email.value;
  String get name => _name.value;
  String get reffercode => _reffercode.value;
  String get otp1 => _otp1.value;
  String get otp2 => _otp2.value;
  String get otp3 => _otp3.value;
  String get otp4 => _otp4.value;
  String getOtp(int index) {
    if (index == 1) {
      return otp1;
    }
    if (index == 2) {
      return otp2;
    }
    if (index == 3) {
      return otp3;
    } else {
      return otp4;
    }
  }

  String get finalOttp => _otp1.value + _otp2.value + _otp3.value + _otp4.value;

  String finalOtp() {
    return _otp1.value + _otp2.value + _otp3.value + _otp4.value;
  }

  void changeNumber(String value) {
    _phone.value = value;
  }

  void addOtp(
    String value,
  ) {
    textEditingController.value.text = value;
  }

  void changeEmail(String value) {
    _email.value = value;
  }

  void changeName(String value) {
    _name.value = value;
  }

  void changeReffer(String value) {
    _reffercode.value = value;
  }

  var sign = ''.obs;
  void login() async {
    if (_phone.value.length == 10) {
      _state.value = States.LOADING_STATE;
      try {
        if (GetPlatform.isAndroid) {
          await OTPInteractor().getAppSignature().then((value) {
            sign.value = value!;
            print('signature - $value');
          });
        }
        AuthResponseModel? response = await AuthCall.login(
            LoginRequestModel(phone: _phone.value, signature: sign.value));
        if (response == null) {
          _state.value = States.ERROR_STATE;
          Get.snackbar("Opps", "Something went wrongg");
        } else {
          if (response.success == false) {
            _state.value = States.ERROR_STATE;
            Get.snackbar("Opps", response.message!);
          } else {
            _state.value = States.SUCCESS_STATE;
            controllerAuth.changeType(false);
            AuthCall.setSteps(1);
            Get.offAllNamed("/otpverify",
                arguments: {'phone': _phone.value, 'from_login': true});
          }
        }
        // _state.value = States.SUCCESS_STATE;
      } catch (e) {
        print(e);
        Get.snackbar("Opps", "Something went wrong");
        _state.value = States.ERROR_STATE;
      }
    }
  }

  void resendOtp() async {
    if (_phone.value.length == 10) {
      _state.value = States.LOADING_STATE;
      try {
        AuthResponseModel? response =
            await AuthCall.resendOtp(LoginRequestModel(phone: _phone.value));
        if (response == null) {
          _state.value = States.ERROR_STATE;

          Get.snackbar("Opps", "Something went wrong");
        } else {
          if (response.success == false) {
            _state.value = States.ERROR_STATE;

            Get.snackbar("Opps", response.message!);
          } else {
            _state.value = States.SUCCESS_STATE;
            controllerAuth.changeType(false);
            Get.offAllNamed("/otpverify",
                arguments: {'phone': _phone.value, 'from_login': true});
          }
        }
      } catch (e) {
        print(e);

        Get.snackbar("Opps!", "Something went wrong!");

        _state.value = States.ERROR_STATE;
      }
    }
  }

  void logout() async {
    try {
      await TokenService.removeAuth();
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  void register() async {
    if (_phone.value.length == 10 && _name.value.isEmpty == false) {
      _state.value = States.LOADING_STATE;
      try {
        if (GetPlatform.isAndroid) {
          await OTPInteractor().getAppSignature().then((value) {
            sign.value = value!;
            print('signature - $value');
          });
        }
        AuthResponseModel? response = await AuthCall.register(
          RegisterRequestModel(
              phone: _phone.value,
              email: _email.value,
              name: _name.value,
              referCode: _reffercode.value,
              signature: sign.value),
        );
        if (response == null) {
          _state.value = States.ERROR_STATE;
          Get.snackbar("Opps", "Something went wrong");
        } else {
          if (response.success == false) {
            _state.value = States.ERROR_STATE;
            Get.snackbar("Opps", response.message!);
          } else {
            _state.value = States.SUCCESS_STATE;
            controllerAuth.changeType(true);
            Get.offAllNamed("/otpverify",
                arguments: {'phone': _phone.value, 'from_login': false});
            // _state.value = States.INITIAL_STATE;
          }
        }
      } catch (e) {
        print(e);
        Get.snackbar("Opps!", "Something went wrong!");
        _state.value = States.ERROR_STATE;
      }
    }
  }

  void otpverify() async {
    if (_phone.value.length == 10 && finalOttp.length == 4) {
      _state.value = States.LOADING_STATE;
      try {
        OtpResponseModel? response = await AuthCall.otpverify(
          OtpRequestModel(phone: _phone.value, otp: finalOttp),
        );
        if (response == null) {
          _state.value = States.ERROR_STATE;
          Get.snackbar("Opps", "Something went wrong");
        } else {
          if (response.success == false) {
            _state.value = States.ERROR_STATE;
            Get.snackbar("Opps", response.message!);
          } else {
            await TokenService.setToken(response.otpdata!.apiToken!);
            await TokenService.setUsername(response.otpdata!.name!);
            await TokenService.setEmail(response.otpdata!.email!);
            await TokenService.setPhoneNumber(response.otpdata!.phone!);
            userController.saveUserInfo(User(
                Username: response.otpdata!.name!,
                email: response.otpdata!.email!,
                phoneNumber: response.otpdata!.phone!,
                token: response.otpdata!.apiToken!));

            _state.value = States.SUCCESS_STATE;
            controllerAuth.isFromLogin == true
                ? Get.offAllNamed("/store-registration")
                : Get.offAllNamed("/home");
          }
        }
      } catch (e) {
        print(e);
        Get.snackbar("Opps!", "Something went wrong!");
        _state.value = States.ERROR_STATE;
      }
    }
  }
}

class CheckTokenController extends GetxController {
  UserController userController = Get.put(UserController(), permanent: true);

  var _state = States.INITIAL_STATE.obs;
  void splashFunction() async {
    _state.value = States.LOADING_STATE;
    try {
      Verified? response = await AuthCall.checkToken();
      if (response == null) {
        _state.value = States.ERROR_STATE;
        Get.offAllNamed("/login");
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          Get.offAllNamed("/login");
        } else {
          await TokenService.setToken(response.data!.token!);
          await TokenService.setUsername(response.data!.name!);
          // await TokenService.setEmail(response.data!.email!);
          await TokenService.setPhoneNumber(response.data!.phone!);
          userController.saveUserInfo(User(
              Username: response.data!.name!,
              // email: response.data!.email!,
              phoneNumber: response.data!.phone!,
              token: response.data!.token!));
          _state.value = States.SUCCESS_STATE;
          Get.offAllNamed("/home");
        }
      }
    } catch (e) {
      print(e);
      Get.offAllNamed("/login");
      _state.value = States.ERROR_STATE;
    }
  }

  @override
  void onInit() {
    // print('here');
    splashFunction();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
