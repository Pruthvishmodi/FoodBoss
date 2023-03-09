import 'package:get/get.dart';
import 'package:rider_app/infrastructure/my_store_call.dart';
import 'package:rider_app/infrastructure/request_store_call.dart';
import 'package:rider_app/models/my_store_list_model.dart';
import 'package:rider_app/models/my_store_model.dart';
import 'package:rider_app/models/request_store_model.dart';
import 'package:rider_app/utils/states.dart';
// import 'package:xml/xml.dart' as xml;

class MyStoreController extends GetxController {
  var _data = MyAvailableStoreModel().obs;
  var _state = States.INITIAL_STATE.obs;

  String get status => _state.value;

  MyAvailableStoreModel get data => _data.value;

  Future<void> getAvailableStoreList() async {
    _state.value = States.LOADING_STATE;
    try {
      MyAvailableStoreModel response =
          await MyAvailableStoreCall.getAvailableStore();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something went wrong while available store');
      } else {
        _data.value = response;
        _state.value = States.SUCCESS_STATE;
      }
    } catch (e) {
      print(e);
      Get.snackbar("Opps", "Something went wrong");
      _state.value = States.ERROR_STATE;
    }
  }

  var _myStoreData = MyStoreListModel().obs;
  var _myStoreState = States.INITIAL_STATE.obs;

  String get myStoreStatus => _myStoreState.value;

  MyStoreListModel get myStoreData => _myStoreData.value;

  Future<void> getMyStoreList() async {
    _myStoreState.value = States.LOADING_STATE;
    try {
      MyStoreListModel response = await MyAvailableStoreCall.getMyStoreStore();
      print(response);
      if (response == null) {
        _myStoreState.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something went wrong while loading my Store');
      } else {
        _myStoreData.value = response;
        _myStoreState.value = States.SUCCESS_STATE;
      }
    } catch (e) {
      print(e);
      Get.snackbar("Opps", "Something went wrong");
      _state.value = States.ERROR_STATE;
    }
  }

  var _requestStatus = States.INITIAL_STATE.obs;

  bool isSent = false;
  Future<void> sendShhopRequest(String shopId, String message) async {
    RequestStoreModel request =
        RequestStoreModel(shopId: shopId, message: message);
    print(request.toJson().toString());
    _requestStatus.value = States.LOADING_STATE;
    try {
      isSent = await RequestStoreCall.sendMyRequest(request);
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

  removeStore(int id) async {
    try {
      var call = await MyAvailableStoreCall.removeStore(id);
      if (call == true) {
        getMyStoreList();
      } else {
        Get.snackbar('Error', 'Error while removing store');
      }
    } catch (e) {
      Get.snackbar('Error', 'Network Error');
    }
  }

  @override
  void onInit() {
    getAvailableStoreList();
    getMyStoreList();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
