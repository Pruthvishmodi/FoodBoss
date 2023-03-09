import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rider_app/controller/business_controller/store/store_controller.dart';

class GlobalStoreController extends GetxController {
  var tabIndex = (-1).obs;
  var secondTabIndex = (-1).obs;
  var selectedWidget = 0.obs;

  // var isSearch = false.obs;
  //  get searhAble => isSearch.value;

  // toggleSearch(){
  //   print('here');
  //   isSearch.value = !isSearch.value;
  //   isSearch.refresh;
  //   print(isSearch.value);
  // }

  // int get getIndex {
  //   return tabIndex.value;
  // }

  void changeTabIndex(int index, int id, int widget) async {
    StoreController controller = Get.put(StoreController(), permanent: false);
    // print('id $id');
    tabIndex.value = index;
    secondTabIndex.value = -1;
    changeWidgetIndex(widget);
    await controller.getSubCatagories(id);
  }

  void changeSecondTabIndex(int index, int id, bool isCat, int widget) async {
    StoreController controller = Get.put(StoreController(), permanent: false);
    print("called $id");
    secondTabIndex.value = index;
    // print(id);
    if (isCat) {
      changeWidgetIndex(widget);
      await controller.getCatagories(id);
    } else {
      // changeWidgetIndex(widget);
      Get.toNamed("/product-list-screen", arguments: {
        "id": id,
        "fromCat": isCat,
      });
      // await controller.getItems(id, true);
    }
  }

  void changeWidgetIndex(int index) {
    if (selectedWidget.value == index) {
      print(index);
      if (index < 2) {
        selectedWidget.value = selectedWidget.value + 1;
      }
    } else {
      selectedWidget.value = index;
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
