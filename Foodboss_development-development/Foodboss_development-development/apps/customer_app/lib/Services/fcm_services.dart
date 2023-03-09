import 'package:customer_app/Models/push_notification/push_notification_model.dart';
import 'package:dio/dio.dart';

class FCMService {
  static sendNotifications(String title, String text, String to) async {
    Dio dio = Dio();

    var notification = NotificationsModel(
        to: to, notification: Notification(title: title, body: text));
    dio.options.headers["Authorization"] =
        "Key=AAAAZ_eZypw:APA91bHJVFhQw_LZmt3lNEz5za_ifCh84b4770TM3FrQ7SVxQBRJ7iN7mtv6LaQJna0aXfHMlKEN02oFZf1jGd5guNOxOdeeAeCPO2NvXyeeqX-JuB-tyc-tAahNTAOsr0xTpOKVaXb-";
    // var response = await dio.get(url);
    var response = await dio.post("https://fcm.googleapis.com/fcm/send",
        data: notification.toJson());

    return response.data['success'] == 1 ? true : false;
  }
}
