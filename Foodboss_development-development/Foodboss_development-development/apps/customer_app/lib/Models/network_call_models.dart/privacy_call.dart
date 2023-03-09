import 'dart:convert';

import 'package:customer_app/Models/privacy_model.dart';
import 'package:customer_app/utils/requests.dart';
import 'package:customer_app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PrivacyCall {
   static getPrivacy() async {
    
    var response =
        await Request.getData(Urls.PRIVACY_URL, false);
      // print(response);
      // print(response['success']);
    if (response.statusCode == 200) {
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var privacy = Privacy.fromJson(response.data);
      return privacy;
    } else {
      return null;
    }
  }
}
