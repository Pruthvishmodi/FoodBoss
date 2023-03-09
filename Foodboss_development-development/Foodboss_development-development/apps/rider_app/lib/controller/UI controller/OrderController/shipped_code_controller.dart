import 'package:get/get.dart';
import 'package:rider_app/infrastructure/OrderCall/shipped_code_call.dart';
import 'package:rider_app/models/order/shipped_code_model.dart';
import 'package:rider_app/utils/states.dart';

class ShippedCodeController extends GetxController {
  // var textEditingController = TextEditingController().obs;

  var _requestStatus = States.INITIAL_STATE.obs;

  bool isSent = false;

  // var _orderId = ''.obs;
  var code = ''.obs;
  // var _type = ''.obs;

  // String get orderId => _or/derId.value;

  // String get type => _type.value;

  Future<void> sendCodeRequest(String orderId, String type) async {
    ShippedCodeModel request =
        ShippedCodeModel(orderId: orderId, code: code.value, type: type);
    print(request.toJson().toString());
    _requestStatus.value = States.LOADING_STATE;
    try {
      isSent = await ShippedCodeCall.sendMyCode(request);
      if (isSent == false) {
        Get.snackbar('Error', 'Something went wrong');
      } else {
        _requestStatus.value = States.SUCCESS_STATE;
        Get.snackbar('Success', 'Accept Request Added');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Opps', 'Something went wrongrrr');
      _requestStatus.value = States.ERROR_STATE;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    // helpCat();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
