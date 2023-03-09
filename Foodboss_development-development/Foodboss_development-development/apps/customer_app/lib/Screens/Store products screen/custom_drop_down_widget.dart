import 'dart:developer';

import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/store_product_ui_controller.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/components/counter_widget.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownMenu extends StatelessWidget {
  CustomDropDownMenu({
    Key? key,
    required this.list,
    required this.pindex,
    // required this.index,
  }) : super(key: key);

  // final int index;
  final Product list;
  final int pindex;

  CartController cartController = Get.find<CartController>();

  openSheet() {
    print('tapped');
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: ThemeConfig.screenPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(list.photo!))),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MainLabelText(text: list.name!),
                          // const DescriptionText(text: 'Delivery in 5 Min'),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.close)),
                  ],
                ),
              ),
              const Divider(),
              Container(
                padding: ThemeConfig.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelText(text: 'Choose a Pack Size'),
                    SB.medium(),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: list.variants!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          log('here taped');
                          storeProductController
                              .store
                              .value
                              .categories![
                                  storeProductUiController.fragIndex.value]
                              .filteredProducts![pindex]
                              .selectedVaritent = index;
                          cartController.changeVarient(list,
                              storeProductUiController, storeProductController);

                          Get.back();
                          storeProductController.store.refresh();
                        },
                        child: Obx(
                          () => Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 3),
                            height: 80,
                            decoration: BoxDecoration(
                              color: storeProductController
                                          .store
                                          .value
                                          .categories![storeProductUiController
                                              .fragIndex.value]
                                          .filteredProducts![pindex]
                                          .selectedVaritent! ==
                                      index
                                  ? ThemeConfig.secondaryColorLite
                                  : ThemeConfig.whiteColor,
                              border: Border.all(
                                  width: 1,
                                  color: ThemeConfig.secondaryColorLite),
                              borderRadius:
                                  BorderRadius.circular(ThemeConfig.radiusMin),
                            ),
                            padding: ThemeConfig.screenPadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MainLabelText(
                                          text:
                                              '${list.variants![index].weight!.toString()} ${list.variants![index].unit!}'),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    MainLabelText(
                                      text:
                                          '\u{20B9} ${list.variants![index].price!}',
                                      // isDotDot: true,
                                    ),
                                    // const SizedBox(
                                    //   width: 5,
                                    // ),
                                    // DescriptionText(
                                    //   text:
                                    //       '\u{20B9} ${list.variants![index].price}',
                                    //   isDotDot: true,
                                    //   type: 'i',
                                    // )
                                  ],
                                ),
                                // CounterWidget(product:list,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: ThemeConfig.whiteColor,
      persistent: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ThemeConfig.radiusMin),
          topRight: Radius.circular(ThemeConfig.radiusMin),
        ),
      ),
    );
  }

  StoreProductController storeProductController =
      Get.find<StoreProductController>();
  StoreProductUiController storeProductUiController =
      Get.find<StoreProductUiController>();
  @override
  Widget build(BuildContext context) {
    return
        //  Obx(
        //   () {
        // int selectedIndex = storeProductController
        //     .store
        //     .value
        //     .categories![storeProductUiController.fragIndex.value]
        //     .filteredProducts![pindex]
        //     .selectedVaritent!;

        Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          // margin: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: ThemeConfig.secondaryColorLite),
            borderRadius: BorderRadius.circular(5),
          ),
          child: list.variants!.length == 1
              ? Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: LabelText(
                      text: '${list.weight!.toString()} ${list.unit!}'),
                )
              : GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    openSheet();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelText(
                          text:
                              '${list.variants![storeProductController.store.value.categories![storeProductUiController.fragIndex.value].filteredProducts![pindex].selectedVaritent!].weight!.toString()} ${list.variants![storeProductController.store.value.categories![storeProductUiController.fragIndex.value].filteredProducts![pindex].selectedVaritent!].unit!}'),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: ThemeConfig.secondaryColor,
                      )
                    ],
                  ),
                ),
        ),
        SB.small(),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    list.variants!.length == 1 && list.price == list.discount
                        ? const SizedBox(
                            height: 5,
                          )
                        : const SizedBox(),
                    LabelText(
                      text:
                          '\u{20B9} ${list.variants!.length == 1 ? list.discount : list.variants![storeProductController.store.value.categories![storeProductUiController.fragIndex.value].filteredProducts![pindex].selectedVaritent!].price}',
                      isDotDot: true,
                    ),
                    list.variants!.length == 1 && list.price == list.discount
                        ? const SizedBox()
                        : storeProductController
                                    .store
                                    .value
                                    .categories![storeProductUiController
                                        .fragIndex.value]
                                    .filteredProducts![pindex]
                                    .selectedVaritent! >
                                0
                            ? SizedBox()
                            : DescriptionText(
                                text:
                                    '\u{20B9} ${list.variants!.length == 1 ? list.price : list.price}',
                                isDotDot: true,
                                type: 'i',
                              ),
                  ],
                ),
              ),
              Expanded(
                child: CounterWidget(
                  product: list,
                ),
              ),
            ],
          ),
        )
      ],
    );
    //   },
    // );
  }
}
