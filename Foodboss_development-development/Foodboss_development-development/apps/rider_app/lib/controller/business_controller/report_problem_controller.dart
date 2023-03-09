import 'package:get/get.dart';
import 'package:rider_app/infrastructure/report_problem_service.dart';
import 'package:rider_app/models/SupportRequestModel.dart';
import 'package:rider_app/models/help_category_model.dart';
import 'package:rider_app/utils/states.dart';

class ReportProblemController extends GetxController {
  var _data = HelpCategoriesModel().obs;
  var _state = States.INITIAL_STATE.obs;
  var selectedCategory = HelpCategory().obs;

  HelpCategoriesModel get data => _data.value;
  String get status => _state.value;

  List<HelpCategory> get helpCategories => _data.value.data!;

  HelpCategory get getSelected => selectedCategory.value;

  var _requestStatus = States.INITIAL_STATE.obs;

  bool isSent = false;

  Future<void> helpCat() async {
    _state.value = States.LOADING_STATE;
    try {
      HelpCategoriesModel response =
          await ReportProblemSevice.getHelpCategories();
      print(response);

      if (response == null) {
        _state.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something went wrong');
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          Get.snackbar('Errorr', response.message!);
        } else {
          _data.value = response;
          selectedCategory.value = _data.value.data!.first;
          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print(e);
      Get.snackbar('Opps', 'Something went wrong');
      _state.value = States.ERROR_STATE;
    }
  }

  var _name = ''.obs;
  var _phone = ''.obs;
  var _email = ''.obs;
  var _message = ''.obs;

  String get name => _name.value;
  String get email => _email.value;
  String get phone => _phone.value;
  String get message => _message.value;

  changeName(val) {
    _name.value = val;
  }

  // changeEmail(val){
  //   _email.value = val;
  // }
  changePhone(val) {
    _phone.value = val;
  }

  changeMessage(val) {
    _message.value = val;
  }

  Future<void> sendSupportRequest() async {
    SupportRequest request = SupportRequest(
        name: name,
        phone: phone,
        category: selectedCategory.value.sno.toString(),
        message: message);
    print(request.toJson().toString());
    _requestStatus.value = States.LOADING_STATE;
    try {
      isSent = await ReportProblemSevice.sendSupportRequest(request);
      if (isSent == false) {
        Get.snackbar('Error', 'Something went wrong');
      } else {
        _requestStatus.value = States.SUCCESS_STATE;
        Get.offNamed('/home');
        Get.snackbar('Success', 'Support Request Added');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Opps', 'Something went wrong');
      _requestStatus.value = States.ERROR_STATE;
    }
  }

  void changeSelectedCategory(hc) {
    selectedCategory.value = hc;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    helpCat();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
