import 'package:get/get.dart';

import 'package:seller_app/infrastructure/dashboard_call.dart';

import 'package:seller_app/models/dashboard_model.dart';

import 'package:seller_app/utils/states.dart';

class DashboardController extends GetxController {
  var _data = DashboardModel().obs;
  var _state = States.INITIAL_STATE.obs;

  String get status => _state.value;

  DashboardModel get data => _data.value;

  Future<void> getDarshboardScreen() async {
    print('called');
    _state.value = States.LOADING_STATE;
    try {
      DashboardModel response = await DashboardCall.getDashboard();
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
    getDarshboardScreen();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
