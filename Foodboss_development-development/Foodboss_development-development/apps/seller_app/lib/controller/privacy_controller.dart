import 'package:get/get.dart';
import 'package:seller_app/infrastructure/privacy_call.dart';
import 'package:seller_app/models/privacy_model.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
// import 'package:xml/xml.dart' as xml;

class PrivacyController extends GetxController {
  var _data = Privacy().obs;
  var _state = States.INITIAL_STATE.obs;

  String get status => _state.value;

  Privacy get data => _data.value;

  Future<void> getPrivacySettings() async {
    _state.value = States.LOADING_STATE;
    try {
      Privacy response = await PrivacyCall.getPrivacy();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar2(
            'Something went wrong while loading pricacy policy');
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
        } else {
          // var raw = xml.parse(response.data!.privacyText!);
          // var priivcy = raw.findAllElements('#text');
          // print(priivcy);

          _data.value = response;
          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar2("Something went wrong");
      _state.value = States.ERROR_STATE;
    }
  }

  @override
  void onInit() {
    getPrivacySettings();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
