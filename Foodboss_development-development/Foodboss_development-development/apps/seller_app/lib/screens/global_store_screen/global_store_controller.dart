import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/store/store_controller.dart';

class GlobalStoreController extends GetxController {
  StoreController controller = Get.find<StoreController>();
  var tabIndex = (-1).obs;
  var secondTabIndex = (-1).obs;
  var selectedWidget = 0.obs;
  var shouldCall = true.obs;

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

  void changeTabIndex(int index, int id, int widget) {
    // print('id $id');
    print(controller.subCatLoading.value);
    if (tabIndex.value != id) {
      controller.subCatLoading.value = true;
      controller.subCatagories.value?.data = [];
      print("hello called sh");
      print(id);
      print(tabIndex.value);
      tabIndex.value = id;
      shouldCall.value = true;
    } else {
      shouldCall.value = false;
    }
    secondTabIndex.value = -1;
    changeWidgetIndex(widget);
    print(controller.subCategoryList);
    // await controller.getSubCatagories(id);
  }

  void apiCallOnCat(BuildContext context) async {
    if (shouldCall.value) {
      // print("shouldcall");
      // print(shouldCall.value);
      await controller.getSubCatagories(tabIndex.value, context);
    }
  }

  void apiCallOnSubCat() async {
    if (shouldCall.value) {
      await controller.getCatagories(secondTabIndex.value);
    }
  }

  void changeSecondTabIndex(int index, int id, bool isCat, int widget) {
    // StoreController controller = Get.find<StoreController>();
    print("called $id");
    // print(id);
    if (isCat) {
      if (secondTabIndex.value != id) {
        controller.childCatLoading.value = true;
        controller.catagories.value?.data = [];
        secondTabIndex.value = id;
        shouldCall.value = true;
      } else {
        shouldCall.value = false;
      }
      changeWidgetIndex(widget);
      // await controller.getCatagories(id);
    } else {
      // changeWidgetIndex(widget);
      Get.toNamed("/product-list-screen",
          arguments: {"id": id, "fromCat": isCat, "fromSearch": false});
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
    controller.dispose();
    super.dispose();
  }
}
