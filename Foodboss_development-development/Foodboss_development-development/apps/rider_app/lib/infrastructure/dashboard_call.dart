import 'package:rider_app/models/dashboard_model.dart';
import 'package:rider_app/models/privacy_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class DashboardCall {
  static getDashboard() async {
    var response = await Request.getData(Urls.DASHBOARD_URL, true);
    // print(response);
    // print(response['success']);
    if (response.statusCode == 200) {
      print(response);
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var dashboard = DashboardModel.fromJson(response.data);

      return dashboard;
    } else {
      return null;
    }
  }
}
