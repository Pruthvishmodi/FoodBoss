import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/my_store/my_store_controller.dart';
import 'package:seller_app/controller/business_controller/store/store_controller.dart';
import 'package:seller_app/infrastructure/store_service.dart';
import 'package:seller_app/models/store/items.dart';
import 'package:seller_app/screens/global_store_screen/modals.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';

class ProductListController extends GetxController {
  RxList<int> _selectedItemIndex = RxList();

  RxList<ListItemData> _selectedData = RxList();
  MyStoreController controller = Get.put(MyStoreController());

  List get selectedIndexs => _selectedItemIndex.value;
  List<ListItemData> get selectedData => _selectedData.value;

  addIndex(int index) {
    if (_selectedItemIndex.contains(index)) {
      _selectedItemIndex.remove(index);
    } else {
      _selectedItemIndex.add(index);
    }
  }

  var _productAddingStatus = States.INITIAL_STATE.obs;

  addProductsToMyStore(List<ListItemData> list, BuildContext context) async {
    _productAddingStatus.value = States.LOADING_STATE;
    try {
      bool response =
          await StoreService.appProducts(SelectedItems(litsOfItems: list));

      if (response) {
        controller.getCatCotroller();
        CustomSnackbar().showDefaultSuccessSnackbar(context);
        Get.back();
        _productAddingStatus.value = States.SUCCESS_STATE;
      } else {
        CustomSnackbar().showDefaultErrorSnackbar(context);
        Get.back();
        _productAddingStatus.value = States.ERROR_STATE;
      }
    } catch (e) {
      print(e);
      CustomSnackbar().showDefaultErrorSnackbar(context);
      Get.back();
      _productAddingStatus.value = States.ERROR_STATE;
    }
  }

  bool checkIndex(index) {
    if (_selectedItemIndex.contains(index)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _selectedItemIndex.value = [];
    super.onClose();
  }

  @override
  void onInit() {
    _selectedItemIndex.value = [];
    // TODO: implement onInit
    print("object");
    super.onInit();
  }

  @override
  void dispose() {
    _selectedItemIndex.value = [];
    print("object");
    // TODO: implement dispose
    // controller.dispose();
    super.dispose();
  }
}
