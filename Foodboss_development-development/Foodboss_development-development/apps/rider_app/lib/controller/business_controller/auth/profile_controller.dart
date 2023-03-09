import 'package:get/get.dart';
import 'package:rider_app/infrastructure/auth_call.dart';
import 'package:rider_app/models/profile_model.dart';
import 'package:rider_app/utils/states.dart';

class ProfileController extends GetxController {
  var profile = GetProfileModel().obs;

  GetProfileModel get getUser => profile.value;

  void saveUserInfo(GetProfileModel u) {
    print('user data is set');
    profile.value = u;
  }

  var _state = States.INITIAL_STATE.obs;

  getProfile() async {
    try {
      var response = AuthCall.getProfile();

      print(response);

      if (response == null) {
        _state.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something went wrong');
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          Get.snackbar('Errorr', response.message!);
        } else {
          profile.value = response;

          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      Get.snackbar('Errorr', 'Something went wrong');
    }
  }

  @override
  void onInit() {
    getProfile();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
