import 'package:get/get.dart';
import 'package:seller_app/utils/states.dart';


class PackedListController extends GetxController {
  RxList<int> _selectedItemIndex = RxList();

  List get selectedIndexs => _selectedItemIndex.value;

  addIndex(int index) {
     if(_selectedItemIndex.contains(index)){
       _selectedItemIndex.remove(index);
     }else{
       _selectedItemIndex.add(index);
     }
    // _selectedItemIndex[index].changeSelect();
  }

  var _productAddingStatus = States.INITIAL_STATE.obs;



  bool 
  checkIndex(index) {
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
