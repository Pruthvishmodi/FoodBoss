import 'package:rider_app/models/auth/ProfileModel.dart';
import 'package:rider_app/models/faq_modal.dart';
import 'package:rider_app/models/profile_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class ProfileCall {
  static getProfile() async {
    var response = await Request.getData(Urls.GET_PROFILE_URL, false);
    if (response.statusCode == 200) {
      var profile = GetProfileModel.fromJson(response.data);
      print(profile);
      return profile;
    } else {
      return null;
    }
  }
}
