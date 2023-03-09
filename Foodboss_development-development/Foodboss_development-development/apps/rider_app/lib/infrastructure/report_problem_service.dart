
import 'package:rider_app/models/SupportRequestModel.dart';
import 'package:rider_app/models/help_category_model.dart';
import 'package:rider_app/utils/requests.dart';
import 'package:rider_app/utils/urls.dart';

class ReportProblemSevice{

  static getHelpCategories() async{
    var response = await Request.getData(Urls.HELPCATAGORIES, true);
    print(response);
    if(response.statusCode == 200){
      var helpCategories = HelpCategoriesModel.fromJson(response.data);

      return helpCategories;
    }else{
      return null;
    }
  }

  static sendSupportRequest(SupportRequest request) async{
    var response = await Request.postData(Urls.SUPPORTREQUEST, request.toJson(), true);
    print(response);
    if(response.statusCode == 200) {
      print('data added');
      return true;
    }else{
      return false;
    }
  }
}