import 'package:customer_app/Models/my_khata_list.dart';
import 'package:customer_app/Models/network_call_models.dart/get_fav_food_call.dart';
import 'package:customer_app/Models/network_call_models.dart/get_fav_store_call.dart';
import 'package:customer_app/Models/network_call_models.dart/order_history_model.dart';
import 'package:customer_app/Models/network_call_models.dart/product_detail_call.dart';
import 'package:customer_app/utils/requests.dart';
import 'package:customer_app/utils/urls.dart';

class KhataServices{

  static getKhataList()async{
    var respones = await Request.getData(Urls.GETMYKHATAS,true);
    print("here $respones");
    if(respones.statusCode == 200){
      return MyKhataList.fromJson(respones.data);
    }else{
      return null;
    }
  }
  
   static getKhataDetails(int id)async{
    var respones = await Request.getData(Urls.GETKHATADETAILS(id),true);
      print(respones.data["data"]);
    if(respones.statusCode == 200){
      return Khata.fromDetailsJson(respones.data["data"]);
    }else{
      return null;
    }
  }

    static checkKhataRequest(int storeid)async{
    print('{"shop_id" : ${storeid}}');
    var response = await Request.postData(Urls.CHECKKHATAREQUEST, '{"shop_id" : ${storeid}}',true);
    print(response);
    if(response.statusCode == 200){
      return response.data['success'];
    }else{
      return false;
    }
  }

   static addKhataRequest(int storeid)async{
    print('{"shop_id" : ${storeid}}');
    var response = await Request.postData(Urls.ADDKHATAREQUEST, '{"shop_id" : ${storeid}}',true);
    print(response);
    if(response.statusCode == 200){
      return response.data['success'];
    }else{
      return false;
    }
  }


  
}