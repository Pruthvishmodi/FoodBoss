import 'package:get/get.dart';

import '../../../infrastructure/qr_call.dart';
import '../../../models/store/items.dart';
import '../../../models/store/qr.dart';
import '../../../screens/global_store_screen/product_list_controller.dart';
import '../../../utils/states.dart';

// import 'package:xml/xml.dart' as xml;

class QrController extends GetxController {
  ProductListController productListController =
      Get.put(ProductListController(), permanent: false);

  var _data = QrModel().obs;
  var _state = States.INITIAL_STATE.obs;

  var _stock = '1000'.obs;
  var _price = ''.obs;

  get stock => _stock.value;
  get price => _price.value;

  changeStockValue(val) {
    _stock.value = val;
  }

  changePriceValue(val) {
    _price.value = val;
  }

  addProductFromQr() {
    // itemController

    productListController.addProductsToMyStore([
      ListItemData(
        categoryId: _data.value.data!.categoryId,
        discountPrice: _data.value.data!.discountPrice,
        dupId: _data.value.data!.dupId,
        id: _data.value.data!.id,
        hasMedia: _data.value.data!.hasMedia,
        mainCategoryId: _data.value.data!.mainCategoryId,
        name: _data.value.data!.name,
        price: _data.value.data!.price,
        packageItemsCount: _data.value.data!.packageItemsCount,
        subcategoryId: _data.value.data!.subcategoryId,
      )
    ]);
  }

  String get status => _state.value;

  QrModel get data => _data.value;

  Future<void> getQrCode(int) async {
    _state.value = States.LOADING_STATE;
    try {
      QrModel response = await QrCall.getQr(int);
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        // Get.snackbar('Error', 'Something went wrong while loading videos');
      } else {
        _data.value = response;
        // _stock.value = _data.value.data!.packageItemsCount.toString();
        _price.value = _data.value.data!.price.toString();

        _state.value = States.SUCCESS_STATE;
      }
    } catch (e) {
      print(e);
      // Get.snackbar("Opps", "Something went wrong");
      _state.value = States.ERROR_STATE;
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
