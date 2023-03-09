import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/infrastructure/customer_service.dart';
import 'package:seller_app/models/customer/add_customer_model.dart';
import 'package:seller_app/models/customer/all_customer_model.dart';
import 'package:seller_app/models/customer/my_customer_model.dart';
import 'package:seller_app/models/customer/remove_customer_model.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';

class CustomerController extends GetxController {
  // final SnackBarController snackBarController = Get.find<SnackBarController>();

  var myCustomerData = MyCustomerModel().obs;
  var _fetchMyCustomerStatus = States.INITIAL_STATE.obs;

  get mycustomerDataStatus => _fetchMyCustomerStatus.value;

  List<CustomerData> get myCustomerList => myCustomerData.value.data!.data!;

  Future<void> fetchMyCustomersData() async {
    _fetchMyCustomerStatus.value = States.LOADING_STATE;
    try {
      var response = await CustomerService.getMyCustomer();
      // print('here $response');

      if (response == false) {
        _fetchMyCustomerStatus.value = States.ERROR_STATE;

        CustomSnackbar.errorSnackbar();
      } else {
        myCustomerData.value = response;
        // CustomSnackbar.SucessSnackbar('Miracle miracle');
        _fetchMyCustomerStatus.value = States.SUCCESS_STATE;

        // snackBarController.showDefaultSnackbar();

        // Get.snackbar('Data Fetched', 'Hurry');

      }
    } catch (e) {
      _fetchMyCustomerStatus.value = States.ERROR_STATE;

      CustomSnackbar.errorSnackbar();
    }
  }

  var allCustomerData = AllCustomerModel().obs;
  var _fetchallCustomerStatus = States.INITIAL_STATE.obs;

  get allCustomerDataStatus => _fetchallCustomerStatus.value;

  List<AllCustomerData> get allCustomerList =>
      allCustomerData.value.data!.data!;

  Future<void> fetchAllCustomersData() async {
    _fetchallCustomerStatus.value = States.LOADING_STATE;

    try {
      var response = await CustomerService.getAllCustomer();
      print(response);
      if (response == false) {
        _fetchallCustomerStatus.value = States.ERROR_STATE;

        CustomSnackbar.errorSnackbar();
      } else {
        allCustomerData.value = response;
        _fetchallCustomerStatus.value = States.SUCCESS_STATE;
        // Get.snackbar('Data Fetched', 'Hurray');

      }
    } catch (e) {
      _fetchallCustomerStatus.value = States.ERROR_STATE;
      CustomSnackbar.errorSnackbar();
    }
  }

  Future<void> searchFromAllCustomer(String val) async {
    _fetchallCustomerStatus.value = States.LOADING_STATE;

    try {
      var response =
          await CustomerService.searchGetAllCustomerCall(int.parse(val));

      if (response == null) {
        _fetchallCustomerStatus.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something Went Wrong');
      } else {
        // Get.snackbar('Success', 'Hurray');
        allCustomerData.value = response;
        _fetchallCustomerStatus.value = States.SUCCESS_STATE;
      }
    } catch (e) {
      print('eror $e');
      _fetchallCustomerStatus.value = States.ERROR_STATE;
      Get.snackbar('Something went wrong', 'Something went wrong');
    }
  }

  //Add Customer api

  addCustomer(AddCustomerModel customer, BuildContext context) async {
    try {
      var response = await CustomerService.addCustomer(customer);
      if (response) {
        // var newCustomer = myCustomerList[myCustomerList.indexWhere((element) => element.clientId.toString() == customer.clientId)];
        // newCustomer.deliveryCharge = customer.deliveryCharge;
        // newCustomer.isBlock = customer.isBlock == "true" ? 1 : 0;
        // myCustomerData.value.data!.data!.add(newCustomer);
        CustomSnackbar.SucessSnackbar('Customer Added');

        myCustomerData.refresh();
        // Get.back();
      } else {
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar();
    }
  }

  updateCustomer(AddCustomerModel customer) async {
    try {
      var response = await CustomerService.updateCustomer(customer);
      if (response) {
        // fetchMyCustomersData();
        // Get.snackbar('Success', 'Customer added successfully');
        CustomSnackbar.SucessSnackbar('Customer Updated Successfully');
      } else {
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar();
    }
  }

  removeCustomer(id) async {
    try {
      var response = await CustomerService.removeCustomer(
          RemoveCustomerModel(clientId: id.toString()));
      if (response) {
        fetchMyCustomersData();
        // Get.snackbar('Success', 'Customer added successfully');
      } else {
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchMyCustomersData();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
