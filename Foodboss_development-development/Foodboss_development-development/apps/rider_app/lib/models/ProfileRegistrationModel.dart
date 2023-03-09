import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class Address {
  String? line1;
  String? line2;
  String? area;
  String? city;
  String? state;
  String? zip;

  Address({this.line1, this.line2, this.area, this.city, this.state, this.zip});

  Address.fromJson(Map<String, dynamic> json) {
    line1 = json['line1'];
    line2 = json['line2'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line1'] = this.line1;
    data['line2'] = this.line2;
    data['area'] = this.area;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    return data;
  }
}

class ProfileRegistrationModel {
  File? driverImage;
  File? licence;
  String? licenceNo;
  String? vehicalNo;
  String? longitude;
  String? latitude;
  Address? address;
  // List<File> shopImages = [];
  // File? shopRegistration;
  // File? qrCode;
  final ImagePicker _picker = ImagePicker();

  addDriverImage() async {
    XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      driverImage = File(file.path);
    }
  }

  addLicenceImage() async {
    XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      licence = File(file.path);
    }
  }

  toDriverImagesJson() async {
    var json = null;
    if (driverImage != null) {
      json = await MultipartFile.fromFile(driverImage!.path);
    }
    if (json != null) {
      return json;
    } else {
      return json.toString();
    }
  }

  toLicenceJson() async {
    var json = null;
    if (licence != null) {
      json = await MultipartFile.fromFile(licence!.path);
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
    var formData = FormData.fromMap({
      "driver_image": await toDriverImagesJson(),
      "licence": await toLicenceJson(),
      "licence_no": licenceNo.toString(),
      "vehicle_no": vehicalNo.toString(),
      "latitude": latitude.toString(),
      "longitude": longitude.toString(),
      "address[line1]": address!.line1,
      "address[line2]": address!.line2 ?? "",
      "address[area]": address!.area,
      "address[city]": address!.city,
      "address[state]": address!.state,
      "address[zip]": address!.zip,

      // "taluka": taluka.toString(),
      // "pincode": pincode.toString(),
      // "address_line_1": address1.toString(),
      // "address_line_2": address2.toString(),
      // "area": area.toString(),
      // "latitude": latitude.toString(),
      // "longitude": longitude.toString(),
      // "shop_images[]": await toShopImagesJson(),
      // "owner_image": ownerImage != null ?await  toOwnerImagesJson() : null,
      // "gst_document": await toGstJson(),
      // "shop_register": await toRegistrationJson(),
      // "qrcode_image": qrCode != null ? await toQrJson() : null,
    });
    return formData;
  }
}
