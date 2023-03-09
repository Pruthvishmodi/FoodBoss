import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:seller_app/controller/business_controller/auth/user_controller.dart';
import 'package:seller_app/infrastructure/auth_call.dart';
import 'package:seller_app/infrastructure/token_service.dart';
import 'package:seller_app/models/auth/UserModel.dart';
import 'package:seller_app/models/auth/VerifyTokenModel.dart';
import 'package:seller_app/models/login_model.dart';
import 'package:seller_app/models/otp_model.dart';
import 'package:seller_app/models/register_model.dart';
import 'package:seller_app/ui_logic/login_to_otp.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';

class AuthController extends GetxController {
  var isFocus = false.obs;

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
  // List<String> get otp => _otp.value;
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

  void changeNumber(String value, BuildContext context) {
    _phone.value = value;
    // print(_phone.value.length);
    if (_phone.value.length == 10) {
      FocusScope.of(context).unfocus();
      isFocus.value = false;
    }
  }

  void addOtp(
    String value,
  ) {
    textEditingController.value.text = value;
    // switch (type) {
    //   case 1:
    //     _otp1.value = value;
    //     break;

    //   case 2:
    //     _otp2.value = value;
    //     break;

    //   case 3:
    //     _otp3.value = value;
    //     break;

    //   case 4:
    //     _otp4.value = value;
    //     break;
    // }

    // print(' hello $finalOttp');
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
  var fcmTokenn = ''.obs;

  late String fcmToken;
  getToken() async {
    fcmToken = (await FirebaseMessaging.instance.getToken())!;
    fcmTokenn.value = fcmToken;
    print('fcm token - $fcmToken');
  }

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
        await getToken();
        AuthResponseModel? response = await AuthCall.login(LoginRequestModel(
            phone: _phone.value,
            signature: sign.value,
            fcmToken: fcmTokenn.value));
        if (response == null) {
          _state.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar2("Opps! Something went wrong");
        } else {
          if (response.success == false) {
            _state.value = States.ERROR_STATE;
            CustomSnackbar.errorSnackbar2('Opps');
          } else {
            _state.value = States.SUCCESS_STATE;
            controllerAuth.changeType(false);
            Get.toNamed("/otpverify",
                arguments: {'phone': _phone.value, 'from_login': true});
          }
        }
        // _state.value = States.SUCCESS_STATE;
      } catch (e) {
        print(e);
        CustomSnackbar.errorSnackbar();
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
          CustomSnackbar.errorSnackbar2("Opps! Something went wrong");
        } else {
          if (response.success == false) {
            _state.value = States.ERROR_STATE;
            CustomSnackbar.errorSnackbar2('Opps');
          } else {
            _state.value = States.SUCCESS_STATE;
            controllerAuth.changeType(false);
            Get.toNamed("/otpverify",
                arguments: {'phone': _phone.value, 'from_login': true});
          }
        }
        // _state.value = States.SUCCESS_STATE;
      } catch (e) {
        print(e);
        CustomSnackbar.errorSnackbar();
        _state.value = States.ERROR_STATE;
      }
    }
  }

  void logout() async {
    try {
      await TokenService.removeAuth();
      Get.offAllNamed('/login');
    } catch (e) {
      CustomSnackbar.errorSnackbar();
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
        await getToken();
        AuthResponseModel? response = await AuthCall.register(
          RegisterRequestModel(
              phone: _phone.value,
              email: _email.value,
              name: _name.value,
              referCode: _reffercode.value,
              fcmToken: fcmTokenn.value,
              signature: sign.value),
        );
        if (response == null) {
          _state.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
        } else {
          if (response.success == false) {
            _state.value = States.ERROR_STATE;
            CustomSnackbar.errorSnackbar();
          } else {
            _state.value = States.SUCCESS_STATE;

            Get.toNamed("/otpverify",
                arguments: {'phone': _phone.value, 'from_login': false});
            // _state.value = States.INITIAL_STATE;
          }
        }
      } catch (e) {
        print(e);
        CustomSnackbar.errorSnackbar2('User already registered');
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
          CustomSnackbar.errorSnackbar();
        } else {
          if (response.success == false) {
            _state.value = States.ERROR_STATE;
            CustomSnackbar.errorSnackbar();
          } else {
            print('here');
            print('object');
            await TokenService.setToken(response.otpdata!.apiToken!);
            await TokenService.setUsername(response.otpdata!.name!);
            await TokenService.setPhoneNumber(response.otpdata!.phone!);
            userController.saveUserInfo(User(
                Username: response.otpdata!.name!,
                email: response.otpdata!.email ?? 'Not Provided',
                phoneNumber: response.otpdata!.phone!,
                token: response.otpdata!.apiToken!));
            controllerAuth.changeType(true);
            _state.value = States.SUCCESS_STATE;
            controllerAuth.isFromLogin == true
                ? Get.offAllNamed("/store-registration")
                : Get.offAllNamed("/home");
          }
        }
      } catch (e) {
        print(e);
        CustomSnackbar.errorSnackbar();
        _state.value = States.ERROR_STATE;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class CheckTokenController extends GetxController {
  UserController userController = Get.put(UserController(), permanent: true);

  var _state = States.INITIAL_STATE.obs;
  void splashFunction() async {
    _state.value = States.LOADING_STATE;

    try {
      var token = TokenService.getToken();
      bool isIntro = await AuthCall.getIntro();
      // bool isIntro = false;
      if (token != null) {
        print("object called");
        Verified? response = await AuthCall.checkToken();
        // Verified response = Verified();
        if (response == null) {
          _state.value = States.ERROR_STATE;
          Future.delayed(
            const Duration(milliseconds: 300),
            () {
              isIntro ? Get.offAllNamed("/intro") : Get.offAllNamed("/login");
            },
          );
          // isIntro ? Get.offAllNamed("/intro") : Get.offAllNamed("/login");
        } else {
          if (response.success == false) {
            _state.value = States.ERROR_STATE;
            Future.delayed(
              const Duration(milliseconds: 300),
              () {
                isIntro ? Get.offAllNamed("/intro") : Get.offAllNamed("/login");
              },
            );
            // isIntro ? Get.offAllNamed("/intro") : Get.offAllNamed("/login");
          } else {
            await TokenService.setToken(response.data![0].apiToken!);
            await TokenService.setUsername(response.data![0].name!);
            // await TokenService.setEmail(response.data![0].email!);
            await TokenService.setPhoneNumber(response.data![0].phone!);
            userController.saveUserInfo(User(
                Username: response.data![0].name!,
                email: response.data![0].email ?? 'Not Provided',
                phoneNumber: response.data![0].phone!,
                token: response.data![0].apiToken!));
            _state.value = States.SUCCESS_STATE;
            int step = await AuthCall.getSteps();
            // if (step == 1) {
            //   Get.offAllNamed("/store-registration");
            // } else if (step == 2) {
            //   Get.offAllNamed("/home");
            // } else if (step == 3) {
            //   Get.offAllNamed("/home");
            // } else {
            //   Get.offAllNamed("/home");
            // }
            print(step);
            if (step == 1) {
              Get.offAllNamed("/store-registration");
            } else if (step == 2) {
              Get.offAllNamed("/delivery-schedule");
            } else {
              Get.offAllNamed("/home");
            }
          }
        }
      } else {
        print("object");
        Future.delayed(
          const Duration(milliseconds: 300),
          () {
            isIntro ? Get.offAllNamed("/intro") : Get.offAllNamed("/login");
          },
        );
      }
    } catch (e) {
      print('thrown $e');
      Get.offAllNamed("/login");
      _state.value = States.ERROR_STATE;
    }
  }

  @override
  void onInit() {
    // print('here');
    // Future.delayed(
    splashFunction();
    // )
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
