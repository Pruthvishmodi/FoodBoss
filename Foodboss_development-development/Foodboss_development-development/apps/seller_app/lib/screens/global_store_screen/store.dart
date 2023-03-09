import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:seller_app/models/store/catagories.dart';
import 'package:seller_app/screens/global_store_screen/product_list_screen.dart';
import 'package:seller_app/widgets/error.dart';
import 'package:seller_app/widgets/text_widgets/title_subtitle.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/business_controller/store/qr_controller.dart';
import 'package:seller_app/controller/business_controller/store/store_controller.dart';
import 'package:seller_app/screens/global_store_screen/global_store_controller.dart';
import 'package:seller_app/screens/global_store_screen/mockData.dart';
import 'package:seller_app/screens/global_store_screen/navbar.dart';
import 'package:seller_app/screens/global_store_screen/sidescreen.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/RoundedInputField.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/TextFieldContainer.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/form_input.dart';
import 'package:seller_app/widgets/main_label.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
// late AnimationController animationController;

  // @override
  // void initState() {
  //    animationController = AnimationController(vsync: this, duration: Duration(microseconds: 0));
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    QrController qrcontroller = Get.put(QrController(), permanent: false);
    final StoreController storeController =
        Get.put(StoreController(), permanent: false);
    final GlobalStoreController controller =
        Get.put(GlobalStoreController(), permanent: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed("/product-list-screen", arguments: {
                              "id": 2,
                              "fromSearch": true,
                              "fromCat": true,
                            });
                            // controller.toggleSearch();
                          },
                          child: Container(
                            height: 47,
                            padding: const EdgeInsets.only(
                                top: 7, bottom: 7, left: 20),
                            decoration: BoxDecoration(
                              color: ThemeConfig.WHITE_COLOR,
                              border: Border.all(
                                  width: 1, color: ThemeConfig.PRIMARY_COLOR),
                              borderRadius: BorderRadius.circular(
                                  ThemeConfig.BORDERRADIUS_MIN),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.search,
                                  color: ThemeConfig.PRIMARY_COLOR,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                // LabelText(titleString: 'Search')
                                Text(
                                  'Search',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        )
                        // SmallRoundedInputField(
                        //   tailingIcon: Icons.search,
                        //   hintText: 'search',
                        //   ontap: () {
                        //     Get.toNamed("/product-list-screen", arguments: {
                        //       "id": 2,
                        //       "fromSearch": true,
                        //       "fromCat": true,
                        //     });
                        //     // controller.toggleSearch();
                        //   },
                        // )
                        ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      backgroundColor: ThemeConfig.PRIMARY_COLOR,
                      onPressed: () {
                        qrcontroller.scanBarcodeNormal(context, mounted);
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
                    if (storeController.catLoading.value) {
                      return Container(
                        // padding: const EdgeInsets.all(20),
                        child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, index) => Sidebar(
                                  widgetIndex: 0,
                                  index: index,
                                  name: "name",
                                  location: "location",
                                  id: 0,
                                  loading: true,
                                )),
                      );
                    } else {
                      return Stack(
                        children: [
                          Container(
                              color: ThemeConfig.FORM_COLOR,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 150,
                              child: storeController.childCatLoading.value ==
                                      false
                                  ? storeController.childCatError.value == true
                                      ? SizedBox(
                                          // color: Colors.amber,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              150,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                width: 140,
                                              ),
                                              ErrorCard(
                                                refresh: false,
                                                myFunction: () {},
                                                message:
                                                    "No catagories available at this moment, please try again later!",
                                              )
                                            ],
                                          ),
                                        )
                                      : SideSc(
                                          subCategory:
                                              storeController.categoryList!,
                                          contains: true,
                                        )
                                  : const SideSc(
                                      subCategory: <ListCatData>[],
                                      contains: true,
                                      loading: true,
                                    )),
                          AnimatedPositioned(
                            onEnd: () {
                              controller.apiCallOnSubCat();
                            },
                            duration: const Duration(milliseconds: 500),
                            top: 0,
                            bottom: 0,
                            left: controller.selectedWidget.value <= 1
                                ? 0
                                : -MediaQuery.of(context).size.width * 0.7,
                            child: Container(
                              // duration: const Duration(microseconds: 3000),
                              color: ThemeConfig.WHITE_COLOR,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 150,
                              child: storeController.subCatLoading.value ==
                                      false
                                  ? storeController.subCatError.value == true
                                      ? SizedBox(
                                          // color: Colors.amber,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              150,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                width: 70,
                                              ),
                                              ErrorCard(
                                                myFunction: () {},
                                                refresh: false,
                                                message:
                                                    "No catagories available at this moment, please try again later!",
                                              ),
                                            ],
                                          ),
                                        )
                                      : ListView.builder(
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
                                                  .subCategoryList![index]
                                                  .name!,
                                              location: storeController
                                                      .subCategoryList![index]
                                                      .hasMedia!
                                                  ? storeController
                                                      .subCategoryList![index]
                                                      .media![0]
                                                      .icon!
                                                  : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                            );
                                          })
                                  : SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height -
                                              150,
                                      child: ListView.builder(
                                        itemCount: 20,
                                        itemBuilder: (context, index) =>
                                            Sidebar(
                                                widgetIndex: 1,
                                                index: index,
                                                name: "",
                                                location: "",
                                                id: 1,
                                                loading: true),
                                      ),
                                    ),
                            ),
                          ),
                          AnimatedPositioned(
                            onEnd: () {
                              controller.apiCallOnCat(context);
                            },
                            duration: const Duration(milliseconds: 500),
                            top: 0,
                            bottom: 0,
                            left: controller.selectedWidget.value == 0
                                ? 0
                                : -MediaQuery.of(context).size.width * 0.85,
                            child: Container(
                              // duration: const Duration(microseconds: 3000),
                              color: ThemeConfig.WHITE_COLOR,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 150,
                              child: ListView.builder(
                                  itemCount:
                                      storeController.mainCategoryList!.length,
                                  itemBuilder: (context, index) {
                                    return Sidebar(
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
                                            : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg');
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
