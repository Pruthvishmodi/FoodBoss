import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:seller_app/infrastructure/qr_call.dart';
import 'package:seller_app/models/store/items.dart';
import 'package:seller_app/models/store/qr.dart';
import 'package:seller_app/screens/global_store_screen/product_list_controller.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:seller_app/widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';
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

  addProductFromQr(BuildContext context) async {
    // itemController

    await productListController.addProductsToMyStore([
      ListItemData(
        quantity: _data.value.data!.quantity,
        controllerPrice: _data.value.data!.controllerPrice,
        controllerStock: _data.value.data!.controllerStock,
        categoryId: _data.value.data!.categoryId,
        discountPrice: _data.value.data!.discountPrice,
        id: _data.value.data!.id,
        hasMedia: _data.value.data!.hasMedia,
        mainCategoryId: _data.value.data!.mainCategoryId,
        name: _data.value.data!.name,
        price: _data.value.data!.price,
        subcategoryId: _data.value.data!.subcategoryId,
      )
    ], context);
  }

  String get status => _state.value;

  QrModel get data => _data.value;

  getQrCode(int) async {
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

  SingleChildScrollView _productTIle(BuildContext context, bool loading) {
    return SingleChildScrollView(
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              color: ThemeConfig.WHITE_COLOR,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: loading
                      ? Container(
                          width: 100,
                          height: 100,
                          color: ThemeConfig.FORM_COLOR,
                        )
                      : Image.network(
                          data.data!.hasMedia == true
                              ? data.data!.media![0].icon!
                              : "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    child: loading
                        ? Container(
                            width: double.infinity,
                            height: 60,
                            color: ThemeConfig.FORM_COLOR,
                          )
                        : MainLabelText(titleString: data.data!.name!)),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: loading
                      ? Container(
                          width: double.infinity,
                          height: 30,
                          color: ThemeConfig.FORM_COLOR,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 2,
                              child: LabelText(titleString: 'Stock'),
                            ),
                            Expanded(
                                flex: 1,
                                child: SmallRoundedInputField(
                                  hintText: stock!,
                                  controller: _data.value.data!.controllerStock,
                                  textType: TextInputType.number,
                                  onChange: (val) => changeStockValue(val),
                                )),
                          ],
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: loading
                      ? Container(
                          width: double.infinity,
                          height: 30,
                          color: ThemeConfig.FORM_COLOR,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 2,
                              child: LabelText(titleString: 'Price'),
                            ),
                            Expanded(
                                flex: 1,
                                child: SmallRoundedInputField(
                                  hintText: price!,
                                  controller: _data.value.data!.controllerPrice,
                                  textType: TextInputType.number,
                                  onChange: (val) => changePriceValue(val),
                                )),
                          ],
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                      text: 'Add',
                      op: () {
                        addProductFromQr(context);
                        // Get.back();
                        // Navigator.pop(context);
                      },
                      type: 'filled'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  scanBarcodeNormal(BuildContext context, bool mounted) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      // print(barcodeScanRes);
      getQrCode(int.parse(barcodeScanRes));
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    showModalBottomSheet(
      context: context,
      builder: (context) => Obx(() {
        if (status == States.LOADING_STATE) {
          return _productTIle(context, true);
        } else if (status == States.ERROR_STATE) {
          return Container(
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
                color: ThemeConfig.WHITE_COLOR,
              ),
              width: 100,
              padding: const EdgeInsets.all(20),
              height: 100,
              child: const MainLabelText(
                titleString: "OOPS..! Product not found",
              ),
            ),
          );
        } else {
          return Container(
              padding: MediaQuery.of(context).viewInsets,
              child: _productTIle(context, false));
        }
      }),
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    productListController.dispose();
    super.dispose();
  }
}
