import 'package:get/get.dart';
import 'package:rider_app/infrastructure/my_earning_call.dart';
import 'package:rider_app/models/earning/my_earning_list_model.dart';
import 'package:rider_app/models/earning/my_earning_model.dart';
import 'package:rider_app/utils/states.dart';

class EarningController extends GetxController {
  var data = MyEarningListModel().obs;
  var _state = States.INITIAL_STATE.obs;

  String get status => _state.value;

  // MyEarningListModel get data => _data.value;

  // Future<void> getMyEarningList() async {
  //   _state.value = States.LOADING_STATE;
  //   try {
  //     MyEarningListModel response = await MyEarningListCall.getEarningList();
  //     print(response);
  //     if (response == null) {
  //       _state.value = States.ERROR_STATE;
  //       Get.snackbar('Error', 'Something went wrong while loading videos');
  //     } else {
  //       if (response.success == false) {
  //         _state.value = States.ERROR_STATE;
  //         // Get.snackbar('Error', response.message!);
  //       } else {
  //         // var raw = xml.parse(response.data!.privacyText!);
  //         // var priivcy = raw.findAllElements('#text');
  //         // print(priivcy);

  //         _data.value = response;
  //         _state.value = States.SUCCESS_STATE;
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //     Get.snackbar("Opps", "Dioo error");
  //     _state.value = States.ERROR_STATE;
  //   }
  // }

  var _requestStatus = States.INITIAL_STATE.obs;

  var isSent;

  var start = ''.obs;
  var end = ''.obs;

  // String get start => _start.value;

  // String get end => _end.value;

  // changeStart(val){
  //   _start.value = val;
  // }

  // changeEnd(val){
  //   _end.value = val;
  // }

  Future<void> sendSupportRequest() async {
    MyEarningModel request = MyEarningModel(
      startDate: start.value,
      endDate: end.value,
    );
    print(request.toJson().toString());
    _requestStatus.value = States.LOADING_STATE;
    try {
      var isSent = await EarningCall.sendMyEarningTime(request);
      if (isSent == null) {
        Get.snackbar('Error', 'Something went wrong');
      } else {
        _requestStatus.value = States.SUCCESS_STATE;
        // await getMyEarningList();
        data.value = isSent;
        Get.snackbar('Success', 'Support Request Added');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Opps', 'Something went wrong');
      _requestStatus.value = States.ERROR_STATE;
    }
  }

  final DateTime noww = DateTime.now();
// String result = noww.substring(0, noww.indexOf(' '));
// DateTime date = DateTime(now.year, now.month, now.day);
  Future<void> sendWithoutDatetRequest() async {
    final DateTime endDate = DateTime(noww.year, noww.month - 1, noww.day);
    MyEarningModel request = MyEarningModel(
      startDate: endDate.toString(),
      endDate: DateTime.now()
          .toString()
          .substring(0, DateTime.now().toString().indexOf(' ')),
    );

    print(request.toJson().toString());
    _requestStatus.value = States.LOADING_STATE;
    try {
      var isSent = await EarningCall.sendMyEarningTime(request);
      if (isSent == null) {
        Get.snackbar('Error', 'Something went wrong');
      } else {
        _requestStatus.value = States.SUCCESS_STATE;
        // await getMyEarningList();
        print('gvf ${isSent.toString()}');
        data.value = isSent;
        // Get.snackbar('Success', 'Support Request Added');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Opps', 'Something went wrong');
      _requestStatus.value = States.ERROR_STATE;
    }
  }

  @override
  void onInit() {
    sendWithoutDatetRequest();
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
