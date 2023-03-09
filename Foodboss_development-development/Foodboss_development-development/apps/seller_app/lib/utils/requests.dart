import 'package:dio/dio.dart';
import 'package:seller_app/infrastructure/token_service.dart';
import 'package:seller_app/utils/urls.dart';

class Request {
  static getData(String url, bool tokenRelated) async {
    // code hhtp
    Dio dio = new Dio();
    if (tokenRelated) {
      var token = await TokenService.getToken();
      print("token $token");
      if (token != null) {
        print("called token $url");
        dio.options.headers["Authorization"] = "Bearer $token";
        var response = await dio.get(url);
        return response;
      } else {
        return null;
      }
    } else {
      var response = await dio.get(url);
      return response;
    }
  }

  static postData(String url, body, bool tokenRelated) async {
    // code
    print(url);
    Dio dio = new Dio();
    if (tokenRelated) {
      var token = await TokenService.getToken();
      dio.options.headers["Authorization"] = "Bearer $token";
      // var response = await dio.get(url);
      var response = await dio.post(
        url,
        data: body,
      );
      return response;
    } else {
      // var response = await dio.get(url);
      var response = await dio.post(url, data: body);
      return response;
    }
  }

  static putData(String url, body) async {
    // code
  }
  static deleteData(String url, body, bool tokenRelated) async {
    // code
    Dio dio = new Dio();
    if (tokenRelated) {
      var token = await TokenService.getToken();
      dio.options.headers["Authorization"] = "Bearer $token";
      // var response = await dio.get(url);
      var response = await dio.delete(
        url,
        data: body,
      );
      return response;
    } else {
      // var response = await dio.get(url);
      var response = await dio.delete(url, data: body);
      return response;
    }
  }
}

// class Video {
//   static getVideos() {
//     Request.getData(Urls.VIDEO_URL);

//   }

//   static getVideo() {}
// }
