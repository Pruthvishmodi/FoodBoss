

import 'package:customer_app/Models/faq_model.dart';
import 'package:customer_app/utils/requests.dart';
import 'package:customer_app/utils/urls.dart';

class FaqCall{
  static getFaqs() async{
    var response = await Request.getData(Urls.FAQ_URL, false);
    if(response.statusCode == 200){
      var faqs = FaqMain.fromJson(response.data);
      print(faqs);
      return faqs;
    } else{
      return null;
    }
  }
}