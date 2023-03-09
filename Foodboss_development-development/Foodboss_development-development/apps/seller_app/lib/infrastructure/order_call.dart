import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/video_help_controller.dart';
import 'package:seller_app/models/login_model.dart';
import 'package:seller_app/models/privacy_model.dart';
import 'package:seller_app/models/video_help_modal.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class OrderCall {
   static getOrder() async {
    
    var response =
        await Request.getData(Urls.ORDER_CALL, false);
      // print(response);
      // print(response['success']);
    if (response.statusCode == 200) {
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var order = Privacy.fromJson(response.data);
      return order;
    } else {
      return null;
    }
  }
}
