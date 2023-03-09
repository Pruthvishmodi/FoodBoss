import 'package:customer_app/utils/token_service.dart';
import 'package:dio/dio.dart';

class Request {
  static getData(String url, bool tokenRelated) async {
    // code hhtp
    Dio dio = Dio();
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
    Dio dio = Dio();
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

  static putData(String url, body,bool tokenRelated) async {
    // code
    Dio dio = Dio();
    if (tokenRelated) {
      var token = await TokenService.getToken();
      dio.options.headers["Authorization"] = "Bearer $token";
      // var response = await dio.get(url);
      var response = await dio.put(
        url,
        data: body,
      );
      return response;
    } else {
      // var response = await dio.get(url);
      var response = await dio.put(url, data: body);
      return response;
    }
  }
  
  static deleteData(String url, body, bool tokenRelated) async {
    // code
    Dio dio = Dio();
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
