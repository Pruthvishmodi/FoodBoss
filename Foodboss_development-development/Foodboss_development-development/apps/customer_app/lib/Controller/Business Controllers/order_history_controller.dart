import 'package:customer_app/Models/network_call_models.dart/order_detail_call.dart';
import 'package:customer_app/Models/network_call_models.dart/order_history_model.dart';
import 'package:customer_app/Services/general_services.dart';
import 'package:customer_app/Services/store_services.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  var orders = OrderHistoryCall().obs;
  var isLoading = false.obs;
  var orderList = [].obs;
  fetchOrderHistory() async {
    try {
      isLoading.value = true;
      var call = await GeneralServices.getOrderHistory();
      if (call != null) {
        orders.value = call;
        orderList.value = orders.value.data!.reversed.toList();
        isLoading.value = false;
      } else {
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  var details = GetOrderDetails().obs;

  fetchHistoryOrderDetails(int orderId) async {
    try {
      GetOrderDetails call = await StoreServices.getOrderDetails(orderId);

      if (call != null) {
        details.value = call;
        // if(ongoingOrders.value.orders![orderIndex].removedItems != null ){
        //   print('here');
        //   var removelist = [];
        //   ongoingOrders.value.orders![orderIndex].removedItems!.forEach((element) {
        //     print(element.id);
        //     ongoingOrders.value.orders![orderIndex].items!.remove(element);
        //   });
        //     // removelist.add(element);
        //   // removelist.forEach((element) {
        //   // });
        // }
        ;
      } else {
        Get.snackbar('Error', "something went wrong");
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', "Something went wrong");
    }
  }

  @override
  void onInit() {
    fetchOrderHistory();
    // TODO: implement onInit
    super.onInit();
  }
}
