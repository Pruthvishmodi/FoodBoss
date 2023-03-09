import 'package:rider_app/models/privacy_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class PrivacyCall {
  static getPrivacy() async {
    var response = await Request.getData(Urls.PRIVACY_URL, false);
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
