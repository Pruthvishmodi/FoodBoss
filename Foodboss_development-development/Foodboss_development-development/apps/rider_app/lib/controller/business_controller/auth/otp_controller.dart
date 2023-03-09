import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/business_controller/auth/user_controller.dart';
import 'package:rider_app/infrastructure/auth_call.dart';
import 'package:rider_app/infrastructure/token_service.dart';
import 'package:rider_app/models/auth/UserModel.dart';
import 'package:rider_app/models/auth/VerifyTokenModel.dart';
import 'package:rider_app/models/login_model.dart';
import 'package:rider_app/models/otp_model.dart';
import 'package:rider_app/models/register_model.dart';
import 'package:rider_app/ui_logic/login_to_otp.dart';
import 'package:rider_app/utils/states.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:rider_app/widgets/authlayout/authlayout.dart';
import 'package:rider_app/widgets/custom_snackbar.dart';

class OtpController extends GetxController {
  var textEditingController = TextEditingController().obs;
  late OTPTextEditController controller;

  UserController userController = Get.put(UserController(), permanent: true);
  var _fromLogin = false.obs;
  var _state = States.INITIAL_STATE.obs;
  var _phone = ''.obs;
  var _otp_final = ''.obs;

  String get login_state => _state.value;
  String get phone => _phone.value;
  // List<String> get otp => _otp.value;

  String get finalOttp => _otp_final.value;

  void addOtp(
    String value,
  ) {
    _otp_final.value = value;
    textEditingController.value.text = value;
  }

  void changeOtp(String value) {
    _otp_final.value = value;
  }

  void otpverify() async {
    if (_phone.value.length == 10 &&
        textEditingController.value.text.length == 4) {
      _state.value = States.LOADING_STATE;
      try {
        OtpResponseModel? response = await AuthCall.otpverify(
          OtpRequestModel(
              phone: _phone.value, otp: textEditingController.value.text),
        );
        if (response == null) {
          _state.value = States.ERROR_STATE;
          Get.snackbar('Error', 'Something went wrong');
        } else {
          if (response.success == false) {
            _state.value = States.ERROR_STATE;
            Get.snackbar('Error', 'Something went wrong');
          } else {
            await TokenService.setToken(
                response.otpdata != null ? response.otpdata!.apiToken! : "");
            await TokenService.setUsername(response.otpdata!.name!);
            await TokenService.setPhoneNumber(response.otpdata!.phone!);
            userController.saveUserInfo(User(
                Username: response.otpdata!.name!,
                email: response.otpdata!.email ?? 'Not Provided',
                phoneNumber: response.otpdata!.phone!,
                token: response.otpdata!.apiToken!));

            _state.value = States.SUCCESS_STATE;
            if (_fromLogin.value == false) {
              await AuthCall.setSteps(1);
              Get.offAllNamed("/store-registration");
            } else {
              var stepForUser = await AuthCall.getSteps();
              if (stepForUser == 1) {
                Get.offAllNamed("/home");
              } else if (stepForUser == 2) {
                Get.offAllNamed("/delivery-schedule");
              } else {
                Get.offAllNamed("/home");
              }
            }
          }
        }
      } catch (e) {
        print(e);
        Get.snackbar('Error', 'Something went wrong');

        _state.value = States.ERROR_STATE;
      }
    }
  }

  @override
  void onInit() {
    _phone.value = Get.arguments['phone'];
    _fromLogin.value = Get.arguments['from_login'];

    OTPInteractor()
        .getAppSignature()
        .then((value) => print('signature - $value'));
    controller = OTPTextEditController(
      codeLength: 4,
      onCodeReceive: (code) {
        int index = 0;
        print('Your Application receive code - $code');
        addOtp(code);
      },
    )..startListenRetriever(
        (code) {
          final exp = RegExp(r'(\d{4})');
          return exp.stringMatch(code ?? '') ?? '';
        },
      );
    // print('here');
    // splashFunction();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
