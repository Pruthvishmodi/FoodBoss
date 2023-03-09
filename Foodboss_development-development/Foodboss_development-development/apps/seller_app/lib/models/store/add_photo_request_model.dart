import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seller_app/widgets/custom_image_picker.dart';

class AddPhotoRequestModel {
  String? productID;
   List<File> files = [];
  // late File files2;
  // late File files3;
  final ImagePicker _picker = ImagePicker();

  addShopImage(bool value) async {
    File file;
    if(value){
      file = await CustomImagePicker.fromCamera();
    }else{
       file =await CustomImagePicker.fromGallary();
    }


    if (file != null) {

      files.add(File(file.path));
    
      print('file added');
      // switch (index){
      //   case 1:
      //     files1 = File(file.path);
      //     break;
      //   case 2:
      //     files2 = File(file.path);
      //     break;
      //   case 3:
      //     files3 = File(file.path);
      //     break;
        
      // }

    //   if(files.length>0){
    // files[0] = File(file.path);
    //   }else{

    //     files.add(File(file.path));
    //   }
    }
  }


  productImageToJson() async {
    var json = [];
   

    if (files.isNotEmpty) {
      var image = await MultipartFile.fromFile(files[0].path);
      json.add(image);
    }
     if (!(files.length < 2)) {
      var image = await MultipartFile.fromFile(files[1].path);
      json.add(image);
    }
    if (!(files.length < 3)) {
      var image = await MultipartFile.fromFile(files[2].path);
      json.add(image);
    }
    // if (shopImages[3] != null) {
    //   var image = await MultipartFile.fromFile(shopImages![3].path);
    //   json.add(image);
    // }
    
    return json;
  }

  
  toJson() async{
    print(await productImageToJson());
    var formData = FormData.fromMap({
      "food_id": productID.toString(),
      "files[]": await productImageToJson(),
    });
    return formData;
  }
}
