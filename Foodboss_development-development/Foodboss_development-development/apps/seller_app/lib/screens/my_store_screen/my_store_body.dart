import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/my_store/my_store_controller.dart';
import 'package:seller_app/models/store/my_food_detail_model.dart';
import 'package:seller_app/models/store/mystore_item.dart';
import 'package:seller_app/screens/my_store_screen/my_store_card.dart';
import 'package:seller_app/screens/no_products_screen.dart';
import 'package:seller_app/widgets/Heading.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

List<int> dummy = [1];

class MyStoreBody extends StatelessWidget {
  const MyStoreBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyStoreController controller = Get.find<MyStoreController>();
    return Obx(
      () => controller.loading.value == false
          // ? controller.error.value == true
          // ? ErrorCard(message: "message")
          ? TabBarView(
              children: controller.catgories.value.length <= 0
                  ? dummy
                      .map(
                        (e) => NoProductsFoundScreen(
                          op: () {
                            Get.toNamed("/global-store");
                          },
                          op_on_refresh: controller.getCatCotroller,
                        ),
                      )
                      // .map((e) => Center(
                      //       child: ErrorCard(
                      //           refresh: true,
                      //           myFunction: controller.getCatCotroller,
                      //           message:
                      //               "Products not available at this moment.please try again later"),
                      //     ))
                      .toList()
                  : controller.catgories.value
                      .map(
                        (element) => MyFragement(
                            catId: element.mainCategoryId!,
                            list:
                                controller.catItems[element.mainCategoryId!] !=
                                        null
                                    ? controller
                                        .catItems[element.mainCategoryId!]!
                                        .data!
                                    : []),
                      )
                      .toList(),
              // children: democategoryList.map((e) {
              //   print(e);
              //   return MyFragement(list: e);
              // }).toList(),
              // children: [
              //   MyFragement(
              //     productList: democategoryList[0].products,
              //   ),
              //   PendingOrd(
              //     floating: false,
              //     type: "pending",
              //   ),
              //   PendingOrd(
              //     floating: false,
              //     type: "pending",
              //   ),
              //   PendingOrd(
              //     floating: false,
              //     type: "pending",
              //   ),
              //   PendingOrd(
              //     floating: false,
              //     type: "pending",
              //   ),
              //   PendingOrd(
              //     floating: false,
              //     type: "pending",
              //   ),
              //   PendingOrd(
              //     floating: false,
              //     type: "pending",
              //   ),
              // ],
            )
          : MyFragement(
              list: const <ItemMyStoreData>[],
              catId: 0,
              loading: true,
            ),
    );
    // : Container(
    //     padding: const EdgeInsets.all(20.0),
    //     child: ListView.builder(
    //         itemCount: 10,
    //         itemBuilder: (context, index) {
    //           var myStoreCard = MyStoreCard(
    //             discount: '',
    //             img: '',
    //             item: ItemMyStoreData(),
    //             name: '',
    //             op: () {},
    //             price: '',
    //             stock: '',
    //             loading: true,
    //           );
    //           return myStoreCard;
    //         }),
    //   ));
  }
}

class MyFragement extends StatelessWidget {
  final List<ItemMyStoreData> list;
  final bool? loading;
  final int catId;
  MyFragement({
    Key? key,
    this.loading = false,
    required this.list,
    required this.catId,
  }) : super(key: key);

