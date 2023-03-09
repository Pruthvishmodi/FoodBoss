import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/search_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Models/shop_model.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/components/new_counter.dart';
import 'package:customer_app/Widgets/components/rating_widget.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../Widgets/Text widgets/label_text.dart';

// const inactivecardColor = Color.fromARGB(255, 224, 219, 219);
// const ActiveContainerColor = Color.fromARGB(255, 6, 6, 9);

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      print(_controller.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    SearchScreenController searchController = Get.put(SearchScreenController());
    Size size = MediaQuery.of(context).size;
    bool isSelected = false;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        // child: SearchBar(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: ThemeConfig.greyColor,
                  blurRadius: 15.0,
                  spreadRadius: 2.0,
                )
              ]),
              child: TextField(
                autofocus: false,
                // onSubmitted: ,
                cursorColor: ThemeConfig.primaryColor,
                onSubmitted: (val) =>
                    searchController.getSearchSuggestions(val),
                // onSubmitted: (val){
                //   searchController.fetchProducts(val);
                // },
                onTap: () {},
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: ThemeConfig.whiteColor,
                  contentPadding:
                      const EdgeInsets.only(top: 7, bottom: 7, left: 20),
                  hintText: 'Search',
                  hintStyle:
                      const TextStyle(color: ThemeConfig.descriptionColor),
                  prefixIcon: IconButton(
                    onPressed: () {
                      searchController.suggestion.value = [];
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ThemeConfig.mainTextColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: ThemeConfig.whiteColor),
                    borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
                    borderSide: const BorderSide(
                        color: ThemeConfig.whiteColor, width: 0),
                  ),
                  border: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
                    borderSide: const BorderSide(
                        color: ThemeConfig.whiteColor, width: 0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: ThemeConfig.screenPadding,
        constraints: const BoxConstraints(maxWidth: ThemeConfig.maxScreenSize),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: TabBar(
                    controller: _controller,

                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      color: ThemeConfig.secondaryColor,
                    ),

                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    // indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(
                        text: 'Products',
                      ),
                      // SizedBox(width: 5,),
                      Tab(
                        text: 'Stores',
                      ),
                    ],
                  ),
                ),
                SB.large(),
                Expanded(
                    child: TabBarView(controller: _controller, children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Obx(
                      () {
                        if (searchController.products.value.products == null) {
                          return ListView.builder(
                            itemCount: 5,
                            // shrinkWrap: true,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemBuilder: (BuildContext context, int index) {
                              return const ShimmerListTile();
                            },
                          );
                        } else {
                          return searchController
                                      .products.value.products!.length ==
                                  0
                              ? Container(
                                  child: MainLabelText(text: 'Search Products'),
                                  alignment: Alignment.center,
                                )
                              // : searchController.suggestion == []
                              //     ? Container(
                              //         child: MainLabelText(text: 'Search '),
                              //         alignment: Alignment.center,
                              //       )
                              : ListView.builder(
                                  itemCount: searchController
                                      .products.value.products!.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ProductListTile(
                                      product: searchController
                                          .products.value.products![index],
                                      index: index,
                                    );
                                  },
                                );
                        }
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Obx(
                      () {
                        if (searchController.shops.value.data == null) {
                          return ListView.builder(
                            itemCount: 5,
                            // shrinkWrap: true,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemBuilder: (BuildContext context, int index) {
                              return const ShimmerListTile();
                            },
                          );
                        } else if (searchController.shops.value.data!.length ==
                            0) {
                          return Center(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/shop.png",
                                    width: 150,
                                    height: 150,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  MainLabelText(
                                    alignment: TextAlign.center,
                                    text:
                                        "Sorry, there are currently no stores open at your location",
                                    isBold: true,
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount:
                                searchController.shops.value.data!.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return StoreSearchTiles(
                                shopModel:
                                    searchController.shops.value.data![index],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ]))
              ],
            ),
            Obx(
              () => searchController.suggestion.length == 0
                  ? SizedBox()
                  : Container(
                      padding: EdgeInsets.all(5),
                      color: ThemeConfig.whiteColor,
                      height: size.height * 0.8,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: searchController.suggestion.length,
                          itemBuilder: (context, index) => ListTile(
                                onTap: () {
                                  _controller.index = 0;
                                  FocusScope.of(context).unfocus();
                                  searchController.getProducts(searchController
                                      .suggestion.value[index].id!);
                                  searchController.suggestion.value = [];
                                },
                                leading: Container(
                                  // radius: 50,
                                  // backgroundColor: ThemeConfig.whiteColor,
                                  // backgroundImage:
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: NetworkImage(
                                      searchController
                                          .suggestion[index].imagePath
                                          .toString(),
                                    ),
                                  )),
                                ),
                                title: LabelText(
                                    text: searchController
                                        .suggestion.value[index].name
                                        .toString()),
                              )),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductListTile extends StatelessWidget {
  final Product product;
  final int index;
  const ProductListTile({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchScreenController screenController =
        Get.find<SearchScreenController>();
    UserController userController = Get.find<UserController>();
    ProductController productController = Get.put(ProductController());

    return GestureDetector(
      onTap: () {
        // Get.toNamed('/store-products-screen');
        productController.fetchProductDetails(product.shop!.id, product.id,
            screenController.products.value.products![index].quantity!, 0);

        Get.toNamed('/product-detail');
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8, top: 15, bottom: 12),
                      child: Image.network(
                        product.photo!,
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
                // Container(
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage("assets/images/123.jpg"),
                //           fit: BoxFit.fill),
                //       borderRadius:
                //           BorderRadius.circular(ThemeConfig.radiusMax)),
                // ),
                ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DescriptionText(
                      text: product.name!.split('-')[0],
                      color: ThemeConfig.secondaryColor,
                    ),
                    MainLabelText(
                      text: product.name!.split('-')[1].split(',')[0].trim(),
                      isBold: true,
                    ),
                    SB.small(),
                    // Row(
                    //   children:  [
                    //     // Icon(
                    //     //   Icons.star,
                    //     //   size: 17,
                    //     //   color: ThemeConfig.primaryColor,
                    //     // ),
                    //     LabelText(
                    //       text: product.shop!.name!,
                    //       // isBold: true,
                    //     )
                    //   ],
                    // ),
                    LabelText(
                      text: "${product.shop!.name}",
                      isSecondary: true,
                    ),
                    SB.small(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            LabelText(text: "\u{20B9} ${product.price}"),
                            const SizedBox(
                              width: 5,
                            ),
                            DescriptionText(
                                text: '${product.weight} ${product.unit}')
                          ],
                        ),
                        Obx(
                          () => NewCounter(
                            // width: double.infinity,
                            count: screenController
                                .products.value.products![index].quantity!,
                            increment: () async {
                              print(product.id);
                              print(product.shop!.id);
                              var call = await userController.cartController
                                  .addToCARTDIRECTLY(
                                      product.id!,
                                      product.shop!.id!,
                                      screenController.products.value
                                              .products![index].quantity! +
                                          1,
                                      0);

                              if (call["success"] == true) {
                                screenController.products.value.products![index]
                                    .quantity = screenController.products.value
                                        .products![index].quantity! +
                                    1;
                                screenController.products.value.products![index]
                                        .deleteCartId =
                                    int.parse(call["cart_id"].toString());
                                userController.cartController.addToCart();
                                screenController.products.refresh();
                              }
                            },
                            decrement: () async {
                              if (screenController.products.value
                                      .products![index].quantity! >
                                  1) {
                                print('here');
                                var call = await userController.cartController
                                    .addToCARTDIRECTLY(
                                        product.id!,
                                        product.shop!.id!,
                                        screenController.products.value
                                                .products![index].quantity! -
                                            1,
                                        0);
                                if (call["success"] == true) {
                                  screenController
                                      .products
                                      .value
                                      .products![index]
                                      .quantity = screenController.products
                                          .value.products![index].quantity! -
                                      1;
                                  screenController.products.value
                                          .products![index].deleteCartId =
                                      int.parse(call["cart_id"].toString());
                                  print(call["cart_id"]);
                                  print(screenController.products.value
                                      .products![index].deleteCartId);

                                  userController.cartController
                                      .removeFromCart();

                                  screenController.products.refresh();
                                }
                              } else {
                                print('removed');
                                var call = await userController.cartController
                                    .removeToCARTDIRECTLY(screenController
                                        .products
                                        .value
                                        .products![index]
                                        .deleteCartId!);
                                if (call) {
                                  screenController.products.value
                                      .products![index].quantity = 0;
                                  userController.cartController
                                      .removeFromCart();

                                  screenController.products.refresh();
                                }
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class StoreSearchTiles extends StatelessWidget {
  final ShopModel shopModel;
  const StoreSearchTiles({
    Key? key,
    required this.shopModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreProductController storeProductController =
        Get.put(StoreProductController());
    return GestureDetector(
      onTap: () {
        if (!shopModel.isShopClose!) {
          storeProductController.setStoreWithoutCat(shopModel);
          Get.toNamed('/store-products-screen');
        } else {
          CustomSnackbar.infoSnackbar('Store is temporary closed');
        }
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  foregroundDecoration: shopModel.isShopClose!
                      ? BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          backgroundBlendMode: BlendMode.saturation,
                        )
                      : null,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: shopModel.shopImage!,
                      fit: BoxFit.fill,
                      progressIndicatorBuilder:
                          (BuildContext context, child, loadingProgress) {
                        return Center(
                            child: Shimmer.fromColors(
                          child: const ShimmerContainerSquare(size: 100),
                          baseColor: Colors.grey[200]!,
                          highlightColor: Colors.grey[50]!,
                          enabled: true,
                        ));
                      },
                    ),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainLabelText(
                      text: shopModel.name!,
                      isBold: true,
                    ),
                    SB.small(),
                    DescriptionText(
                        text:
                            '${shopModel.city} - ${(shopModel.distance! / 1000).toStringAsFixed(2)} km away'),
                    SB.small(),
                    shopModel.totalRatings == null
                        ? const SizedBox()
                        : Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ThemeConfig.primaryColorLite,
                                  border: Border.all(
                                      width: 1,
                                      color: ThemeConfig.primaryColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(3),
                                child: Row(
                                  children: [
                                    LabelText(
                                        text: shopModel.totalRatings == null
                                            ? '0'
                                            : shopModel.totalRatings
                                                .toString()),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    StarRatingWidget(
                                        value: shopModel.totalRatings == null
                                            ? 5
                                            : double.parse(
                                                shopModel.totalRatings!)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              DescriptionText(
                                text: ' (${shopModel.totalReviews})',
                                // isBold: true,
                              )
                            ],
                          ),
                    shopModel.isShopClose!
                        ? const LabelText(text: 'Temporarily closed')
                        : const SizedBox()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
