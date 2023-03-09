import 'package:customer_app/Models/faq_model.dart';
import 'package:customer_app/Models/network_call_models.dart/faq_call.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/utils/states.dart';
import 'package:get/get.dart';

class FaqController extends GetxController {
  var _data = FaqMain().obs;
  var _state = States.INITIAL_STATE.obs;

  String get status => _state.value;
  FaqMain get data => _data.value;

  Future<void> faq() async {
    _state.value = States.LOADING_STATE;
    try {
      FaqMain response = await FaqCall.getFaqs();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar2(
            'Something went wrong while loading FAQs');
        // Get.snackbar('Error', 'Something went wrong while Loading FAQs');

      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
          // Get.snackbar('Error', 'Something went Wrong');

        } else {
          _data.value = response;
          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print('$e error');
      CustomSnackbar.errorSnackbar2('Something went wrong');
      // Get.snackbar('Error', 'Something went wrong');

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
