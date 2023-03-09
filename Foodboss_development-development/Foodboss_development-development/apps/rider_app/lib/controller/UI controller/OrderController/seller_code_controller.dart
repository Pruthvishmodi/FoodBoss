import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rider_app/infrastructure/OrderCall/payment_code_call.dart';
import 'package:rider_app/models/order/seller_pay_code.dart';
import 'package:rider_app/utils/states.dart';

class SellerPayCodeController extends GetxController {
  var textEditingController = TextEditingController().obs;

  var _requestStatus = States.INITIAL_STATE.obs;

  bool isSent = false;

  // var _shopId = ''.obs;
  var code = ''.obs;
  // var _type = ''.obs;

  // String get shopId => _shopId.value;

  // String get type => _type.value;

  Future<void> sendCodeRequest(String shopId) async {
    SellerPayCodeModel request =
        SellerPayCodeModel(shopId: shopId, code: code.value);
    print(request.toJson().toString());
    _requestStatus.value = States.LOADING_STATE;
    try {
      isSent = await PaymnetCodeCall.sendMyCode(request);
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
