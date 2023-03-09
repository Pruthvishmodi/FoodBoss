import 'package:rider_app/models/ProfileRegistrationModel.dart';
import 'package:rider_app/models/profile_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class ProfileService {
  static addProfile(ProfileRegistrationModel request) async {
    var json = await request.toJson();
    print(json.toString());
    var response = await Request.postData(Urls.UPDATE_PROFILE_URL, json, true);

    print(response.data);
    print(response.data['success']);
    if (response.statusCode == 200) {
      return response.data['success'];
    } else {
      return null;
    }
  }

  static getProfile() async {
    var response = await Request.getData(Urls.GET_PROFILE_URL, true);
    print(response);
    if (response.statusCode == 200) {
      return GetProfileModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
