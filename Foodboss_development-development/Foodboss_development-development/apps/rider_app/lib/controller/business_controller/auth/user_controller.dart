import 'package:get/get.dart';

import '../../../models/auth/UserModel.dart';

class UserController extends GetxController{

  var user = User().obs;

  User get getUser => user.value;

  void saveUserInfo(User u){
    print('user data is set');
     user.value = u;
  }
}