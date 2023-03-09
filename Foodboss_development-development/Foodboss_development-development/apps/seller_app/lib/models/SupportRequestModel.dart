import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class SupportRequest {
  String? name;
  String? phone;
  String? category;
  String? message;
  XFile? image;

  SupportRequest(
      {this.name, this.image, this.phone, this.category, this.message});

  SupportRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    category = json['category'];
    message = json['message'];
  }

  addImage() async {
    var _picker = ImagePicker();
    // File? file;

    XFile? fileMain = await _picker.pickImage(source: ImageSource.gallery);
    // File? file = await CustomImagePicker.fromCamera();
    if (fileMain != null) {
      image = fileMain;
    }
  }

  toImageJson() async {
    var json = null;
    if (image != null) {
      json = await MultipartFile.fromFile(image!.path);
    }
    if (json != null) {
      print('h');
      return json;
    } else {
      print('t');
      return json.toString();
    }
  }

  toJson() async {
    // final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['name'] = this.name;
    // data['phone'] = this.phone;
    // data['category'] = this.category;
    // data['message'] = this.message;
    // return data;
    print('json');
    print(category);
    var formData = FormData.fromMap({
      'name': name,
      'phone': phone,
      'category': category,
      'message': message,
      'help_image': await toImageJson(),
    });
    print(formData.files);
    print(formData.fields);
    return formData;
  }
}
