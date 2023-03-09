
import 'package:customer_app/Models/address_model.dart';
import 'package:customer_app/utils/requests.dart';
import 'package:customer_app/utils/urls.dart';

class AddressServices{

  static getAddresses()async{
    var response = await Request.getData(Urls.GETADDRESS, true);

    if(response.statusCode == 200){
      return AddressesModel.fromJson(response.data);
    }else{
      return false;
    }
    
  }

  static addAddress(Address address)async{
    var response = await Request.postData(Urls.ADDADDRESS,address.toJson(), true);

    if(response.statusCode == 200){
      print(response.data['success']);
      return response.data['success'];
    }else{
      return false;
    }
    
  }

  static updateAddres(Address address)async{
    var response = await Request.putData(Urls.UPDATEADDRESS,address.toJson(), true);
    print(response);
    if(response.statusCode == 200){
      print(response.data['success']);
      return response.data['success'];
    }else{
      return false;
    }
    
  }


  static deleteAddress(id)async{
    var response = await Request.deleteData(Urls.DELETEADDRESS,{"address_id" : id}, true);

    if(response.statusCode == 200){
      print(response.data['success']);
      return response.data['success'];
    }else{
      return false;
    }
    
  }
}