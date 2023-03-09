import 'package:seller_app/models/plan_history.dart';

import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class PlanHistoryCall {
  static getPlanHistroy() async {
    var response = await Request.getData(Urls.PLAN_HISTORY_URL, true);
    // print(response);
    // print(response['success']);
    if (response.statusCode == 200) {
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var plan = PlanHistoryModel.fromJson(response.data);
      print(response.data);
      return plan;
    } else {
      return null;
    }
  }
}
