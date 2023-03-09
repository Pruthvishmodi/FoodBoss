import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:seller_app/infrastructure/auth_call.dart';
import 'package:seller_app/infrastructure/plan_history_call.dart';
import 'package:seller_app/infrastructure/privacy_call.dart';
import 'package:seller_app/infrastructure/video_help_call.dart';
import 'package:seller_app/models/login_model.dart';
import 'package:seller_app/models/plan_history.dart';
import 'package:seller_app/models/privacy_model.dart';
import 'package:seller_app/models/video_help_modal.dart';
import 'package:seller_app/ui_logic/login_to_otp.dart';
import 'package:seller_app/utils/states.dart';
// import 'package:xml/xml.dart' as xml;

class PlanHistoryController extends GetxController {
  var _data = PlanHistoryModel().obs;
  var _state = States.INITIAL_STATE.obs;

  String get status => _state.value;

  PlanHistoryModel get data => _data.value;

  Future<void> getPlanHistoryList() async {
    print('called');
    _state.value = States.LOADING_STATE;
    try {
      PlanHistoryModel response = await PlanHistoryCall.getPlanHistroy();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        // Get.snackbar('Error', 'Something went wrong Plan history');
      } else {
        // var raw = xml.parse(response.data!.privacyText!);
        // var priivcy = raw.findAllElements('#text');
        // print(priivcy);

        _data.value = response;
        _state.value = States.SUCCESS_STATE;
        print(response);
      }
    } catch (e) {
      print(e);
      // Get.snackbar("Opps", "D");
      _state.value = States.ERROR_STATE;
    }
  }

  @override
  void onInit() {
    getPlanHistoryList();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
