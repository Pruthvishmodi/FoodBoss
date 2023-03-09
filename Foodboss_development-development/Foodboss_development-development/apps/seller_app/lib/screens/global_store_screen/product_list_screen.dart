import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/store/item_controller.dart';
import 'package:seller_app/models/store/items.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/error.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class ProductListScreen extends StatelessWidget {
  final bool? isSearch = Get.arguments['fromSearch'];
  // final bool? isSeach;
  var args = Get.arguments;
  // var title = args[0];
  // var productList = args[1];
  final _selectedList = [];
  ProductListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // StoreController controllerGet =
    //     Get.put(StoreController(), permanent: false);
    ItemController controllerGet = Get.put(ItemController(), permanent: false);
    // ProductListController controller =
    //     Get.put(ProductListController(), permanent: false);

    openBottomSheet(Size size, List<ListItemData> list) {
      // list = controllerGet.selectedItemList;
      Get.bottomSheet(Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: ThemeConfig.WHITE_COLOR,
        ),
        padding: EdgeInsets.only(bottom: 3, left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MainLabelText(
                titleString: 'CONFIRM SELECTION',
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Wrap(
                children: [
                  Column(
                    children: list.map((e) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image(
                                  image: NetworkImage(e.hasMedia!
                                      ? e.media![0].thumb!
                                      : "http://51.79.254.75/admin5483157238/storage/app/public/3492/conversions/FOOD-BOSS-CUSTOMER-LOGO-thumb.jpg")),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    LabelText(
                                      titleString: e.name!,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Expanded(
                                          flex: 1,
                                          child: Desc(descString: 'Quantity'),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Desc(descString: 'Price'),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: SmallRoundedInputField(
                                              textType: TextInputType.number,
                                              tailingIcon: Icons.balance,
                                              hintText: '1000',
                                              controller: e.controllerStock,
                                              onChange: (val) {
                                                if (val != '') {
                                                  print(controllerGet
                                                      .selectedItems.value
                                                      .firstWhere((element) =>
                                                          element.id == e.id)
                                                      .name);

                                                  int index = controllerGet
                                                      .selectedItems.value
                                                      .indexWhere((element) =>
                                                          element.id == e.id);
                                                  controllerGet
                                                          .selectedItems
                                                          .value[index]
                                                          .quantity =
                                                      int.parse(val);

                                                  controllerGet.selectedItems
                                                      .refresh();
                                                }
                                              },
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: SmallRoundedInputField(
                                              textType: TextInputType.number,
                                              tailingIcon:
                                                  Icons.currency_rupee_rounded,
                                              controller: e.controllerPrice,
                                              onChange: (val) {
                                                print(controllerGet
                                                    .selectedItems.value
                                                    .firstWhere((element) =>
                                                        element.id == e.id)
                                                    .name);

                                                int index = controllerGet
                                                    .selectedItems.value
                                                    .indexWhere((element) =>
                                                        element.id == e.id);
                                                controllerGet
                                                        .selectedItems
                                                        .value[index]
                                                        .discountPrice =
                                                    int.parse(val);

                                                controllerGet.selectedItems
                                                    .refresh();
                                              },
                                              hintText:
                                                  e.discountPrice.toString(),
                                            )),
                                      ],
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      );
                    }).toList(),
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
                        // controllerGet.selectedItems.value = list;
                        controllerGet.addProductsToMyStore(context);

                        // Navigator.pop(context);
                        // Navigator.pop(context);
                      },
                      text: 'Add',
                      type: "filled",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
    }

    TextEditingController searchController = TextEditingController();
    var text;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Add Products",
          style: TextStyle(color: ThemeConfig.WHITE_COLOR),
        ),
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        foregroundColor: ThemeConfig.WHITE_COLOR,
      ),
      body: Column(
        children: [
          isSearch == true
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SmallRoundedInputField(
                    tailingIcon: Icons.search,
                    onSubmit: (val) => controllerGet.getSearchItems(val),
                    hintText: text ?? 'search',

                    onChange: (val) => text = val,
                    focus: true,
                    //  focusNode: focusNode,

                    // labelText: "search",
                  ),
                )
              : Container(),
          text == ''
              ? Expanded(
                  child: Container(
                  color: ThemeConfig.WHITE_COLOR,
                ))
              : Expanded(
                  child: Stack(
                    children: [
                      Obx(
                        () {
                          return controllerGet.status == States.SUCCESS_STATE
                              ? controllerGet.itemList!.length <= 0
                                  ? Center(
                                      child: ErrorCard(
                                        refresh: false,
                                        myFunction: () {},
                                        message:
                                            "No product found, please try again later!",
                                      ),
                                    )
                                  : SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: ListView.builder(
                                        padding:
                                            EdgeInsets.all(size.width * 0.03),
                                        itemCount:
                                            controllerGet.itemList!.length,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        controller:
                                            controllerGet.controllerScroll,
                                        itemBuilder: (context, index) {
                                          return ProductTile(
                                            item:
                                                controllerGet.itemList![index],
                                            index: index,
                                          );
                                        },
                                      ),
                                    )
                              : controllerGet.status == States.LOADING_STATE
                                  ? SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: ListView.builder(
                                        padding:
                                            EdgeInsets.all(size.width * 0.03),
                                        itemCount: 10,
                                        itemBuilder: (context, index) {
                                          return ProductTile(
                                              item: ListItemData(),
                                              loading: true,
                                              index: index);
                                        },
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Container(
                                              color: ThemeConfig.WHITE_COLOR,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                        },
                      ),
                      Obx(
                        () => controllerGet.status == States.SUCCESS_STATE &&
                                controllerGet.itemList!.length > 0
                            ? Positioned(
                                bottom: 10,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: MediaQuery.of(context).size.width,
                                      height: 40,
                                      child: PrimaryButton(
                                        text: 'Add',
                                        op: () {
                                          controllerGet.setItemsFiltered();
                                          openBottomSheet(size,
                                              controllerGet.selectedItemList);
                                        },
                                        type: 'filled',
                                      ),
                                    ),
                                  ],
                                ))
                            : SizedBox(width: 0),
                      ),
                      // isSearch == true
                      //     ? Visibility(
                      //         visible: true,
                      //         child: Container(
                      //           padding: const EdgeInsets.all(10),
                      //           height: size.height,
                      //           color: ThemeConfig.WHITE_COLOR,
                      //           child: Column(
                      //             children: [
                      //               SmallRoundedInputField(
                      //                 tailingIcon: Icons.search,
                      //                 controller: searchController,
                      //                 onSubmit: (val) => controllerGet.getSearchItems(val),
                      //                 hintText: 'search',
                      //               ),
                      //               Expanded(
                      //                 child: Obx(() {
                      //                   return controllerGet.status == States.SUCCESS_STATE
                      //                       ? controllerGet.itemList!.length <= 0
                      //                           ? Center(
                      //                               child: ErrorCard(
                      //                                 refresh: false,
                      //                                 myFunction: () {},
                      //                                 message:
                      //                                     "No products at this moment, please try again later!",
                      //                               ),
                      //                             )
                      //                           : SizedBox(
                      //                               height:
                      //                                   MediaQuery.of(context).size.height,
                      //                               child: ListView.builder(
                      //                                 padding:
                      //                                     EdgeInsets.all(size.width * 0.03),
                      //                                 itemCount:
                      //                                     controllerGet.itemList!.length,
                      //                                 physics:
                      //                                     const AlwaysScrollableScrollPhysics(),
                      //                                 controller:
                      //                                     controllerGet.controllerScroll,
                      //                                 itemBuilder: (context, index) {
                      //                                   return ProductTile(
                      //                                     item: controllerGet
                      //                                         .itemList![index],
                      //                                     index: index,
                      //                                   );
                      //                                 },
                      //                               ),
                      //                             )
                      //                       : controllerGet.status == States.LOADING_STATE
                      //                           ? SizedBox(
                      //                               height:
                      //                                   MediaQuery.of(context).size.height,
                      //                               child: ListView.builder(
                      //                                 padding:
                      //                                     EdgeInsets.all(size.width * 0.03),
                      //                                 itemCount: 10,
                      //                                 itemBuilder: (context, index) {
                      //                                   return ProductTile(
                      //                                       item: ListItemData(),
                      //                                       loading: true,
                      //                                       index: index);
                      //                                 },
                      //                               ),
                      //                             )
                      //                           : Center(
                      //                               child: ErrorCard(
                      //                                 refresh: false,
                      //                                 myFunction: () {},
                      //                                 message:
                      //                                     "No product at this moment, please try again later!",
                      //                               ),
                      //                             );
                      //                 }),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //     : Container()
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final ListItemData item;
  final bool? loading;
  final int index;
  const ProductTile({
    Key? key,
    this.loading = false,
    required this.item,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemController controller = Get.find<ItemController>();
    return GestureDetector(
      onTap: () {
        print('helow');
        if (loading == false) {
          if (item.isAddedMyStore == false) {
            controller.selectItem(item.id!);
          }
        }
      },
      child: Container(
        margin: EdgeInsets.only(
            bottom: controller.items.value != null
                ? controller.items.value!.data != null
                    ? controller.items.value!.data!.length - 1 == index
                        ? 50
                        : 0
                    : 0
                : 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: loading == false
              ? item.isAddedMyStore == false
                  ? ThemeConfig.WHITE_COLOR
                  : ThemeConfig.FORM_COLOR
              : ThemeConfig.WHITE_COLOR,
        ),
        // margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: ThemeConfig.FORM_COLOR,
                  borderRadius: BorderRadius.circular(10),
                  // image: DecorationImage(
                  //   fit: BoxFit.cover,
                  //   image: NetworkImage(item.hasMedia!
                  //       ? item.media![0].thumb!
                  //       : "http://51.79.254.75/admin5483157238/storage/app/public/3492/conversions/FOOD-BOSS-CUSTOMER-LOGO-thumb.jpg"),
                  //   // image: AssetImage(widget.item.imageUrl ??
                  //   //     'assets/images/fruits.jpg'))),
                  // ),
                ),
                child: loading == false
                    ? Image(
                        image: NetworkImage(item.hasMedia!
                            ? item.media![0].thumb!
                            : "http://51.79.254.75/admin5483157238/storage/app/public/3492/conversions/FOOD-BOSS-CUSTOMER-LOGO-thumb.jpg"),
                      )
                    : null),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    loading == false
                        ? LabelText(titleString: item.name!)
                        : Container(
                            height: 25,
                            color: ThemeConfig.FORM_COLOR,
                          ),
                    const SizedBox(height: 5),
                    loading == false
                        ? Desc(descString: '${item.weight} ${item.unit} Items')
                        : Container(
                            height: 15,
                            color: ThemeConfig.FORM_COLOR,
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    loading == false
                        ? item.isRemoveMrp == true
                            ? LabelText(titleString: '')
                            : LabelText(
                                titleString: 'MRP  \u{20B9} ${item.price}')
                        : Container(
                            height: 15,
                            color: ThemeConfig.FORM_COLOR,
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
              child: loading == true
                  ? SizedBox(width: 0)
                  : item.isAddedMyStore == false
                      ? Visibility(
                          visible: item.isSelected!,
                          child: Checkbox(
                              activeColor: ThemeConfig.PRIMARY_COLOR,
                              value: true,
                              onChanged: (Value) {
                                // controller.addIndex(widget.index);
                              }),
                        )
                      : Visibility(
                          visible: true,
                          child: Checkbox(
                              activeColor: ThemeConfig.OUTLINE_COLOR,
                              value: true,
                              onChanged: (Value) {
                                // controller.addIndex(widget.index);
                              }),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
