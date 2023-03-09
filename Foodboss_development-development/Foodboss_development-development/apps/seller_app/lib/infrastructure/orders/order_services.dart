import 'package:seller_app/models/orders/get_completed_orders.dart';
import 'package:seller_app/models/orders/order_crp_model.dart';
import 'package:seller_app/models/orders/order_list_model.dart';
import 'package:seller_app/models/orders/order_status_model.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class OrderServices {
  static getOrderByStatus({int statusId = 0}) async {
    var response =
        await Request.getData(Urls.ORDER_BY_STATUS(id: statusId), true);
    print(response.data);
    if (response.statusCode == 200) {
      OrderListModel orders = OrderListModel.fromJson(response.data);
      return orders;
    } else {
      return OrderListModel();
    }
  }

  static getOrderByStatussss(int statusId) async {
    var response =
        await Request.getData(Urls.ORDER_BY_STATUS(id: statusId), true);
    print('aaasa ${response.data}');
    if (response.statusCode == 200) {
      // OrderListModel orders = OrderListModel.fromJson(response.data);
      return response.data;
    } else {
      return null;
    }
  }

  static getStatus() async {
    var response = await Request.getData(Urls.ORDER_STATUS, true);
    if (response.statusCode == 200) {
      OrderStatus status = OrderStatus.fromJson(response.data);
      // print(response.data);
      return status;
    } else {
      return OrderListModel();
    }
  }

  static getCRP() async {
    var response = await Request.getData(Urls.CRP_URL, true);
    if (response.statusCode == 200) {
      CRPOrderModel status = CRPOrderModel.fromJson(response.data);
      // print(response.data);
      return status;
    } else {
      return OrderListModel();
    }
  }

  static getCompleted() async {
    var response = await Request.getData(Urls.COMPLETED_URL, true);
    if (response.statusCode == 200) {
      GetCompletedList status = GetCompletedList.fromJson(response.data);
      // print(response.data);
      return status;
    } else {
      return GetCompletedList();
    }
  }

  static Future<bool> changeStatus({int id = 0, int status = 0}) async {
    var response = await Request.postData(Urls.ORDER_STATUS_CHANGE,
        {"order_id": id, "order_status_id": status}, true);
    if (response.statusCode == 200) {
      if (response.data != null) {
        return response.data['success'];
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static Future cancelOrder(
      {int id = 0, int status = 0, String reason = ''}) async {
    var response = await Request.postData(Urls.ORDER_CANCEL,
        {"order_id": id, "order_status_id": status, "reason": reason}, true);
    if (response.statusCode == 200) {
      if (response.data != null) {
        return response.data['success'];
      } else {
        return 'false main';
      }
    } else {
      return 'false ma';
    }
  }

  static Future<bool> cancelProductOrder(
      {int id = 0, int status = 2, String reason = '', int prod_id = 0}) async {
    print(status);

    print({
      "order_id": id,
      "order_status_id": "2",
      "reason": reason,
      "product_id": prod_id
    }.toString());
    var response = await Request.postData(
        Urls.ORDER_PRODUCT_CANCEL,
        {
          "order_id": id,
          "order_status_id": "2",
          "reason": reason,
          "product_id": prod_id
        },
        true);
    print(response);
    if (response.statusCode == 200) {
      if (response.data != null) {
        return response.data['success'];
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static Future<bool> assignRider({
    String id = '',
    int driver_id = 0,
  }) async {
    print('{"order_ids": $id, "driver_id": $driver_id}');
    var response = await Request.postData(
        Urls.ASSIGN_RIDER, {"order_ids": id, "driver_id": driver_id}, true);
    if (response.statusCode == 200) {
      print(response);
      if (response.data != null) {
        return response.data['success'];
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static Future<String> generateCode({
    int driver_id = 0,
  }) async {
    var response =
        await Request.postData(Urls.CODE_GEN, {"driver_id": driver_id}, true);
    if (response.statusCode == 200) {
      if (response.data != null) {
        return response.data['code'].toString();
      } else {
        return '0000';
      }
    } else {
      return '0000';
    }
  }

  static Future<bool> pickUp({
    String pickup_code = '',
    int driver_id = 0,
  }) async {
    var response = await Request.postData(Urls.PICKUP_API,
        {"pickup_code": pickup_code, "driver_id": driver_id}, true);
    if (response.statusCode == 200) {
      if (response.data != null) {
        return response.data['success'];
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
