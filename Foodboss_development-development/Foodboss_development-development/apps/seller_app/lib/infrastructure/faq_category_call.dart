import 'package:seller_app/models/faq_category.dart';
import 'package:seller_app/models/faq_modal.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class FaqCategoryCall{
  static getFaqsCategory() async{
    var response = await Request.getData(Urls.FAQCAEGORY_URL, false);
    if(response.statusCode == 200){
      var faqsCategory = FaqCategoryModel.fromJson(response.data);
      print(faqsCategory);
      return faqsCategory;
    } else{
      return null;
    }
  }
}