  openBottomSheet(Size size, ItemMyStoreData data, BuildContext context) {
    TextEditingController stockController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    stockController.text = data.quantity.toString();
    priceController.text = data.discountPrice.toString();
    Get.bottomSheet(
      Wrap(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: ThemeConfig.WHITE_COLOR,
            ),
            padding: EdgeInsets.all(size.width * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading(data.name!, ThemeConfig.MAIN_TEXT_COLOR),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: LabelText(titleString: 'Stock'),
                    ),
                    Expanded(
                      flex: 1,
                      child: SmallRoundedInputField(
                        hintText: data.quantity!.toString(),
                        controller: stockController,
                        textType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: LabelText(titleString: 'Price'),
                    ),
                    Expanded(
                      flex: 1,
                      child: SmallRoundedInputField(
                        hintText: data.discountPrice!,
                        textType: TextInputType.number,
                        controller: priceController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        op: () {
                          if (double.parse(priceController.text).toInt() >
                              double.parse(data.price!).toInt()) {
                            CustomSnackbar.errorSnackbar2(
                                'Price Cannot be greater than MRP');
                          } else {
                            log('uhuh');
                            controller.quickUpdateController(
                                context,
                                MyStoreItemDetails(
                                    data: ProductDetailsData(
                                        id: data.id,
                                        mainCategoryId: data.mainCategoryId,
                                        price:
                                            double.parse(data.price!).toInt(),
                                        isAvailable: true,
                                        foodsUsers: FoodsUsers(
                                          discountPrice: priceController.text,
                                          quantity:
                                              double.parse(stockController.text)
                                                  .toInt(),
                                        ))));
                            Get.back();
                          }
                        },
                        text: 'Save',
                        type: "filled",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MyStoreController controller = Get.find<MyStoreController>();
  @override
  Widget build(BuildContext context) {
    var productList = list;
    var text;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.03),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SmallRoundedInputField(
                  hintText: text ?? 'search',
                  onSubmit: (val) =>
                      controller.searchItemController(catId, val),
                  onChange: (val) => text = val,
                  tailingIcon: Icons.search,
                  textType: TextInputType.name,
                ),
              ),
            ],
          ),
          Expanded(
              child:
                  // Obx(() {
                  //   if (controller.myStoreItems.value == null) {
                  //     return const Center(child: const CircularProgressIndicator());
                  //   } else {
                  //     var productList = controller.myStoreItems.value.data;

                  //     return
                  RefreshIndicator(
            onRefresh: () async {
              if (loading == false) {
                await controller.getCatCotroller();
              }
              // print(productList.length);
              // productList.forEach((element) {
              //   print(element.name);
              // });
              // Future.delayed(Duration(seconds: 4));
            },
            child: loading == false
                ? list.length <= 0
                    // ? ErrorCard(
                    //     refresh: true,
                    //     myFunction: controller.getCatCotroller,
                    //     message:
                    //         "Products not available at this moment.please try again later")
                    ? NoProductsFoundScreen(
                        op: () {
                          Get.toNamed("/global-store");
                        },
                        op_on_refresh: controller.getCatCotroller,
                      )
                    : ListView.builder(
                        itemCount: productList.length,
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: controller.controllerScroll.value[catId],
                        itemBuilder: (context, index) => MyStoreCard(
                          id: productList[index].id.toString(),
                          img:
                              // img: ThemeConfig.NOIMAGELINK,

                              productList[index].hasMedia == true
                                  ? productList[index].media!.first.url!
                                  : "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
                          name: productList[index].name!,
                          stock: productList[index].quantity.toString(),
                          price: productList[index].isRemoveMrp == true
                              ? ''
                              : "\u{20B9} ${productList[index].price.toString()}",
                          discount: productList[index].discountPrice.toString(),
                          avaibility: productList[index].isAvailable == 1
                              ? true
                              : false,
                          item: productList[index],
                          op: () {
                            openBottomSheet(size, productList[index], context);
                          },
                        ),
                      )
                : ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return MyStoreCard(
                        avaibility: true,
                        discount: '0',
                        img: '',
                        id: '0',
                        item: ItemMyStoreData(),
                        name: '',
                        op: () {
                          // openBottomSheet(size, ItemMyStoreData());
                        },
                        price: '0',
                        stock: '100',
                        loading: true,
                      );
                      // return myStoreCard;
                    }),
          )
              //   }
              // }),
              ),
        ],
      ),
    );
  }
}
