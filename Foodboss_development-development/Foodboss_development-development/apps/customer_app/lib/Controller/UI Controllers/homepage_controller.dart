import 'package:get/get.dart';

class HomePageController extends GetxController{

  var tabIndex = 0.obs;

  void changeTabIndex(int index) async {
    tabIndex.value = index;
    // print(index);
    // if (index == 4) {
    //   if (controller.profile.value.data == null) {
    //     await controller.getProfile();
    //   }
    // } else if (index == 2) {
    //   if (controllerStore.catItems.value.length <= 0) {
    //     await controllerStore.getCatCotroller();
    //   }
    // } else if (index == 3) {
    //   // print(3);
    //   // Get.snackbar(
    //   //     "title", "message ${controllerPlan.planList.length.toString()} ");
    //   if (controllerPlan.data.value.data == null) {
    //     await controllerPlan.getPlanData();
    //   }
    //   // Get.snackbar("title", controllerPlan.planList.length.toString());
    //   // }
    // }
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