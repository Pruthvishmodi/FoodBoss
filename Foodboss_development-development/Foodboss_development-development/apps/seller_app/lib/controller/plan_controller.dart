import 'dart:convert';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/auth/user_controller.dart';
import 'package:seller_app/infrastructure/plan_call.dart';
import 'package:seller_app/models/plan_id_model.dart';
import 'package:seller_app/models/plan_model.dart';
import 'package:seller_app/models/purchasePlan_model.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
// import 'package:xml/xml.dart' as xml;

class PlanController extends GetxController {
  UserController controller = Get.find<UserController>();
  var data = PlanModel().obs;
  var _state = States.INITIAL_STATE.obs;
  var _selectedId = "0".obs;

  String get status => _state.value;

  List<Plans> get planList => data.value.data!.plans!.reversed.toList();

  String get getOrderCount => data.value.data!.prdersLeft!;

  getPlanData() async {
    _state.value = States.LOADING_STATE;
    try {
      var response = await PlanCall.getPlan();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar2(
            'Something went wrong while loading videos');
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
        } else {
          data.value = response;
          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar2("Something went wrong");
      _state.value = States.ERROR_STATE;
    }
  }

  addPlan(PurchasePlanModel planModel) async {
    try {
      bool response = await PlanCall.addPlan(planModel);
      if (response) {
        var orders = data.value.data!.plans!
            .firstWhere((element) => element.id.toString() == _selectedId.value)
            .orders;
        print(orders);
        var sum = int.parse(data.value.data!.prdersLeft!) + orders!;
        print(sum);
        data.value.data!.prdersLeft = sum.toString();
        Get.back();
        _state.value = States.SUCCESS_STATE;
        data.refresh();
      } else {
        _state.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      CustomSnackbar.errorSnackbar2("Something went wrong");
      _state.value = States.ERROR_STATE;
    }
  }

  addPlanId(OrderId orderIdModel, String price) async {
    try {
      String response = await PlanCall.addPlanId(orderIdModel);
      if (response != 'error') {
        // Get.back();
        orderID = response;
        payment(price, orderIdModel.planId.toString());
        _state.value = States.SUCCESS_STATE;
      } else {
        _state.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      CustomSnackbar.errorSnackbar2("Something went wrong");
      _state.value = States.ERROR_STATE;
    }
  }

  var orderID = '';
  payment(String price, String id) async {
    _selectedId.value = id;
    try {
      Dio dio = Dio();
      dio.options.headers['x-client-id'] = '184281a0ff496e7195ddcf33e0182481';
      dio.options.headers['x-client-secret'] =
          '1755eb21e3319655a2e8e7d30824feac3034d782';
      var response = await dio.post(
          'https://api.cashfree.com/api/v2/cftoken/order',
          data: jsonEncode({
            "orderId": orderID,
            "orderAmount": price,
            "orderCurrency": "INR"
          }));
      if (response.statusCode == 200) {
        String token = response.data["cftoken"].toString();
        Map<String, String> inputPramas = {
          "color1": '0xff87cb86',
          "color2": '0xffffffff',
          "orderId": orderID,
          "orderAmount": price,
          "customerName": controller.getUser.Username.toString(),
          "orderNote": "Your order has been processed succesfully.",
          "orderCurrency": "INR",
          "appId": "184281a0ff496e7195ddcf33e0182481",
          "customerPhone": controller.getUser.phoneNumber.toString(),
          "customerEmail": 'karangadani@gamil.com',
          "stage": "PROD",
          // "notifyUrl": "https://web.whatsapp.com",
          "tokenData": token
        };
        print(inputPramas);
        CashfreePGSDK.doPayment(inputPramas).then((value) {
          value!.forEach((key, value) {
            // this.res
            print("$key : $value");

            // response +=  "\"$key\":\"$value\"\n";
          });
          print("aaaaaaaaaa${value["txStatus"]}");

          if (value["txStatus"] == "SUCCESS") {
            PurchasePlanModel planModel = PurchasePlanModel(
                paymentMode: value["paymentMode"],
                planId: id,
                referenceNo: value["referenceId"]);
            addPlan(planModel);
            getPlanData();
            // Get.back();
          } else {
            // Get.back();
            CustomSnackbar.errorSnackbar2("Transaction failed");

            //  CustomSnackbar().showTextSnackbar(context, 'text');
          }
        });
      }

      print(response);
    } catch (e) {
      print('errr $e');
    }
  }

  @override
  void onInit() {
    // getPlanData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
