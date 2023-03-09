import 'package:rider_app/models/SupportRequestModel.dart';
import 'package:rider_app/models/help_category_model.dart';
import 'package:rider_app/models/earning/my_earning_model.dart';
import 'package:rider_app/models/order/order_collect_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class CollectOrderCall {
  static sendCollectRequest(CollectOrderodel request) async {
    var response =
        await Request.postData(Urls.MYCOLLECTREQUEST, request.toJson(), true);
    print(response);
    if (response.statusCode == 200) {
      print('data added');
      return response.data;
    } else {
      return false;
    }
  }
  static getCode() async {
    var response = await Request.getData(Urls.MYCOLLECTREQUEST, false);
    // print(response);
    // print(response['success']);
    if (response.statusCode == 200) {
      // final Map<String ,dynamic> responseData = json.decode(response.data);
      var collect = CollectOrderodel.fromJson(response.data);
      return collect;
    } else {
      return null;
    }
  }
}
