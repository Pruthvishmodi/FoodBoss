import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rider_app/infrastructure/OrderCall/collect_Order_call.dart';
import 'package:rider_app/models/order/order_collect_model.dart';
import 'package:rider_app/utils/states.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class CollectOrderController extends GetxController {
  var _requestStatus = States.INITIAL_STATE.obs;

  bool isSent = false;

  // var _shopId = ''.obs;
  var _orderId = ''.obs;

  // String get shop => _shopId.value;

  String get order => orderIds.value.join(',');

  var orderIds = [].obs;

  // addShopId(int val) {
  //   _shopId.value = val.toString();
  // }

  // addOrderId(int val) {
  //   _orderId.value = val.toString();
  // }
  // codeSheet(code) {
  //   // list = controllerGet.selectedItemList;
  //   Get.bottomSheet(Container(
  //     decoration: const BoxDecoration(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(20),
  //         topRight: Radius.circular(20),
  //       ),
  //       color: ThemeConfig.WHITE_COLOR,
  //     ),
  //     padding: const EdgeInsets.only(bottom: 3, left: 20, right: 20, top: 20),
  //     child: Container(
  //       child: Text(code.toString()),
  //       // child: Text('Hello'),
  //     ),
  //   ));
  // }
  codeSheet(code) {
    // list = controllerGet.selectedItemList;
    Get.bottomSheet(Container(
      height: 250,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: ThemeConfig.WHITE_COLOR,
      ),
      padding: const EdgeInsets.only(bottom: 3, left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainLabelText(
              titleString: 'Generated code for Order Collection:'),
          // SizedBox(
          //   height: 20,
          // ),
          Expanded(
            child: Center(
              child: Text(
                '${code.toString()}',
                style: const TextStyle(
                    letterSpacing: 30,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> sendCollectOrderRequest(
    String shopId,
  ) async {
    CollectOrderodel request = CollectOrderodel(
      orderId: order,
      shopId: shopId,
    );
    print(request.toJson().toString());
    _requestStatus.value = States.LOADING_STATE;
    try {
      var res = await CollectOrderCall.sendCollectRequest(request);
      if (res == false) {
        Get.snackbar('Error', 'Something went wrong');
      } else {
        _requestStatus.value = States.SUCCESS_STATE;
        // Get.snackbar('Success', 'order request Added');
        print(res['code']);
        // getCollectCode(res['code']);
        codeSheet(res['code']);
      }
    } catch (e) {
      print(e);
      Get.snackbar('Opps', 'Something went wrongrrrr');
      _requestStatus.value = States.ERROR_STATE;
    }
  }

  // var _data = CollectOrderodel().obs;
  // var _state = States.INITIAL_STATE.obs;

  // String get status => _state.value;

  // CollectOrderodel get data => _data.value;

  // Future<void> getCollectCode(code) async {
  //   _state.value = States.LOADING_STATE;
  //   try {
  //     CollectOrderodel response = await CollectOrderCall.getCode();
  //     print(response);
  //     if (response == null) {
  //       _state.value = States.ERROR_STATE;
  //       Get.snackbar('Error', 'Something went');
  //     } else {
  //       if (response.success == false) {
  //         _state.value = States.ERROR_STATE;
  //         Get.snackbar('Error', 'errrorr');
  //       } else {
  //         // var raw = xml.parse(response.data!.privacyText!);
  //         // var priivcy = raw.findAllElements('#text');
  //         // print(priivcy);

  //         _data.value = response;
  //         _state.value = States.SUCCESS_STATE;
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //     Get.snackbar("Opps", "Something went wrongrrr");
  //     _state.value = States.ERROR_STATE;
  //   }
  // }

  @override
  void onInit() {
    // getCollectCode();
    // TODO: implement onInit

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
