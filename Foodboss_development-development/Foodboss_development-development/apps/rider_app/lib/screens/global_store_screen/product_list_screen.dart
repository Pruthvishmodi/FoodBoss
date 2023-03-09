import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/controller/business_controller/store/item_controller.dart';
import 'package:rider_app/models/store/items.dart';
import 'package:rider_app/screens/global_store_screen/product_list_controller.dart';
import 'package:rider_app/widgets/SmallRoundedInputField.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';

class ProductListScreen extends StatelessWidget {
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

    var controller = Get.put(ProductListController(), permanent: false);
    // StoreController controllerGet =
    //     Get.put(StoreController(), permanent: false);
    ItemController controllerGet = Get.put(ItemController(), permanent: false);

    openBottomSheet(Size size, List<ListItemData> list) {
      Get.bottomSheet(Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: ThemeConfig.WHITE_COLOR,
        ),
        padding: EdgeInsets.all(size.width * 0.05),
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
                    children: controller.selectedIndexs
                        .map((e) => Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Image(
                                        image: NetworkImage(list[e].hasMedia!
                                            ? list[e].media![0].thumb!
                                            : "http://51.79.254.75/admin5483157238/storage/app/public/3492/conversions/FOOD-BOSS-CUSTOMER-LOGO-thumb.jpg")),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          LabelText(
                                            titleString: list[e].name!,
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
                                                child: Desc(
                                                    descString: 'Quantity'),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child:
                                                    Desc(descString: 'Price'),
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
                                              const Expanded(
                                                flex: 1,
                                                child: SmallRoundedInputField(
                                                    hintText: "1000"),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: SmallRoundedInputField(
                                                      hintText: list[e]
                                                          .discountPrice
                                                          .toString())),
                                            ],
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ))
                        .toList(),
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
                        controller.addProductsToMyStore(controller.selectedIndexs.map((e) => list[e]).toList());
                        Get.back();
                        Get.back();
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
      ));
    }

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
      body: Stack(
        children: [
          Obx(
            () => controllerGet.itemList != null
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.all(size.width * 0.03),
                      itemCount: controllerGet.itemList!.length,
                      controller: controllerGet.controllerScroll,
                      itemBuilder: (context, index) {
                        return ProductTile(
                          item: controllerGet.itemList![index],
                          index: index,
                        );
                      },
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      padding: EdgeInsets.all(size.width * 0.03),
                      itemCount: 40,
                      itemBuilder: (context, index) {
                        return Container(
                          width: size.width,
                          height: 40,
                          margin: const EdgeInsets.all(10),
                          color: ThemeConfig.OUTLINE_COLOR,
                        );
                      },
                    ),
                  ),
          ),
      
          Positioned(
              bottom: 10,
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: PrimaryButton(
                          text: 'Add',
                          op: () {
                            openBottomSheet(size, controllerGet.itemList!);
                          },
                          type: 'filled'))
                ],
              )),
        ],
      ),
      // floatingActionButton: Row(
      //   children: [
      //     // Spacer(
      //     //   flex: 1,
      //     // ),
      //     Expanded(
      //         // flex: 2,
      //         child: PrimaryButton(
      //             text: "ADD",
      //             type: "filled",
      //             op: () {
      //               openBottomSheet(size, controllerGet.itemList!);
      //             })),
      //     // Spacer(
      //     //   flex: 1,
      //     // ),
      //   ],
      // ),
    );
  }
}

class ProductTile extends StatefulWidget {
  final ListItemData item;
  final int index;
  const ProductTile({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductListController(), permanent: false);
    return GestureDetector(
      onTap: () {
        print('helow');
        controller.addIndex(widget.index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeConfig.WHITE_COLOR,
        ),
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.item.hasMedia!
                            ? widget.item.media![0].thumb!
                            : "http://51.79.254.75/admin5483157238/storage/app/public/3492/conversions/FOOD-BOSS-CUSTOMER-LOGO-thumb.jpg"),
                        // image: AssetImage(widget.item.imageUrl ??
                        //     'assets/images/fruits.jpg'))),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Desc(descString: widget.item.name!),
                        Desc(
                            descString:
                                '${widget.item.weight} ${widget.item.unit} Items'),
                        const SizedBox(
                          height: 30,
                        ),
                        Desc(descString: '\u{20B9} ${widget.item.price}')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => Visibility(
                      visible: controller.checkIndex(widget.index),
                      child: Checkbox(
                        activeColor: ThemeConfig.PRIMARY_COLOR,
                          value: true,
                          onChanged: (Value) {
                            // controller.addIndex(widget.index);
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
