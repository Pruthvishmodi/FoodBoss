import 'package:get/get.dart';
import 'package:seller_app/infrastructure/store_service.dart';
import 'package:seller_app/models/auth/UserModel.dart';
import 'package:seller_app/models/shop_close_request.dart';

class UserController extends GetxController{

  var user = User().obs;

  

  User get getUser => user.value;

  void saveUserInfo(User u){
    print('user data is set');
     user.value = u;
  }
}