import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:seller_app/infrastructure/driver_service.dart';
import 'package:seller_app/models/driver/add_driver_model.dart';
import 'package:seller_app/models/driver/all_driver_model.dart';
import 'package:seller_app/models/driver/my_driver_model.dart';
import 'package:seller_app/models/driver/remove_driver_model.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';

class DriverController extends GetxController {
  var allDriverData = AllDriverModel().obs;
  var allDriverDataStatus = States.INITIAL_STATE.obs;

  List<MyDriver> get getDriverList => allDriverData.value.data!;

  Future<void> getAllDriversData() async {
    allDriverDataStatus.value = States.LOADING_STATE;

    try {
      AllDriverModel response = await DriverService.getAllDriverCall();

      if (response.success == false) {
        allDriverDataStatus.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something Went Wrong');
      } else {
        // Get.snackbar('Success', 'Hurray');
        allDriverData.value = response;
        allDriverDataStatus.value = States.SUCCESS_STATE;
      }
    } catch (e) {
      print('eror $e');
      allDriverDataStatus.value = States.ERROR_STATE;
      Get.snackbar('Something went wrong', 'Something went wrong');
    }
  }

  Future<void> searchFromAllDriver(String val) async {
    allDriverDataStatus.value = States.LOADING_STATE;

    try {
      var response = await DriverService.searchGetAllDriverCall(int.parse(val));

      if (response == null) {
        allDriverDataStatus.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something Went Wrong');
      } else {
        // Get.snackbar('Success', 'Hurray');
        allDriverData.value = response;
        allDriverDataStatus.value = States.SUCCESS_STATE;
      }
    } catch (e) {
      print('eror $e');
      allDriverDataStatus.value = States.ERROR_STATE;
      Get.snackbar('Something went wrong', 'Something went wrong');
    }
  }

  Future<void> refreshList() async {
    getMyDriversData();
    return;
  }

  var customSnackbar = CustomSnackbar();

  var trustedDriver = false.obs;
  var driverPrice = '0'.obs;

  addNewDriver(String riderID, BuildContext context) async {
    try {
      var i = trustedDriver.value == true ? 1 : 0;
      bool response = await DriverService.addDriverRequest(
          AddDriverRequestModel(
              charges: driverPrice.value,
              isTrusted: i.toString(),
              riderId: riderID));

      if (response) {
        // myDriverData.refresh();
        var newDriver = getDriverList[getDriverList
            .indexWhere((element) => element.riderId.toString() == riderID)];
        newDriver.deliveryCharge = driverPrice.value;
        newDriver.isTrusted = trustedDriver.value;
        myDriverData.value.data!.add(newDriver);
        myDriverData.refresh();

        customSnackbar.showTextSnackbar(context, 'Driver Added Successfully');

        trustedDriver.value = false;
        driverPrice.value = '';
      } else {
        print('h');
        customSnackbar.showDefaultErrorSnackbar(context);
      }

      trustedDriver.value = false;
      driverPrice.value = '';
    } catch (e) {
      print('errror $e');
      customSnackbar.showDefaultErrorSnackbar(context);
    }
  }

  toggleDriverTrust(
      AddDriverRequestModel requestModel, BuildContext context) async {
    try {
      bool response = await DriverService.addDriverRequest(requestModel);

      if (response) {
        myDriverData.value.data!
            .elementAt(myDriverData.value.data!.indexWhere((element) =>
                element.riderId.toString() == requestModel.riderId))
            .isTrusted = requestModel.isTrusted == '0' ? false : true;
        myDriverData.refresh();
        // return true;
        // customSnackbar.showDefaultSuccessSnackbar(context);
      } else {
        print('h');
        customSnackbar.showDefaultErrorSnackbar(context);
        // return false;
      }
    } catch (e) {
      print(e);
      customSnackbar.showDefaultErrorSnackbar(context);
      // return false;
    }
  }

  updateDriver(String riderID, BuildContext context) async {
    try {
      var i = trustedDriver.value == true ? 1 : 0;
      bool response = await DriverService.addDriverRequest(
          AddDriverRequestModel(
              charges: driverPrice.value,
              isTrusted: i.toString(),
              riderId: riderID));

      if (response) {
        // myDriverData.refresh();
        myDriverData.value.data!
            .elementAt(myDriverData.value.data!
                .indexWhere((element) => element.riderId.toString() == riderID))
            .deliveryCharge = driverPrice.value;
        myDriverData.value.data!
            .elementAt(myDriverData.value.data!
                .indexWhere((element) => element.riderId.toString() == riderID))
            .isTrusted = trustedDriver.value;
        // myDriverData.value.data!;
        myDriverData.refresh();
        trustedDriver.value = false;
        driverPrice.value = '';

        // customSnackbar.showDefaultSuccessSnackbar(context);
      } else {
        print('h');
        customSnackbar.showDefaultErrorSnackbar(context);
      }
    } catch (e) {
      print('errror $e');
      customSnackbar.showDefaultErrorSnackbar(context);
    }
  }

  removeDriver(String riderID, BuildContext context) async {
    try {
      String response = await DriverService.removeDriverRequest(
          RemoveDriverReqestModel(riderId: riderID));

      if (response == 'true') {
        print('success');
        myDriverData.value.data!.removeAt(myDriverData.value.data!
            .indexWhere((element) => element.riderId.toString() == riderID));
        myDriverData.refresh();
        CustomSnackbar().showTextSnackbar(context, 'Driver removed');
      } else {
        print('h');
        CustomSnackbar().showDefaultErrorSnackbar(context);
      }
    } catch (e) {
      print('errror $e');
      CustomSnackbar().showDefaultErrorSnackbar(context);
    }
  }

  //My Driver
  var myDriverData = MyDriverModel().obs;
  var myDriverDataStatus = States.INITIAL_STATE.obs;

  List<MyDriver> get getMyDriverList => myDriverData.value.data!;

  getMyDriversData() async {
    myDriverDataStatus.value = States.LOADING_STATE;

    try {
      var response = await DriverService.getMyDriversCall();

      if (response == false) {
        myDriverDataStatus.value = States.ERROR_STATE;
      } else {
        // Get.snackbar('Success', 'Hurray');
        myDriverData.value = response;
        myDriverDataStatus.value = States.SUCCESS_STATE;
      }
    } catch (e) {
      print('eror $e');
      myDriverDataStatus.value = States.ERROR_STATE;
    }
  }

  @override
  void onInit() {
    getMyDriversData();
    getAllDriversData();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
