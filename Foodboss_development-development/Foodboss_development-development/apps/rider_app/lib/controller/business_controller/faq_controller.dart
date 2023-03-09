import 'package:get/get.dart';
import 'package:rider_app/infrastructure/faq_call.dart';
import 'package:rider_app/models/faq_modal.dart';
import 'package:rider_app/utils/states.dart';

class FaqController extends GetxController {
  var _data = FaqMain().obs;
  var _state = States.INITIAL_STATE.obs;

  FaqMain get data => _data.value;
  String get status => _state.value;

  Future<void> faq() async {
    _state.value = States.LOADING_STATE;
    try {
      FaqMain response = await FaqCall.getFaqs();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something went wrong while loading FAQs');
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          Get.snackbar('Errror', response.message!);
        } else {
          _data.value = response;
          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print('$e error');
      Get.snackbar('Opps', 'Something went wrong');
      _state.value = States.ERROR_STATE;
    }
  }

  @override
  void onInit() {
    print('here');
    faq();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
