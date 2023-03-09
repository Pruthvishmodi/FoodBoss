import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Screens/Store%20products%20screen/demoData.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/components/new_counter.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavProductContainer extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  UserController userController = Get.find<UserController>();
  final Product product;
  final index;
  FavProductContainer({Key? key, required this.product, this.index})
      : super(key: key);

  openSheet() {
    print('tapped');
    Get.bottomSheet(
      Wrap(
        children: [
          Container(
            padding: ThemeConfig.screenPadding,
            child: Column(
              children: [
                Container(
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        product.photo.toString()))),
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
                            MainLabelText(text: product.name.toString()),
                            const DescriptionText(text: 'Delivery in 5 Min'),
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
                          itemCount:
                              democategoryList[0].products![0].varients.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   selectedIndex = index;
                                  // });
                                },
                                child: Container(
                                  width: double.infinity,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color:
                                        // selectedIndex == index
                                        //     ? ThemeConfig.secondaryColorLite
                                        // :
                                        ThemeConfig.whiteColor,
                                    border: Border.all(
                                        width: 1,
                                        color: ThemeConfig.secondaryColorLite),
                                    borderRadius: BorderRadius.circular(
                                        ThemeConfig.radiusMin),
                                  ),
                                  padding: ThemeConfig.screenPadding,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          LabelText(
                                              text: democategoryList[0]
                                                  .products![0]
                                                  .varients[index]
                                                  .unit!),
                                          Row(
                                            children: [
                                              LabelText(
                                                  text:
                                                      '\u{20B9} ${democategoryList[0].products![0].varients[index].price!}'),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              DescriptionText(
                                                text:
                                                    '\u{20B9} ${democategoryList[0].products![0].varients[index].price}',
                                                type: 'i',
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      // NewCounter(count: ,),
                                    ],
                                  ),
                                ),
                              ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
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

  @override
  Widget build(BuildContext context) {
    // print(product.quantity!);
    return Container(
      width: 120.0,
      // height: 270,
      // margin: const EdgeInsets.symmetric(horizontal: 5, vertical:2),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
        // border: Border.all(color: ThemeConfig.borderColor, width: .5),
        color: ThemeConfig.whiteColor,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                productController.fetchProductDetails(
                    product.shop!.id,
                    product.id,
                    userController.favFoods.value.products![index].quantity!,
                    0);

                Get.toNamed('/product-detail');
              },
              child: Stack(
                children: [
                  Container(
                    child:
                        Center(child: Image.network(product.photo.toString())),

                    // const Positioned(right: 3, top: 3, child: FavButtonWidget())
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/product-detail');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SB.small(),
                  LabelText(
                    text: product.name!.split('-')[0].trim().toString(),
                    isDotDot: true,
                    isSecondary: true,
                  ),
                  DescriptionText(
                    text: product.name!.split('-')[1].trim(),
                    isDotDot: true,
                  ),
                  Row(
                    children: [
                      LabelText(
                        text: '\u{20B9} ${product.discount.toString()}',
                      ),
                      product.price == product.discount
                          ? SizedBox()
                          : const SizedBox(
                              width: 5,
                            ),
                      product.price == product.discount
                          ? SizedBox()
                          : DescriptionText(
                              text: '${product.price.toString()}',
                              type: 'i',
                              isDotDot: true,
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   padding: const EdgeInsets.symmetric(horizontal: 5),
          //   margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          //   decoration: BoxDecoration(
          //     border:
          //         Border.all(width: 1, color: ThemeConfig.secondaryColorLite),
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   child: product.variants == null
          //       ? const DescriptionText(text: 'unit')
          //       : product.variants!.length == 1
          //           ? DescriptionText(text: product.variants![1].unit!)
          //           : GestureDetector(
          //               behavior: HitTestBehavior.translucent,
          //               onTap: () {
          //                 openSheet();
          //               },
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   DescriptionText(text: product.variants![1].unit!),
          //                   const Icon(
          //                     Icons.arrow_drop_down,
          //                     color: ThemeConfig.secondaryColor,
          //                   )
          //                 ],
          //               ),
          //             ),
          // ),
          Obx(
            () => NewCounter(
              width: double.infinity,
              count: userController.favFoods.value.products![index].quantity!,
              increment: () async {
                var call = await userController.cartController
                    .addToCARTDIRECTLY(
                        product.id!,
                        product.shop!.id!,
                        userController
                                .favFoods.value.products![index].quantity! +
                            1,
                        0);

                if (call["success"]) {
                  userController.favFoods.value.products![index].quantity =
                      userController.favFoods.value.products![index].quantity! +
                          1;

                  userController.favFoods.value.products![index].deleteCartId =
                      call['cart_id'];
                  userController.cartController.addToCart();
                  userController.favFoods.refresh();
                }
              },
              decrement: () async {
                if (userController.favFoods.value.products![index].quantity! >
                    1) {
                  print('here');
                  var call = await userController.cartController
                      .addToCARTDIRECTLY(
                          product.id!,
                          product.shop!.id!,
                          userController
                                  .favFoods.value.products![index].quantity! -
                              1,
                          0);
                  if (call["success"] == true) {
                    userController.favFoods.value.products![index].quantity =
                        userController
                                .favFoods.value.products![index].quantity! -
                            1;

                    userController.favFoods.value.products![index]
                        .deleteCartId = call['cart_id'];
                    userController.cartController.removeFromCart();

                    userController.favFoods.refresh();
                  }
                } else {
                  print('removed');
                  var call = await userController.cartController
                      .removeToCARTDIRECTLY(product.deleteCartId!);
                  if (call) {
                    userController.favFoods.value.products![index].quantity = 0;
                    userController.cartController.removeFromCart();

                    userController.favFoods.refresh();
                  }
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
