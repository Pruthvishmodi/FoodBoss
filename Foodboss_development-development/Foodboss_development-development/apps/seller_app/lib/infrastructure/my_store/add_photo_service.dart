import 'package:seller_app/models/store/add_photo_request_model.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class AddPhotoService {
  static addPhoto(AddPhotoRequestModel request) async {
    var json = await request.toJson();
    var response =
        await Request.postData(Urls.ADDIMAGETOPRODUCT, json, true);
    print(response);
    if (response.statusCode == 200) {
      // final Map<String, dynamic> responseData = json.decode(response.body);
      // var userData = AuthResponseModel.fromJson(response.data);
      return response.data['success'];
      // print(response.data.success);
    } else {
      print(response);
      return null;
    }
  }
}