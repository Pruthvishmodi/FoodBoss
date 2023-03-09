import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/video_help_controller.dart';
import 'package:seller_app/models/login_model.dart';
import 'package:seller_app/models/plan_id_model.dart';
import 'package:seller_app/models/plan_model.dart';
import 'package:seller_app/models/privacy_model.dart';
import 'package:seller_app/models/purchasePlan_model.dart';
import 'package:seller_app/models/video_help_modal.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class PlanCall {
  static getPlan() async {
    var response = await Request.getData(Urls.PLAN_URL, true);
    print(response);
    // print(response['success']);
    if (response.statusCode == 200) {
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var data = response.data;
      if (data['success'] != null) {
        // var catData = MyStoreCat.fromJson(response.data);
        var plan = PlanModel.fromJson(response.data);
        // return true;
        return plan;
      } else {
        return null;
      }
      // return catData;
    } else {
      return null;
    }
  }

  static Future<bool> addPlan(PurchasePlanModel planModel) async {
    var response =
        await Request.postData(Urls.PURCHSE_PLAN_URL, planModel.toJson(), true);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> addPlanId(OrderId orderIdModel) async {
    var response =
        await Request.postData(Urls.ORDER_ID_URL, orderIdModel.toJson(), true);
    //   print(response);
    // print(orderIdModel);
    String orderID = response.data['order_id'];

    print(response.data['order_id']);
    if (response.statusCode == 200) {
      return orderID;
    } else {
      return 'error';
    }
  }
}
