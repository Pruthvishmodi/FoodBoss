import 'package:dio/dio.dart';
import 'package:seller_app/infrastructure/token_service.dart';
import 'package:seller_app/models/SupportRequestModel.dart';
import 'package:seller_app/models/help_category_model.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class ReportProblemSevice {
  static getHelpCategories() async {
    var response = await Request.getData(Urls.HELPCATAGORIES, true);
    print(response);
    if (response.statusCode == 200) {
      var helpCategories = HelpCategoriesModel.fromJson(response.data);

      return helpCategories;
    } else {
      return null;
    }
  }

  static sendSupportRequest(SupportRequest request) async {
    var json = await request.toJson();
    print(json.toString());

    var dio = Dio();
    var token = await TokenService.getToken();
    var response = await dio.post(Urls.SUPPORTREQUEST,
        data: json,
        options: Options(
            headers: {"Authorization": "Bearer $token"},
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    // var response = await Request.postData(Urls.SUPPORTREQUEST, json, true);
    print(response);
    if (response.statusCode == 200) {
      print('data added');
      return true;
    } else {
      return false;
    }
  }
}
