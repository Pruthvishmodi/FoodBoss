import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/auth/profile_controller.dart';
import 'package:seller_app/controller/business_controller/my_store/my_store_controller.dart';
import 'package:seller_app/controller/business_controller/orders/orderlist_controller.dart';
import 'package:seller_app/controller/plan_controller.dart';

class LandingPageController extends GetxController {
  ProfileController controller = Get.put(ProfileController(), permanent: false);
  MyStoreController controllerStore =
      Get.put(MyStoreController(), permanent: false);
  PlanController controllerPlan = Get.put(PlanController(), permanent: false);
  OrderListController controllerOrder = Get.put(OrderListController(), permanent: false);
  var tabIndex = 0.obs;

  void changeTabIndex(int index) async {
    tabIndex.value = index;
    // print(index);
    if (index == 4) {
      if (controller.profile.value.data == null) {
        await controller.getProfile();
      }
    } else if (index == 1) {
      // if (controllerOrder.status.value.data!=null || controllerOrder.status.value.data!.isEmpty) {
        await controllerOrder.getStatus();
      // }
    } else if (index == 2) {
      if (controllerStore.catItems.value.isEmpty) {
        await controllerStore.getCatCotroller();
      }
    } else if (index == 3) {
      // print(3);
      // Get.snackbar(
      //     "title", "message ${controllerPlan.planList.length.toString()} ");
      if (controllerPlan.data.value.data == null) {
        await controllerPlan.getPlanData();
      }
      // Get.snackbar("title", controllerPlan.planList.length.toString());
      // }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
