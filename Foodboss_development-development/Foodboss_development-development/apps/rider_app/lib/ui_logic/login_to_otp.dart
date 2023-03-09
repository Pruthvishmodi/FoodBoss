import 'package:get/get.dart';

class LoginController extends GetxController {
  var isFromLogin = false.obs;

  void changeType(bool index) {
    isFromLogin.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
