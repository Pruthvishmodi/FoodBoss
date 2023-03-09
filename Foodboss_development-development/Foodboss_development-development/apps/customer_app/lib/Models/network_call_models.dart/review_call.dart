
import 'package:customer_app/Models/SupportRequestModel.dart';
import 'package:customer_app/Models/add_review_model.dart';
import 'package:customer_app/Models/help_category_model.dart';
import 'package:customer_app/utils/requests.dart';
import 'package:customer_app/utils/urls.dart';


class ReviewCall{



  static sendReview(AddReviewModel request) async{
    var response = await Request.postData(Urls.REVIEWREQUEST, request.toJson(), true);
    print(response);
    if(response.statusCode == 200) {
      print('data added');
      return true;
    }else{
      return false;
    }
  }
}