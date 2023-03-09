import 'package:get/get.dart';
import 'package:seller_app/infrastructure/auth_call.dart';
import 'package:seller_app/infrastructure/store_service.dart';
import 'package:seller_app/models/auth/ProfileModel.dart';
import 'package:seller_app/models/shop_close_request.dart';
import 'package:seller_app/screens/profile_screen/profile_screen.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';

class ProfileController extends GetxController {
  QrCodeSectionController qrCodeSectionController =
      Get.put(QrCodeSectionController(), permanent: false);
  var profile = ProfileModel().obs;
  var storeStatus = false.obs;

  Profile get getUser => profile.value.data!.first;

  void saveUserInfo(ProfileModel u) {
    print('user data is set');
    profile.value = u;
  }

  var _state = States.LOADING_STATE.obs;
  get status => _state.value;
  getProfile() async {
    _state.value = States.LOADING_STATE;
    try {
      ProfileModel? response = await AuthCall.getProfile();

      print(response);

      if (response == null) {
        _state.value = States.ERROR_STATE;
        // Get.snackbar('Error', 'Something went wrong');
        print('error');
      } else {
        profile.value = response;
        print('shop status ${profile.value.data!.first.isShopClose!}');
        storeStatus.value = profile.value.data!.first.isShopClose!;
        qrCodeSectionController.qrString.value =
            profile.value.data!.first.qrNumber!;
        _state.value = States.SUCCESS_STATE;
        print(getUser.image);
      }
    } catch (e) {
      print('exception $e');
      _state.value = States.ERROR_STATE;
      // Get.snackbar('Errorr', 'Something went wrong');
      print('dio');
    }
  }

  Future<bool> updateQr(String qr) async {
    var response = await AuthCall.setPaymentQrCode(qr);
    if (response == true) {
      return true;
    } else {
      return false;
    }
  }

  toggleShopStatus(ShopCloseRequest request) async {
    try {
      var res = await StoreService.shopClose(request);
      if (res) {
        storeStatus.value = !storeStatus.value;
        // Get.snackbar('Success', 'changed');
      } else {
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
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
