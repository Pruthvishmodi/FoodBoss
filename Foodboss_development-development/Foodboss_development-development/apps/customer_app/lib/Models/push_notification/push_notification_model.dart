class NotificationsModel {
  String? to;
  Notification? notification;

  NotificationsModel({this.to, this.notification});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    notification = json['notification'] != null
        ? new Notification.fromJson(json['notification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = this.to;
    if (this.notification != null) {
      data['notification'] = this.notification!.toJson();
    }
    return data;
  }
}

class Notification {
  String? body;
  String? title;

  Notification({this.body, this.title});

  Notification.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['title'] = this.title;
    return data;
  }
}
