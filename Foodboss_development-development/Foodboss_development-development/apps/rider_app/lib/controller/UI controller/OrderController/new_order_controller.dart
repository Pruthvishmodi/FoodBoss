import 'package:get/get.dart';
import 'package:rider_app/infrastructure/OrderCall/completed_order_call.dart';
import 'package:rider_app/infrastructure/OrderCall/new_order_call.dart';
import 'package:rider_app/infrastructure/OrderCall/pay_return_call.dart';
import 'package:rider_app/infrastructure/OrderCall/shipped_order_call.dart';
import 'package:rider_app/models/order/completed_order_model.dart';
import 'package:rider_app/models/order/new_order_model.dart';
import 'package:rider_app/models/order/new_order_store_model.dart';
import 'package:rider_app/models/order/pay_return_model.dart';
import 'package:rider_app/models/order/shipped_order_model.dart';
import 'package:rider_app/utils/states.dart';
// import 'package:xml/xml.dart' as xml;

class NewOrderController extends GetxController {
  var orders = NewOrderModel().obs;
  var isPod = false.obs;

  RxList<NewOrdersStore> _selectedItems = RxList<NewOrdersStore>();
  // RxMap<int,>
  // List<NewOrdersStore>? get itemList => orders.value.orderList;
  List<NewOrdersStore> get selectedItemList {
    // makeControllers();
    // print('controller created');
    return _selectedItems.value;
  }

  RxList<int> _selectedItemIndex = RxList();

  RxList<NewOrdersStore> _selectedData = RxList();

  List get selectedIndexs => _selectedItemIndex.value;
  List<NewOrdersStore> get selectedData => _selectedData.value;

  var _data = NewOrderModel().obs;
  var shipped = ShippedOrderModel().obs;
  var _completed = CompletedOrderModel().obs;
  var _payReturn = PayReturnModel().obs;
  var _storeOrder = NewOrderByStoreModel().obs;

  var _state = States.INITIAL_STATE.obs;

  String get status => _state.value;
  String get shippedStatus => _state.value;
  String get completedStatus => _state.value;
  String get payReturnStatus => _state.value;

  NewOrderByStoreModel get storeOrder => _storeOrder.value;
  NewOrderModel get data => _data.value;
  ShippedOrderModel get shippedd => shipped.value;
  CompletedOrderModel get completed => _completed.value;
  PayReturnModel get payReturn => _payReturn.value;

  // selectItem(int id) {
  //   if (orders.value
  //       .singleWhere((element) => element.id == id)
  //       .isSelected!) {
  //     orders.value!.data!.singleWhere((element) => element.id == id).isSelected =
  //         false;
  //     // print(items.value!.data!
  //     //     .singleWhere((element) => element.id == id)
  //     //     .isSelected!);
  //   } else {
  //     orders.value!.data!.singleWhere((element) => element.id == id).isSelected =
  //         true;
  //     // print(items.value!.data!
  //     //     .singleWhere((element) => element.id == id)
  //     //     .isSelected!);
  //   }
  //   orders.refresh();
  // }

  Future<void> getNewOrderData() async {
    _state.value = States.LOADING_STATE;
    try {
      NewOrderModel response = await NewOrderCall.getNewOrder();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something went wrong while loading videos');
      } else {
        {
          _data.value = response;
          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print(e);
      Get.snackbar("Opps", "Something went wrong");
      _state.value = States.ERROR_STATE;
    }
  }

  var newOrderStatus = States.INITIAL_STATE.obs;
  var orderByStore = NewOrderByStoreModel().obs;
  Future<void> getNewOrderbyStoreData(int id) async {
    newOrderStatus.value = States.LOADING_STATE;
    try {
      var response = await NewOrderCall.getNewOrderbyStore(id);
      print(response);
      if (response == null) {
        newOrderStatus.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something went wrong while loading videos');
      } else {
        {
          // _storeOrder = response;
          orderByStore.value = response;
          newOrderStatus.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print(e);
      Get.snackbar("Opps", "Dio eDrror");
      newOrderStatus.value = States.ERROR_STATE;
    }
  }

  Future<void> getShippedOrderData() async {
    _state.value = States.LOADING_STATE;
    try {
      ShippedOrderModel response = await ShippedOrderCAll.getShippedOrder();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something went wrong while loading videos');
      } else {
        {
          shipped.value = response;
          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print("E $e");
      Get.snackbar("Opps", "Dio eError");
      _state.value = States.ERROR_STATE;
    }
  }

  Future<void> getCompletedOrderData() async {
    _state.value = States.LOADING_STATE;
    try {
      CompletedOrderModel response =
          await CompletedOrderCAll.getCompletedOrder();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something went wrong while loading videos');
      } else {
        {
          print(response);
          _completed.value = response;
          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print("F $e");
      Get.snackbar("Opps", "Dio eFrror");
      _state.value = States.ERROR_STATE;
    }
  }

  Future<void> getPayReturnOrderData() async {
    _state.value = States.LOADING_STATE;
    try {
      PayReturnModel response = await PayReturnCall.getPayReturnOrder();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something went wrong while loading videos');
      } else {
        {
          _payReturn.value = response;
          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print(e);
      Get.snackbar("Opps", "Dio eGrror");
      _state.value = States.ERROR_STATE;
    }
  }

  @override
  void onInit() {
    getNewOrderData();
    getShippedOrderData();
    getCompletedOrderData();
    getPayReturnOrderData();

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
