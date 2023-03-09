import 'package:get/get.dart';
import 'package:rider_app/infrastructure/profile_service.dart';
import 'package:rider_app/models/profile_model.dart';
import 'package:rider_app/utils/states.dart';

class GetProfileController extends GetxController {
  var data = GetProfileModel().obs;
  var profileStatus = States.INITIAL_STATE.obs;

  getProfile() async {
    profileStatus.value = States.LOADING_STATE;

    try {
      var res = await ProfileService.getProfile();
      print('aaa $res');
      if (res != null) {
        profileStatus.value = States.SUCCESS_STATE;
        data.value = res;
      } else {
        profileStatus.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Data is null');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Something went wrong');
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
