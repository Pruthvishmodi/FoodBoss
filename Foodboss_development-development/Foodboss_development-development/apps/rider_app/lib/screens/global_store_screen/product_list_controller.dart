import 'package:get/get.dart';
import 'package:rider_app/infrastructure/store_service.dart';
import 'package:rider_app/models/store/items.dart';
import 'package:rider_app/utils/states.dart';

class ProductListController extends GetxController {
  RxList<int> _selectedItemIndex = RxList();

  List get selectedIndexs => _selectedItemIndex.value;

  addIndex(int index) {
    if (_selectedItemIndex.contains(index)) {
      _selectedItemIndex.remove(index);
    } else {
      _selectedItemIndex.add(index);
    }
    // _selectedItemIndex[index].changeSelect();
  }

  var _productAddingStatus = States.INITIAL_STATE.obs;

  addProductsToMyStore(List<ListItemData> list) async {
    _productAddingStatus.value = States.LOADING_STATE;
    try {
      bool response =
          await StoreService.appProducts(SelectedItems(litsOfItems: list));

      if (response) {
        Get.snackbar('Success', 'Data added Successfully');
        _productAddingStatus.value = States.SUCCESS_STATE;
      } else {
        Get.snackbar('Error', 'Something went wrong');
        _productAddingStatus.value = States.ERROR_STATE;
      }
    } catch (e) {
      print(e);
      Get.snackbar('Something went wrong', 'Something went wrong');
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
    super.onClose();
  }
}
