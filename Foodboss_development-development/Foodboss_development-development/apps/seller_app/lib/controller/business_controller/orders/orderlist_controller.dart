import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/infrastructure/fcm_services/fcm_service.dart';
import 'package:seller_app/infrastructure/orders/order_services.dart';
import 'package:seller_app/models/orders/get_completed_orders.dart';
import 'package:seller_app/models/orders/order_crp_model.dart';
import 'package:seller_app/models/orders/order_list_model.dart';
import 'package:seller_app/models/orders/order_status_model.dart';
import 'package:seller_app/screens/orders%20screen/assign_rider.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class OrderListController extends GetxController {
  var _state = States.INITIAL_STATE.obs;
  var ord_reason = 'stock unavailable'.obs;
  var pd_reason = 'stock unavailable'.obs;
  var code = '0000'.obs;
  RxList<String> reasons = [
    'stock unavailable',
    'user is fake',
    'distance is far',
    'Other',
  ].obs;
  RxList<int> selected = <int>[].obs;
  Rx<OrderListModel> order = OrderListModel().obs;
  Rx<CRPOrderModel> crp = CRPOrderModel().obs;
  Rx<OrderStatus> status = OrderStatus().obs;
  RxMap<int, OrderListModel> ordersAll = RxMap<int, OrderListModel>();

  Future<void> getStatus() async {
    _state.value = States.LOADING_STATE;
    try {
      OrderStatus? response = await OrderServices.getStatus();
      if (response == null) {
        _state.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar2(
            'Something went wrong while loading Status');
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
        } else {
          status.value = response;
          await getOrdersALl();
          _state.value = States.SUCCESS_STATE;
          // printInfo(info:ordersAll[1]!.data.toString());
        }
      }
    } catch (e) {
      printInfo(info: '$e errorin st');
      CustomSnackbar.errorSnackbar2('Server error');
      _state.value = States.ERROR_STATE;
    }
  }

  Future<void> getOrderByStatus({int status = 0}) async {
    // _state.value = States.LOADING_STATE;
    try {
      OrderListModel? response =
          await OrderServices.getOrderByStatus(statusId: status);
      // print(response);
      // OrderListModel response = OrderListModel();
      if (response == null) {
        _state.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar2(
            'Something went wrong while fetching Orders');
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
        } else {
          order.value = response;
          // ordersAll.addEntries({status : order.value});
          ordersAll[status] = order.value;
          printInfo(info: order.value.data.toString());
          // _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      printInfo(info: '$e errorin orddds');
      CustomSnackbar.errorSnackbar2('Server error');
      _state.value = States.ERROR_STATE;
    }
  }

  Future<void> getCrpOrders() async {
    // _state.value = States.LOADING_STATE;
    try {
      CRPOrderModel? response = await OrderServices.getCRP();

      // print(response);
      // OrderListModel response = OrderListModel();
      if (response == null) {
        _state.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar2(
            'Something went wrong while fetching Orders');
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
        } else {
          crp.value = response;
          printInfo(info: crp.value.data!.newOrders!.length.toString());
          // ordersAll.addEntries({status : order.value});
          // ordersAll[status] = order.value;
          // printInfo(info:order.value.data.toString());
          // _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      printInfo(info: '$e errorin crp');
      CustomSnackbar.errorSnackbar2('Server error');
      _state.value = States.ERROR_STATE;
    }
  }

  var completed = GetCompletedList().obs;
  Future<void> getCompletedOrders() async {
    // _state.value = States.LOADING_STATE;
    try {
      GetCompletedList? response = await OrderServices.getCompleted();
      // print(response);
      // OrderListModel response = OrderListModel();
      if (response == null) {
        _state.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar2(
            'Something went wrong while fetching Orders');
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
        } else {
          completed.value = response;
          // printInfo(info: crp.value.data!.newOrders!.length.toString());
          // ordersAll.addEntries({status : order.value});
          // ordersAll[status] = order.value;
          // printInfo(info:order.value.data.toString());
          // _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      printInfo(info: '$e errorin crp');
      CustomSnackbar.errorSnackbar2('Server error');
      _state.value = States.ERROR_STATE;
    }
  }

  getOrdersALl() async {
    try {
      for (StatusData item
          in status.value.data != null ? status.value.data! : []) {
        print("object ord hello ${item.id}");
        if (item.id == 7) {
          printInfo(info: "here iam  ${item.id.toString()}");
          await getCrpOrders();
          ordersAll[7] = OrderListModel();
        } else if (item.id == 5) {
          // printInfo(info: "here iam  ${item.id.toString()}");
          await getCompletedOrders();
          ordersAll[5] = OrderListModel();
        } else {
          await getOrderByStatus(status: item.id!);
        }
      }
    } catch (e) {
      printInfo(info: e.toString());
      if (_state.value != States.ERROR_STATE) {
        _state.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar2('Server error');
      }
    }
  }

  var selectedPending = [].obs;

  changeStatus({int ord_id = 0, int st_id = 0, String fcmToken = ''}) async {
    try {
      bool success =
          await OrderServices.changeStatus(id: ord_id, status: st_id);
      if (success) {
        if (ordersAll[1] != null && ordersAll[1]!.data != null) {
          // ordersAll[st_id]!=null?ordersAll[st_id]!.data!=null?ordersAll[st_id]!.data!.add(ordersAll[1]!.data!.firstWhere((element) => element.id != ord_id)):printInfo(info:'null'):printInfo(info: 'null all');
          ordersAll[1] = OrderListModel(
              success: true,
              data: ordersAll[1]!
                  .data!
                  .where((element) => element.id != ord_id)
                  .toList());
          ordersAll.refresh();
          FCMService.sendNotifications(
              'FoodBoss', 'Your Order $ord_id is packed', fcmToken);
          CustomSnackbar.SucessSnackbar('Item packed');
        } else {
          CustomSnackbar.errorSnackbar2('Can not pack item');
        }
      } else {
        CustomSnackbar.errorSnackbar2('Can not pack item');
      }
    } catch (e) {
      printInfo(info: '$e printhere');
      CustomSnackbar.errorSnackbar2('Server error');
    }
  }

  cancelOder({
    int ord_id = 0,
    int st_id = 1,
  }) async {
    try {
      var success = await OrderServices.cancelOrder(
          id: ord_id, status: st_id, reason: ord_reason.value);
      if (success == true) {
        if (ordersAll[1] != null && ordersAll[1]!.data != null) {
          // ordersAll[6]!=null?ordersAll[6]!.data!=null?ordersAll[6]!.data!.add(ordersAll[1]!.data!.firstWhere((element) => element.id != ord_id)):printInfo(info:'null'):printInfo(info: 'null all');
          ordersAll[1] = OrderListModel(
              success: true,
              data: ordersAll[1]!
                  .data!
                  .where((element) => element.id != ord_id)
                  .toList());
          ordersAll.refresh();
          CustomSnackbar.SucessSnackbar('Order cancelled');
        } else {
          CustomSnackbar.errorSnackbar2('Can not cancel order');
        }
      } else {
        CustomSnackbar.errorSnackbar2(
            'Can not cancel order $success $st_id $ord_id');
      }
    } catch (e) {
      printInfo(info: '$e printhere');
      CustomSnackbar.errorSnackbar2('Server error');
    }
  }

  cancelProductOder(
    int ord_id,
    int st_id,
    int prod_id,
  ) async {
    try {
      print(ord_id);
      print(st_id);
      print(pd_reason.value);
      print(prod_id);
      bool success = await OrderServices.cancelProductOrder(
          id: ord_id, status: 2, reason: pd_reason.value, prod_id: prod_id);
      if (success) {
        // if (ordersAll[st_id] != null && ordersAll[st_id]!.data != null) {
        //   ordersAll[6] != null
        //       ? ordersAll[6]!.data != null
        //           ? ordersAll[6]!.data!.add(ordersAll[st_id]!
        //               .data!
        //               .firstWhere((element) => element.id != ord_id))
        //           : printInfo(info: 'null')
        //       : printInfo(info: 'null all');
        //   ordersAll[st_id] = OrderListModel(
        //       success: true,
        //       data: ordersAll[st_id]!
        //           .data!
        //           .where((element) => element.id != ord_id)
        //           .toList());
        //   ordersAll.refresh();
        // } else {
        //   CustomSnackbar.errorSnackbar2('Can not remove productt');
        // }
        getOrderByStatus(status: 1);
        CustomSnackbar.SucessSnackbar('Product removed');
      } else {
        CustomSnackbar.errorSnackbar2('Can not remove product');
      }
    } catch (e) {
      printInfo(info: '$e printhere');
      CustomSnackbar.errorSnackbar2('Server error');
    }
  }

  assignRider({
    int driver_id = 0,
    bool isTrusted = false,
  }) async {
    try {
      bool success = await OrderServices.assignRider(
          id: selected.join(','), driver_id: driver_id);
      printInfo(info: 'rider ${selected.join(',')} $driver_id');
      if (success) {
        // CustomSnackbar.SucessSnackbar('Rider assigned');
        print(isTrusted);
        if (isTrusted == true) {
          selected.forEach((element) async {
            print(element);
            bool successMain =
                await OrderServices.changeStatus(id: element, status: 4);
            printInfo(info: ordersAll[3]!.data!.length.toString());
            ordersAll[3]!.data!.forEach((ele) {
              printInfo(info: ele.id.toString());
              if (element == ele.id) {
                // print(ele.customer!.fcmToken);
                // asignedist.add(ele.customer!.fcmToken);
                FCMService.sendNotifications('FoodBoss', 'You order is shipped',
                    ele.customer!.fcmToken.toString());
              }
            });
          });
          Get.back();
          Get.back();
          CustomSnackbar.SucessSnackbar(
              'Order Assigned to trusted delivery boy');
          print('heree');
        } else {
          await openBottomsheet(driver_id);
        }
        selected.clear();
      } else {
        CustomSnackbar.errorSnackbar2('Can not assign rider');
      }
    } catch (e) {
      printInfo(info: '$e printhere');
      CustomSnackbar.errorSnackbar2('Server error');
    }
  }

  openBottomsheet(int id) {
    Get.bottomSheet(
      Wrap(
        children: [
          Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                    // padding: ,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const MainLabelText(titleString: "Add code")),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OtpFormFields(driver_id: id),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: PrimaryButton(
                              text: "Item Collected",
                              op: () {
                                Get.back();
                                Get.back();
                              },
                              type: "filled")),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: ThemeConfig.WHITE_COLOR,
    );
  }

  generateCode({int driver_id = 0}) async {
    try {
      String success = await OrderServices.generateCode(driver_id: driver_id);
      // printInfo(info:'rider ${selected.length} $driver_id');
      if (success != '0000') {
        // CustomSnackbar.SucessSnackbar('Rider assigned');
        code.value = success;
        // selected.clear();
      } else {
        CustomSnackbar.errorSnackbar2('Can not assign rider');
      }
    } catch (e) {
      printInfo(info: '$e printhere');
      CustomSnackbar.errorSnackbar2('Server error');
    }
  }

  pickUp({
    String pick_up = '',
    int driver_id = 0,
  }) async {
    try {
      bool success = await OrderServices.pickUp(
          pickup_code: pick_up, driver_id: driver_id);
      if (success) {
        selected.forEach((element) async {
          print(element);
          bool successMain =
              await OrderServices.changeStatus(id: element, status: 4);
          printInfo(info: ordersAll[3]!.data!.length.toString());
          ordersAll[3]!.data!.forEach((ele) {
            printInfo(info: ele.id.toString());
            if (element == ele.id) {
              // print(ele.customer!.fcmToken);
              // asignedist.add(ele.customer!.fcmToken);
              FCMService.sendNotifications('FoodBoss', 'You order is shipped',
                  ele.customer!.fcmToken.toString());
            }
          });
        });
        Get.back();
        Get.back();
        CustomSnackbar.SucessSnackbar('Rider assigned');
      } else {
        CustomSnackbar.errorSnackbar2('Can not assign rider');
      }
    } catch (e) {
      printInfo(info: '$e printhere');
    }

    generatPdf(id) {}

    @override
    void onInit() {
      print('here');
      super.onInit();
    }

    @override
    void dispose() {
      super.dispose();
    }
  }
}
