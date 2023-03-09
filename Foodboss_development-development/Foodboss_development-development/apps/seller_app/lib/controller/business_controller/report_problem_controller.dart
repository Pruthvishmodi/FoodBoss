import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/auth/user_controller.dart';
import 'package:seller_app/infrastructure/report_problem_service.dart';
import 'package:seller_app/models/SupportRequestModel.dart';
import 'package:seller_app/models/help_category_model.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';

class ReportProblemController extends GetxController {
  UserController profileController = Get.find<UserController>();
  var _data = HelpCategoriesModel().obs;
  var _state = States.INITIAL_STATE.obs;
  var selectedCategory = HelpCategory().obs;

  HelpCategoriesModel get data => _data.value;
  String get status => _state.value;

  List<HelpCategory> get helpCategories => _data.value.data!;

  HelpCategory get getSelected => selectedCategory.value;

  var _requestStatus = States.INITIAL_STATE.obs;

  bool isSent = false;

  Rx<SupportRequest> req = SupportRequest().obs;

  Future<void> helpCat() async {
    _state.value = States.LOADING_STATE;
    try {
      HelpCategoriesModel response =
          await ReportProblemSevice.getHelpCategories();
      print(response);

      if (response == null) {
        _state.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar();
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
        } else {
          _data.value = response;
          selectedCategory.value = _data.value.data!.first;
          req.value.category = selectedCategory.value.categoryName;
          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar2('Something went wrong');
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
    req.value.name = val;
  }

  changeEmail(val) {
    _email.value = val;
  }

  changePhone(val) {
    _phone.value = val;
    req.value.phone = val;
  }

  changeMessage(val) {
    _message.value = val;
    req.value.message = val;
  }

  addImage() async {
    await req.value.addImage();
    req.refresh();
  }

  Future<void> sendSupportRequest() async {
    // SupportRequest request = SupportRequest(
    //     name: name,
    //     phone: phone,
    //     category: selectedCategory.value.sno.toString(),
    //     message: message);
    // print(request.toJson().toString());
    _requestStatus.value = States.LOADING_STATE;
    printInfo(info: 'loading');
    try {
      printInfo(info: 'loading called');
      isSent = await ReportProblemSevice.sendSupportRequest(req.value);
      printInfo(info: 'loading ss');
      if (isSent == false) {
        printInfo(info: 'loading ssf');
        CustomSnackbar.errorSnackbar();
      } else {
        printInfo(info: 'loading ssfd');
        _requestStatus.value = States.SUCCESS_STATE;
        Get.offNamed('/home');
        CustomSnackbar.SucessSnackbar('Support Request Added');
      }
    } on DioError catch (e) {
      CustomSnackbar.errorSnackbar2(e.response!.statusCode.toString());
    } catch (e) {
      printInfo(info: 'err ${e.toString()}');
      CustomSnackbar.errorSnackbar2('Something went wrong');
      _requestStatus.value = States.ERROR_STATE;
    }
  }

  void changeSelectedCategory(hc) {
    selectedCategory.value = hc;
    req.value.category = hc;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    helpCat();
    changeName(profileController.getUser.Username.toString());
    changePhone(profileController.getUser.phoneNumber.toString());
    // changeName(profileController.user);
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
