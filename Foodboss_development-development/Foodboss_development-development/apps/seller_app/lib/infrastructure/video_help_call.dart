import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/video_help_controller.dart';
import 'package:seller_app/models/login_model.dart';
import 'package:seller_app/models/video_help_modal.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class VideoHelpCall {
   static getVideoes() async {
    
    var response =
        await Request.getData(Urls.VIDEO_URL, false);
      print(response);
      // print(response['success']);
    if (response.statusCode == 200) {
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var videos = VideoHelp.fromJson(response.data);
      return videos;
    } else {
      return null;
    }
  }
}
