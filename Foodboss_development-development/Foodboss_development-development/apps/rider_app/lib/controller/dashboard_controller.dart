import 'package:get/get.dart';
import 'package:rider_app/infrastructure/dashboard_call.dart';
import 'package:rider_app/models/dashboard_model.dart';
import 'package:rider_app/utils/states.dart';
// import 'package:xml/xml.dart' as xml;

class DashboardController extends GetxController {
  var _data = DashboardModel().obs;
  var _state = States.INITIAL_STATE.obs;

  String get status => _state.value;

  DashboardModel get data => _data.value;

  Future<void> getDashBoardData() async {
    _state.value = States.LOADING_STATE;
    try {
      DashboardModel response = await DashboardCall.getDashboard();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something went wrong while loading videos');
      } else {
        // var raw = xml.parse(response.data!.privacyText!);
        // var priivcy = raw.findAllElements('#text');
        // print(priivcy);

        _data.value = response;
        _state.value = States.SUCCESS_STATE;
      }
    } catch (e) {
      print(e);
      Get.snackbar("Opps", "Something went wrong");
      _state.value = States.ERROR_STATE;
    }
  }

  @override
  void onInit() {
    getDashBoardData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
