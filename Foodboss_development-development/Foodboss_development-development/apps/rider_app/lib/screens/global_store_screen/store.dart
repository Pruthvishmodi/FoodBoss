import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import 'package:rider_app/controller/business_controller/store/qr_controller.dart';
import 'package:rider_app/controller/business_controller/store/store_controller.dart';
import 'package:rider_app/screens/global_store_screen/global_store_controller.dart';
import 'package:rider_app/screens/global_store_screen/mockData.dart';
import 'package:rider_app/screens/global_store_screen/navbar.dart';
import 'package:rider_app/screens/global_store_screen/sidescreen.dart';
import 'package:rider_app/utils/states.dart';
import 'package:rider_app/widgets/RoundedInputField.dart';
import 'package:rider_app/widgets/SmallRoundedInputField.dart';
import 'package:rider_app/widgets/TextFieldContainer.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/form_input.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:shared_widgets/shared_widgets.dart';

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  QrController qrcontroller = Get.put(QrController(), permanent: false);

  String _scanBarcode = 'Unknown';
  bool _isProduct = true;

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
      qrcontroller.getQrCode(int.parse(barcodeScanRes));
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    Get.bottomSheet(Obx(() {
      if (qrcontroller.status == States.LOADING_STATE) {
        return const Center(
          child: const CircularProgressIndicator(),
        );
      } else if (qrcontroller.status == States.ERROR_STATE) {
        return Container(
          // shape: RoundedRectangleBorder(
          //   borderRadius:
          //       BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
          // ),
          // elevation: 0,
          // backgroundColor: Colors.transparent,
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
              titleString: "Oops! Something went wrong",
            ),
          ),
        );
      } else {
        return Container(
          // shape: RoundedRectangleBorder(
          //   borderRadius:
          //       BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
          // ),
          // elevation: 0,
          // backgroundColor: Colors.transparent,
          child: _productTIle(),
        );
      }
      //   controller.status == States.LOADING_STATE ? return Center(child: CircularProgressIndicator(),) :
    }));

    setState(() {
      _scanBarcode = barcodeScanRes;
      if (_scanBarcode != '-1') {
        _isProduct = true;
      }
    });
  }

  SingleChildScrollView _productTIle() {
    
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: ThemeConfig.FORM_COLOR),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              qrcontroller.data.data!.hasMedia == true
                  ? qrcontroller.data.data!.media![0].icon!
                  : "http://51.79.254.75/admin5483157238/storage/app/public/10683/conversions/Britannia-Good-Day-Butter-Cookies%2C-200-g-%281%29-thumb.jpg",
            ),
            // CircleAvatar(
            //   backgroundImage: NetworkImage(
            //     qrcontroller.data.data!.hasMedia == true
            //         ? qrcontroller.data.data!.media![0].icon!
            //         : "http://51.79.254.75/admin5483157238/storage/app/public/10683/conversions/Britannia-Good-Day-Butter-Cookies%2C-200-g-%281%29-thumb.jpg",
            //   ),
            //   radius: 40,backgroundColor: Colors.transparent,
            // ),
            MainLabelText(titleString: qrcontroller.data.data!.name!),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Expanded(
                  flex: 2,
                  child: LabelText(titleString: 'Stock'),
                ),
                Expanded(
                    flex: 1,
                    child: SmallRoundedInputField(
                      hintText: qrcontroller.stock!,
                      textType: TextInputType.number,
                      onChange: (val) => qrcontroller.changeStockValue(val),
                    )),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Expanded(
                  flex: 2,
                  child: LabelText(titleString: 'Price'),
                ),
                Expanded(
                    flex: 1,
                    child: SmallRoundedInputField(
                      hintText: qrcontroller.price!,
                      textType: TextInputType.number,
                      onChange: (val) => qrcontroller.changePriceValue(val),
                    )),
              ],
            ),
            Container(
                width: double.infinity,
                child: PrimaryButton(
                    text: 'Add',
                    op: () { 
                      qrcontroller.addProductFromQr();
                      Get.back();
                      },
                    type: 'filled'))
            // MaterialButton(
            //   onPressed: () {
            //     // Navigator.pop(context);
            //     Get.close(1);
            //   },
            //   color: ThemeConfig.PRIMARY_COLOR,
            //   textColor: ThemeConfig.WHITE_COLOR,
            //   child: const Icon(
            //     Icons.done_rounded,
            //     size: 30,
            //   ),
            //   padding: const EdgeInsets.all(16),
            //   shape: const CircleBorder(),
            // )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalStoreController controller =
        Get.put(GlobalStoreController(), permanent: false);
    final StoreController storeController =
        Get.put(StoreController(), permanent: false);

    return Scaffold(
      backgroundColor: ThemeConfig.FORM_COLOR,
      appBar: AppBar(
        foregroundColor: ThemeConfig.WHITE_COLOR,
        title: const Text(
          "Global store",
        ),
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                        flex: 7,
                        child: SmallRoundedInputField(
                          tailingIcon: Icons.search,
                          hintText: 'search',
                          ontap: () {
                            // controller.toggleSearch();
                          },
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    // IconButton(
                    //   c
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     Icons.scanner,
                    //     color: ThemeConfig.WHITE_COLOR,
                    //   ),
                    // ),
                    FloatingActionButton(
                      backgroundColor: ThemeConfig.PRIMARY_COLOR,
                      onPressed: () {
                        scanBarcodeNormal();
                      },
                      child: const Icon(
                        Icons.qr_code_scanner,
                        color: ThemeConfig.WHITE_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () {
                    if (storeController.mainCategoryList == null) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        color: ThemeConfig.OUTLINE_COLOR,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          color: ThemeConfig.OUTLINE_COLOR,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                      );
                    } else {
                      return Stack(
                        children: [
                          Container(
                            color: ThemeConfig.FORM_COLOR,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 150,
                            child: storeController.categoryList != null
                                ? SideSc(
                                    subCategory: storeController.categoryList!,
                                    contains: true,
                                  )
                                : Container(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        right: 10,
                                        bottom: 10),
                                    child: ListView.builder(
                                      itemCount: 20,
                                      itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              color: ThemeConfig.OUTLINE_COLOR,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 50,
                                                color:
                                                    ThemeConfig.OUTLINE_COLOR,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 500),
                            top: 0,
                            bottom: 0,
                            left: controller.selectedWidget.value <= 1
                                ? 0
                                : -MediaQuery.of(context).size.width * 0.7,
                            child: Container(
                              // duration: const Duration(microseconds: 3000),
                              color: ThemeConfig.FORM_COLOR,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 150,
                              child: GestureDetector(
                                onTap: () {
                                  controller.changeWidgetIndex(1);
                                },
                                child: storeController.subCategoryList != null
                                    ? ListView.builder(
                                        itemCount: storeController
                                            .subCategoryList?.length,
                                        itemBuilder: (context, index) {
                                          return Sidebar(
                                            isCat: storeController
                                                .subCategoryList![index]
                                                .isCategory!,
                                            id: storeController
                                                .subCategoryList![index].id!,
                                            widgetIndex: 1,
                                            index: index,
                                            name: storeController
                                                .subCategoryList![index].name!,
                                            location: storeController
                                                    .subCategoryList![index]
                                                    .hasMedia!
                                                ? storeController
                                                    .subCategoryList![index]
                                                    .media![0]
                                                    .icon!
                                                : 'http://51.79.254.75/admin5483157238/storage/app/public/369/conversions/FOOD-BOSS-CUSTOMER-LOGO-icon.jpg',
                                          );
                                        })
                                    : Container(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.20,
                                            right: 10,
                                            bottom: 10),
                                        child: ListView.builder(
                                          itemCount: 20,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  color:
                                                      ThemeConfig.OUTLINE_COLOR,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 50,
                                                    color: ThemeConfig
                                                        .OUTLINE_COLOR,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 500),
                            top: 0,
                            bottom: 0,
                            left: controller.selectedWidget.value == 0
                                ? 0
                                : -MediaQuery.of(context).size.width * 0.85,
                            child: Container(
                              // duration: const Duration(microseconds: 3000),
                              color: ThemeConfig.FORM_COLOR,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 150,
                              child: ListView.builder(
                                  itemCount:
                                      storeController.mainCategoryList!.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        controller.changeWidgetIndex(
                                          0,
                                        );
                                      },
                                      child: Sidebar(
                                          id: storeController
                                              .mainCategoryList![index].id!,
                                          widgetIndex: 0,
                                          index: index,
                                          name: storeController
                                              .mainCategoryList![index].name!,
                                          location: storeController
                                                  .mainCategoryList![index]
                                                  .hasMedia!
                                              ? storeController
                                                  .mainCategoryList![index]
                                                  .media![0]
                                                  .icon!
                                              : 'http://51.79.254.75/admin5483157238/storage/app/public/369/conversions/FOOD-BOSS-CUSTOMER-LOGO-icon.jpg'),
                                    );
                                  }),
                            ),
                          ),
                          
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// storeProductList[controller.tabIndex.value >= 0
//                                   ? controller.tabIndex.value
//                                   : 0]
//                               .list[controller.secondTabIndex.value >= 0
//                                   ? controller.secondTabIndex.value
//                                   : 0]
//                               .containsCat
//                           ? storeProductList[controller.tabIndex.value >= 0
//                                   ? controller.tabIndex.value
//                                   : 0]
//                               .list[controller.secondTabIndex.value >= 0
//                                   ? controller.secondTabIndex.value
//                                   : 0]
//                               .items
//                               .length
//                           : storeProductList[controller.tabIndex.value >= 0
//                                   ? controller.tabIndex.value
//                                   : 0]
//                               .list[controller.secondTabIndex.value >= 0
//                                   ? controller.secondTabIndex.value
//                                   : 0]
//                               .catagories
//                               .length,