import 'package:rider_app/utils/local_storage.dart';

class TokenService {
  static setToken(String token) async {
    print(token);
    return await LocalStorageOperations.setItem("token", token);
  }

  static getToken() async {
    return await LocalStorageOperations.getItem("token");
  }

  static removeAuth() async{
    await LocalStorageOperations.removeItem('token');
    await LocalStorageOperations.removeItem('username');
    await LocalStorageOperations.removeItem('email');
    await LocalStorageOperations.removeItem('phoneNumber');
  }

  static setUsername(String username) async {
    print(username);
    return await LocalStorageOperations.setItem("username", username);
  }

  static Future<String> getUsername() async {
    return await LocalStorageOperations.getItem("username");
  }
  
  static setEmail(String email) async {
    print(email);
    return await LocalStorageOperations.setItem("email", email);
  }

  static Future<String> getEmail() async {
    return await LocalStorageOperations.getItem("email");
  }
  
  static setPhoneNumber(String phoneNumber) async {
    print(phoneNumber);
    return await LocalStorageOperations.setItem("phoneNumber", phoneNumber);
  }

  static Future<String> getPhoneNumber() async {
    return await LocalStorageOperations.getItem("phoneNumber");
  }
}
