import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seller_app/widgets/custom_image_picker.dart';

class StoreregistrationModel {
  String? name;
  String? address1;
  String? address2;
  String? area;
  String? city;
  String? qrNumber;

  String? taluka;
  String? district;
  String? state;
  String? pincode;
  String? longitude;
  String? latitude;
  // File? shopImages;
  List<File> shopImages = [];
  File? ownerImage;
  File? gst;
  File? shopRegistration;
  File? qrCode;
  // final ImagePicker _picker = ImagePicker();

  addShopImage(fromCamera) async {
    if (fromCamera == true) {
      File? file = await CustomImagePicker.fromCamera();
      if (file != null) {
        shopImages.add(file);
        // shopImages = file;
      }
    } else {
      File? file = await CustomImagePicker.fromGallary();
      if (file != null) {
        shopImages.add(file);
        // shopImages = file;
      }
    }
    // File? file = await CustomImagePicker.fromGallary();
    // if (file != null) {
    //   if (shopImages != null) {
    //     if (shopImages.length > 0) {
    //       print('here');
    //       shopImages[0] = File(file.path);
    //     } else {
    //       print('here 2');
    //       shopImages.add(File(file.path));
    //     }
    //   }
    // }
  }

  addOwnerImage(fromCamera) async {
    if (fromCamera == true) {
      File? file = await CustomImagePicker.fromCamera();
      if (file != null) {
        ownerImage = file;
      }
    } else {
      File? file = await CustomImagePicker.fromGallary();
      if (file != null) {
        ownerImage = file;
      }
    }
  }

  addQrImage(fromCamera) async {
    if (fromCamera == true) {
      File? file = await CustomImagePicker.fromCamera();
      if (file != null) {
        qrCode = file;
      }
    } else {
      File? file = await CustomImagePicker.fromGallary();
      if (file != null) {
        qrCode = file;
      }
    }
  }

  addGst(bool fromCamera) async {
    // var i = CustomImagePicker().pickAndCrop();
    if (fromCamera == true) {
      File? file = await CustomImagePicker.fromCamera();
      if (file != null) {
        gst = file;
      }
    } else {
      File? file = await CustomImagePicker.fromGallary();
      if (file != null) {
        gst = file;
      }
    }

    // print(file.path);

    // File? filee = await ImageCropper().cropImage(sourcePath: file!.path,);
  }

  addShopRegistration(bool fromCamera) async {
    if (fromCamera == true) {
      File? file = await CustomImagePicker.fromCamera();
      if (file != null) {
        shopRegistration = file;
      }
    } else {
      File? file = await CustomImagePicker.fromGallary();
      if (file != null) {
        shopRegistration = file;
      }
    }
  }

  toShopImagesJson() async {
    var json = [];

    if (shopImages[0] != null && shopImages.isNotEmpty) {
      var image = await MultipartFile.fromFile(shopImages[0].path);
      json.add(image);
    }
    // if (shopImages[1] != null) {
    //   var image = await MultipartFile.fromFile(shopImages![1].path);
    //   json.add(image);
    // }
    // if (shopImages[2] != null) {
    //   var image = await MultipartFile.fromFile(shopImages![2].path);
    //   json.add(image);
    // }
    // if (shopImages[3] != null) {
    //   var image = await MultipartFile.fromFile(shopImages![3].path);
    //   json.add(image);
    // }

    return json;
  }

  toOwnerImagesJson() async {
    var json;
    if (ownerImage != null) {
      json = await MultipartFile.fromFile(ownerImage!.path);
    }
    if (json != null) {
      return json;
    } else {
      return json.toString();
    }
  }

  toGstJson() async {
    var json;
    if (gst != null) {
      json = await MultipartFile.fromFile(gst!.path);
    }
    if (json != null) {
      return json;
    } else {
      return json.toString();
    }
  }

  toRegistrationJson() async {
    var json;
    if (shopRegistration != null) {
      json = await MultipartFile.fromFile(shopRegistration!.path);
    }
    if (json != null) {
      return json;
    } else {
      return json.toString();
    }
  }

  toQrJson() async {
    var json = null;
    if (qrCode != null) {
      json = await MultipartFile.fromFile(qrCode!.path);
    }
    if (json != null) {
      return json;
    } else {
      return json.toString();
    }
  }

  toJson() async {
    // print(await toOwnerImagesJson());
    // print(await toQrJson());
    // print(district.toString() == '');
    var formData = FormData.fromMap({
      "name": name.toString(),
      "state": state.toString(),
      "district": district.toString() == '' ? 'Not Provided' : district.toString(),
      "city": city.toString(),
      "qr_number": qrNumber.toString(),

      "taluka": taluka.toString(),
      "pincode": pincode.toString(),
      "address_line_1": address1.toString(),
      "address_line_2": address2.toString(),
      "area": area.toString(),
      "latitude": latitude.toString(),
      "longitude": longitude.toString(),
      "shop_gallery[]": await toShopImagesJson(),
      "owner_image": ownerImage != null ? await toOwnerImagesJson() : null,
      "gst_document":gst != null ? await toGstJson():null,
      "shop_register":shopRegistration!=null? await toRegistrationJson():null,
      "qrcode_image": qrCode != null ? await toQrJson() : null,
    });
    // print(latitude.toString());
    // print(longitude.toString());
    
    // print(formData.toString());
    return formData;
  }
}
