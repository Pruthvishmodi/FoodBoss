import 'package:seller_app/models/customer/add_customer_model.dart';
import 'package:seller_app/models/customer/all_customer_model.dart';
import 'package:seller_app/models/customer/my_customer_model.dart';
import 'package:seller_app/models/customer/remove_customer_model.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class CustomerService {
  static getMyCustomer() async {
    var response = await Request.getData(Urls.MYCUSTOMER, true);
    print(response);
    if (response.statusCode == 200) {
      return MyCustomerModel.fromJson(response.data);
    } else {
      print('error ');
    }
  }

  static getAllCustomer() async {
    var response = await Request.getData(Urls.ALLCUSTOMER, true);
    print(response);
    if (response.statusCode == 200) {
      return AllCustomerModel.fromJson(response.data);
    } else {
      print('Error');
    }
  }

  static searchGetAllCustomerCall(int val) async {
    var response = await Request.getData(Urls.SEARCHCUSTOMER(val), true);
    print(response);
    if (response.statusCode == 200) {
      return AllCustomerModel.fromJson(response.data);
    } else {
      print('Error');
      return null;
    }
  }

  static Future<bool> addCustomer(AddCustomerModel customer) async {
    print(customer.toJson());
    var response =
        await Request.postData(Urls.ADDCUSTOMER, customer.toJson(), true);
    print(response);
    if (response.statusCode == 200) {
      print('here');
      // print('data added successfully');
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateCustomer(AddCustomerModel customer) async {
    var response =
        await Request.postData(Urls.UPDATECUSTOMER, customer.toJson(), true);
    print(response);
    if (response.statusCode == 200) {
      // print('data added successfully');
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> removeCustomer(
      RemoveCustomerModel removeCustomerModel) async {
    var response = await Request.deleteData(
        Urls.REMOVECUSTOMER, removeCustomerModel.toJson(), true);
    print(response);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
