import 'package:get/get.dart';
import 'package:seller_app/infrastructure/faq_call.dart';
import 'package:seller_app/models/faq_modal.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';

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
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
        } else {
          _data.value = response;
          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print('$e error');
      CustomSnackbar.errorSnackbar2('Something went wrong');
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
