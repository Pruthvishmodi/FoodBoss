import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class CustomImagePicker {

  static Future<File> fromGallary() async {
    
  var _picker = ImagePicker();
  File? file;

    XFile? fileMain = await _picker.pickImage(source: ImageSource.gallery);
      file = await ImageCropper().cropImage(
          sourcePath: fileMain!.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
      return file!;
  }

  static fromCamera() async {

    var _picker = ImagePicker();
  File? file;

    XFile? fileMain = await _picker.pickImage(source: ImageSource.camera);
    if (fileMain != null) {
      file = await ImageCropper().cropImage(sourcePath: fileMain.path);
      return file;
    }
  }

   static pickAndCrop(Function gstimage) {
    // int i =0;
   Get.bottomSheet(
        Container(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gstimage(false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.photo,
                        size: 50,
                      ),
                      LabelText(titleString: 'Gallery'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gstimage(true);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.camera,
                        size: 50,
                      ),
                      LabelText(titleString: 'Camera'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM)),
        backgroundColor: ThemeConfig.WHITE_COLOR);

    // return i;
  }
}
