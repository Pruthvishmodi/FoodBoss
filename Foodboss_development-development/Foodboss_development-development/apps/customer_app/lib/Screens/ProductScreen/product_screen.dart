import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/store_product_ui_controller.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Widgets/Buttons/fav_button_widget.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/components/new_counter.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:customer_app/utils/dylink_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

const inactivecardColor = Color.fromARGB(255, 246, 242, 242);
const activeContainerColor = Color.fromARGB(255, 206, 242, 220);

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    UserController userController = Get.find<UserController>();
    StoreProductController storeProductController =
        Get.put(StoreProductController());
    StoreProductUiController storeProductUiController =
        Get.put(StoreProductUiController());
    return Obx(() {
      if (productController.isLoading.value == true) {
        return const Scaffold(body: ShimmerScreen());
      } else {
        Product product = productController.product.value.product!;

        return WillPopScope(
          onWillPop: () async {
            if (Get.previousRoute == '/store-products-screen') {
              log(Get.previousRoute);

              storeProductController
                  .store
                  .value
                  .categories![storeProductUiController.fragIndex.value]
                  .filteredProducts!
                  .firstWhere((element) =>
                      element.id == productController.product.value.product!.id)
                  .quantity = productController.product.value.product!.quantity;
              storeProductController
                      .store
                      .value
                      .categories![storeProductUiController.fragIndex.value]
                      .filteredProducts!
                      .firstWhere(
                          (element) =>
                              element.id ==
                              productController.product.value.product!.id)
                      .selectedVaritent =
                  productController.product.value.product!.selectedVaritent;

              storeProductController
                      .store
                      .value
                      .categories![storeProductUiController.fragIndex.value]
                      .filteredProducts!
                      .firstWhere(
                          (element) =>
                              element.id ==
                              productController.product.value.product!.id)
                      .deleteCartId =
                  productController.product.value.product!.deleteCartId;

              storeProductController.store.refresh();
            }
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeConfig.whiteColor,
              elevation: 0,
              iconTheme: const IconThemeData(color: ThemeConfig.mainTextColor),
              actions: [
                FavButtonWidget(
                  isSelected:
                      productController.product.value.product!.isFavorite,
                  op: () {
                    product.isFavorite == false
                        ? userController
                            .addFavFood(product.id!, product.shop!.id!)
                            .then((value) {
                            print(value);
                            if (value) {
                              productController
                                  .product.value.product!.isFavorite = true;
                              productController.product.refresh();
                            } else {
                              productController
                                  .product.value.product!.isFavorite = false;
                            }
                          })
                        : userController
                            .removeFavFood(product.id!, product.shop!.id!)
                            .then((value) {
                            if (value) {
                              productController
                                  .product.value.product!.isFavorite = false;

                              productController.product.refresh();
                            } else {
                              productController
                                  .product.value.product!.isFavorite = true;

                              productController.product.refresh();
                            }
                          });
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    var link = await DyLinkHelperClass()
                        .createDynamicProductLink(
                            productController.product.value.product!.shop!.id!,
                            productController.product.value.product!.id!,
                            product.photo!,
                            product.name!);

                    Share.share(link);
                  },
                  child: const Icon(
                    Icons.share,
                    size: 20,
                    color: ThemeConfig.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const ImageSection(),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SingleChildScrollView(
                          child: Container(
                            // height: MediaQuery.of(context).size.height,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MainLabelText(
                                      text: product.name!.split('-')[0],
                                      isBold: true,
                                    ),
                                    // CounterWidget(product: product),
                                    NewCounter(
                                        count: product.quantity != null
                                            ? product.quantity!
                                            : 0,
                                        increment: () {
                                          if (product.quantity! >=
                                              product.productStock!) {
                                            CustomSnackbar.infoSnackbar(
                                                'Sorry, No Stock available');
                                          } else {
                                            productController.addToCart();
                                          }
                                        },
                                        decrement: () {
                                          productController.removeToCart();
                                        }),
                                  ],
                                ),
                                SB.small(),
                                LabelText(text: product.name!.split('-')[1]),
                                SB.small(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    product.isRemoveMrp == true
                                        ? MainLabelText(
                                            text: "\u{20B9}${product.discount}",
                                            isBold: true,
                                          )
                                        : Row(
                                            children: [
                                              MainLabelText(
                                                text:
                                                    "\u{20B9}${product.discount}",
                                                isBold: true,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              product.price == product.discount
                                                  ? const SizedBox()
                                                  : Text(
                                                      "\u{20B9}${product.price}",
                                                      style: const TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough),
                                                    ),
                                              product.price == product.discount
                                                  ? const SizedBox()
                                                  : const SizedBox(
                                                      width: 5,
                                                    ),
                                              product.price == product.discount
                                                  ? const SizedBox()
                                                  : Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      color: ThemeConfig
                                                          .primaryColor,
                                                      // height: 15,
                                                      // width: 50,
                                                      child: Center(
                                                        child: Text(
                                                          "${((double.parse(product.price!) - double.parse(product.discount!)) * 100 / double.parse(product.price!)).toStringAsPrecision(2)} % off",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                    )
                                            ],
                                          ),
                                    product.vegetarianType == 'None'
                                        ? Container()
                                        : Container(
                                            height: 30,
                                            width: 30,
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: ThemeConfig.whiteColor,
                                              border: Border.all(
                                                width: 1,
                                                color: product.vegetarianType ==
                                                        'Veg'
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      product.vegetarianType ==
                                                              'Veg'
                                                          ? Colors.green
                                                          : Colors.red),
                                            ),
                                          ),
                                  ],
                                ),
                                SB.large(),
                                product.variants!.isNotEmpty
                                    ? Container()
                                    : Container(
                                        decoration: BoxDecoration(
                                            color: activeContainerColor,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        height: 100,
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Colors.green,
                                                            shape: BoxShape
                                                                .circle),
                                                  ),
                                                ),
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors.green),
                                                ),
                                              ),
                                            ),
                                            LabelText(
                                                text:
                                                    "${productController.product.value.product!.weight!} ${productController.product.value.product!.unit!}"),
                                            // SB.medium(),
                                            LabelText(
                                              text:
                                                  "\u{20B9} ${productController.product.value.product!.discount!.toString()}",
                                            ),
                                          ],
                                        ),
                                      ),
                                SB.large(),
                                product.variants!.isNotEmpty
                                    ? SizedBox(
                                        width: double.infinity,
                                        height: 80,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: product.variants!.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                productController
                                                    .product
                                                    .value
                                                    .product!
                                                    .selectedVaritent = index;
                                                productController
                                                    .changeVarient();
                                                productController.product
                                                    .refresh();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: productController
                                                                .product
                                                                .value
                                                                .product!
                                                                .selectedVaritent ==
                                                            index
                                                        ? activeContainerColor
                                                        : inactivecardColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                height: 100,
                                                width: 100,
                                                margin: const EdgeInsets.only(
                                                    right: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: productController
                                                                            .product
                                                                            .value
                                                                            .product!
                                                                            .selectedVaritent ==
                                                                        index
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .transparent,
                                                                shape: BoxShape
                                                                    .circle),
                                                          ),
                                                        ),
                                                        height: 15,
                                                        width: 15,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.green),
                                                        ),
                                                      ),
                                                    ),
                                                    LabelText(
                                                        text:
                                                            '${productController.product.value.product!.variants![index].weight!} ${productController.product.value.product!.variants![index].unit!}'),
                                                    // SB.medium(),
                                                    LabelText(
                                                      text:
                                                          "\u{20B9} ${productController.product.value.product!.variants![index].price!.toString()}",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : Container(),
                                const SizedBox(
                                  height: 8,
                                ),
                                ExpansionTile(
                                  tilePadding: const EdgeInsets.all(0),
                                  // initiallyExpanded: true,
                                  title: const MainLabelText(
                                    text: "Product details",
                                    isBold: true,
                                  ),
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // const LabelText(text: "Description "),
                                        SB.medium(),
                                        // DescriptionText(
                                        //     text: product.description! == ''
                                        //         ? 'No description is provided'
                                        //         : product.description!),
                                        Html(
                                            style: {
                                              // "*": Style(
                                              //   margin: EdgeInsets.zero,
                                              //   padding: EdgeInsets.zero,
                                              // ),
                                              "*": Style(
                                                  padding: EdgeInsets.zero,
                                                  margin: EdgeInsets.zero,
                                                  color:
                                                      ThemeConfig.mainTextColor,
                                                  lineHeight:
                                                      LineHeight.percent(110))
                                            },
                                            data: product.description != null &&
                                                    product.description != ''
                                                ? product.description.toString()
                                                : "<p>No Product Description Provided</p>"),
                                        SB.medium(),

                                        // const DescriptionText(
                                        //     text:
                                        //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
                                        // SB.medium(),
                                        // const LabelText(text: "ingrediants :"),
                                        // SB.medium(),
                                        // const LabelText(
                                        //     text:
                                        //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ."),
                                        // SB.medium(),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ExpansionTile(
                                  tilePadding: const EdgeInsets.all(0),
                                  // initiallyExpanded: true,
                                  title: const MainLabelText(
                                    text: "Ingredients",
                                    isBold: true,
                                  ),
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // const LabelText(text: "Description "),
                                        SB.medium(),
                                        // DescriptionText(
                                        //     text: product.description! == ''
                                        //         ? 'No description is provided'
                                        //         : product.description!),
                                        Html(
                                            style: {
                                              // "*": Style(
                                              //   margin: EdgeInsets.zero,
                                              //   padding: EdgeInsets.zero,
                                              // ),
                                              "*": Style(
                                                  padding: EdgeInsets.zero,
                                                  margin: EdgeInsets.zero,
                                                  color:
                                                      ThemeConfig.mainTextColor,
                                                  lineHeight:
                                                      LineHeight.percent(110))
                                            },
                                            data: product.ingredients != null &&
                                                    product.ingredients != ''
                                                ? product.ingredients.toString()
                                                : "<p>No Product ingredients Provided</p>"),
                                        // SB.medium(),

                                        // const DescriptionText(
                                        //     text:
                                        //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
                                        // SB.medium(),
                                        // const LabelText(text: "ingrediants :"),
                                        // SB.medium(),
                                        // const LabelText(
                                        //     text:
                                        //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ."),
                                        SB.medium(),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
        // child: Container(
        //   height: MediaQuery.of(context).size.height,
        //   child: Container(
        //     height: MediaQuery.of(context).size.height,
        //     child: Column(
        //       children: [
        //         ImageSection(),
        //         Expanded(
        //           flex: 2,
        //           child: Padding(
        //             padding: const EdgeInsets.all(18.0),
        //             child: SingleChildScrollView(
        //               child: Container(
        //                 // height: MediaQuery.of(context).size.height,
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         const MainLabelText(
        //                           text: "Wooden wool",
        //                           isBold: true,
        //                         ),
        //                         CounterWidget(),
        //                       ],
        //                     ),
        //                     SB.small(),
        //                     const LabelText(text: "Hooded Jacket"),
        //                     SB.small(),
        //                     Row(
        //                       children: [
        //                         const MainLabelText(
        //                           text: "\u{20B9}${200}",
        //                           isBold: true,
        //                         ),
        //                         const SizedBox(
        //                           width: 5,
        //                         ),
        //                         const Text(
        //                           "\u{20B9}${235}",
        //                           style: TextStyle(
        //                               decoration: TextDecoration.lineThrough),
        //                         ),
        //                         const SizedBox(
        //                           width: 5,
        //                         ),
        //                         Container(
        //                           color: ThemeConfig.primaryColor,
        //                           height: 15,
        //                           width: 50,
        //                           child: const Center(
        //                             child: Text(
        //                               "35% off",
        //                               style: TextStyle(
        //                                   fontSize: 10, color: Colors.black),
        //                             ),
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                     SB.large(),
        //                     SB.large(),
        //                     Row(
        //                       children: [
        //                         GestureDetector(
        //                           onTap: () {
        //                             setState(() {
        //                               selectedSlot = Slot.container1;
        //                             });
        //                           },
        //                           child: Container(
        //                             decoration: BoxDecoration(
        //                                 color: selectedSlot == Slot.container1
        //                                     ? ActiveContainerColor
        //                                     : inactivecardColor,
        //                                 borderRadius:
        //                                     BorderRadius.circular(12)),
        //                             height: 80,
        //                             width: 80,
        //                             child: Column(
        //                               children: [
        //                                 Padding(
        //                                   padding: const EdgeInsets.all(8.0),
        //                                   child: Container(
        //                                     child: Padding(
        //                                       padding:
        //                                           const EdgeInsets.all(2.0),
        //                                       child: Container(
        //                                         decoration: BoxDecoration(
        //                                             color: selectedSlot ==
        //                                                     Slot.container1
        //                                                 ? Colors.green
        //                                                 : Colors.transparent,
        //                                             shape: BoxShape.circle),
        //                                       ),
        //                                     ),
        //                                     height: 15,
        //                                     width: 15,
        //                                     decoration: BoxDecoration(
        //                                       borderRadius:
        //                                           BorderRadius.circular(15),
        //                                       border: Border.all(
        //                                           color: Colors.green),
        //                                     ),
        //                                   ),
        //                                 ),
        //                                 const LabelText(
        //                                   text: "500 g",
        //                                 ),
        //                                 SB.medium(),
        //                                 const LabelText(
        //                                   text: "\u{20B9}${235}",
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                         const SizedBox(
        //                           width: 10,
        //                           height: 5,
        //                         ),
        //                         GestureDetector(
        //                           onTap: () => setState(() {
        //                             selectedSlot = Slot.container2;
        //                           }),
        //                           child: Container(
        //                             decoration: BoxDecoration(
        //                                 color: selectedSlot == Slot.container2
        //                                     ? ActiveContainerColor
        //                                     : inactivecardColor,
        //                                 borderRadius:
        //                                     BorderRadius.circular(12)),
        //                             height: 80,
        //                             width: 80,
        //                             child: Column(
        //                               children: [
        //                                 Padding(
        //                                   padding: const EdgeInsets.all(8.0),
        //                                   child: Container(
        //                                     child: Padding(
        //                                       padding:
        //                                           const EdgeInsets.all(2.0),
        //                                       child: Container(
        //                                         decoration: BoxDecoration(
        //                                             color: selectedSlot ==
        //                                                     Slot.container2
        //                                                 ? Colors.green
        //                                                 : Colors.transparent,
        //                                             shape: BoxShape.circle),
        //                                       ),
        //                                     ),
        //                                     height: 15,
        //                                     width: 15,
        //                                     decoration: BoxDecoration(
        //                                       color: Colors.transparent,
        //                                       borderRadius:
        //                                           BorderRadius.circular(15),
        //                                       border: Border.all(
        //                                           color: Colors.green),
        //                                     ),
        //                                   ),
        //                                 ),
        //                                 const LabelText(
        //                                   text: "1 kg",
        //                                 ),
        //                                 SB.medium(),
        //                                 const LabelText(
        //                                   text: "\u{20B9}${470}",
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                     const SizedBox(
        //                       height: 8,
        //                     ),
        //                     ExpansionTile(
        //                       tilePadding: const EdgeInsets.all(0),
        //                       title: const MainLabelText(
        //                         text: "Product details",
        //                         isBold: true,
        //                       ),
        //                       children: [
        //                         Column(
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.spaceEvenly,
        //                           children: [
        //                             const LabelText(text: "Description "),
        //                             SB.medium(),
        //                             const DescriptionText(
        //                                 text:
        //                                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
        //                             SB.medium(),
        //                             const LabelText(text: "ingrediants :"),
        //                             SB.medium(),
        //                             const LabelText(
        //                                 text:
        //                                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ."),
        //                             SB.medium(),
        //                           ],
        //                         )
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}

class ImageSection extends StatefulWidget {
  const ImageSection({
    Key? key,
  }) : super(key: key);
  @override
  State<ImageSection> createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> {
  // final List<String> imgList = [
  //   "assets/images/product.png",
  //   "assets/images/product.png",
  //   "assets/images/product.png",
  //   "assets/images/product.png",
  //   "assets/images/product.png",
  // ];
  ProductController productController = Get.find<ProductController>();

  CarouselController carouselController = CarouselController();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Obx(() {
        if (productController.isLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          Product product = productController.product.value.product!;

          return Column(
            children: [
              Expanded(
                child: CarouselSlider(
                  carouselController: carouselController,
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      height: 400.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: product.gallery!.isEmpty
                      ? [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Image.network(
                                product.photo!,
                                fit: BoxFit.contain,
                              ))
                        ]
                      : product.gallery!.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Image.network(
                                    i.url!,
                                  ));
                            },
                          );
                        }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: product.gallery!.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: 7.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        }
      }),
    );
  }
}
