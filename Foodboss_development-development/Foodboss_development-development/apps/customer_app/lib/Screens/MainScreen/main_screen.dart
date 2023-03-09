import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/category_page_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/main_screen_ui_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/map_address_controller.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Models/shop_model.dart';
import 'package:customer_app/Screens/CategoryScreen/catreogry_screen.dart';
import 'package:customer_app/Screens/MainScreen/favorite_product_section.dart';
import 'package:customer_app/Screens/MainScreen/favorite_store_section.dart';
import 'package:customer_app/Screens/MainScreen/header_backgroud.dart';
import 'package:customer_app/Screens/MainScreen/product_container.dart';
import 'package:customer_app/Screens/MainScreen/searchbar_widget.dart';
import 'package:customer_app/Widgets/Banner/banner_widget.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/heading_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/cart_widget.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CategoryPageController categoryPageController =
        Get.put(CategoryPageController());
    MainScreenController mainScreenController = Get.put(MainScreenController());

    UserController userController = Get.find<UserController>();
    CartController cartCtrl = Get.find<CartController>();
    MapAdressController mapAdressController = Get.find<MapAdressController>();
    return Scaffold(
      backgroundColor: ThemeConfig.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height - 102,
              child: NestedScrollView(
                headerSliverBuilder: ((context, innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      snap: false,
                      pinned: true,
                      forceElevated: innerBoxIsScrolled,

                      floating: false,
                      flexibleSpace: const FlexibleSpaceBar(
                        centerTitle: false,
                        title: SearchBarWidget(),
                        expandedTitleScale: 1,
                        titlePadding: EdgeInsets.all(7),
                        background: HeaderBackground(),
                      ), //FlexibleSpaceBar
                      expandedHeight: 150,
                      backgroundColor: ThemeConfig.whiteColor,
                    ),
                  ];
                }),
                body: RefreshIndicator(
                  onRefresh: () async {
                    await cartCtrl.fetchCart();
                    userController.getFavoritesFoods();
                    userController.getFavoritesStores();
                    userController.getBanners();
                    mapAdressController.getAllAddress();
                    mainScreenController.getRandom();
                    // categoryPageController.categories.value.data!.setAll(0,[]);
                  },
                  child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BannerWidget(
                                    index: 0,
                                  ),
                                  SB.medium(),
                                  const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: MainLabelText(
                                      text: 'Category',
                                      isBold: true,
                                    ),
                                  ),
                                  CategoriesWidget(
                                      categoryPageController:
                                          categoryPageController,
                                      size: size),
                                  // SB.medium(),
                                  SB.medium(),

                                  // Obx(
                                  //   () => mainScreenController.userController
                                  //               .favFoods.value.products ==
                                  //           null
                                  //       ? const SizedBox(
                                  //           width: 0,
                                  //         )
                                  //       : BannerWidget(
                                  //           index: 1,
                                  //         ),
                                  // ),
                                  SB.medium(),
                                  Obx(
                                    () {
                                      return mainScreenController.userController
                                                  .favFoods.value.products ==
                                              null
                                          ? Container()
                                          : mainScreenController
                                                  .userController
                                                  .favFoods
                                                  .value
                                                  .products!
                                                  .isEmpty
                                              ? const SizedBox()
                                              : const FavoriteProductSection();
                                    },
                                  ),
                                  //                   mainScreenController
                                  // .userController.favFoods.value.products!.isEmpty ?Container() :FavoriteProductSection(),

                                  SB.medium(),

                                  Obx(
                                    () => mainScreenController.userController
                                                .favStores.value.stores ==
                                            null
                                        ? const SizedBox(
                                            width: 0,
                                          )
                                        : mainScreenController.userController
                                                .favStores.value.stores!.isEmpty
                                            ? const SizedBox()
                                            : BannerWidget(
                                                index: 2,
                                              ),
                                  ),
                                  SB.medium(),

                                  Obx(
                                    () {
                                      return mainScreenController.userController
                                                  .favStores.value.stores ==
                                              null
                                          ? Container()
                                          : mainScreenController
                                                  .userController
                                                  .favStores
                                                  .value
                                                  .stores!
                                                  .isEmpty
                                              ? Container()
                                              : const FavoriteStoreSection();
                                    },
                                  ),

                                  SB.medium(),
                                  Obx(
                                    () {
                                      if (mainScreenController
                                          .randomproductsbyshops.isEmpty) {
                                        return Shimmer.fromColors(
                                            child: const ShimmerContainer(
                                              height: 200,
                                              width: double.infinity,
                                            ),
                                            baseColor: Colors.white,
                                            highlightColor:
                                                Colors.grey.shade200);
                                      } else {
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: mainScreenController
                                                .randomproductsbyshops
                                                .value
                                                .length,
                                            itemBuilder: (context, index) {
                                              return BannerProduct(
                                                bannerIndex: 3 + index,
                                                shopModel: mainScreenController
                                                    .randomproductsbyshops
                                                    .value[index],
                                              );
                                            });
                                      }
                                    },
                                  ),
                                  // const BannerProduct(bannerIndex),

                                  // SB.medium(),

                                  // BannerWidget(
                                  //   index: 3,
                                  // ),
                                  // SB.medium(),
                                  // BannerWidget(
                                  //   index: 4,
                                  // ),
                                  SB.large(),
                                  SB.large(),
                                  SB.large(),
                                  SB.large(),
                                  Container(
                                    padding: ThemeConfig.screenPadding,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const HeadingText(
                                            text:
                                                'Couldn\'t find what you are looking for ?'),
                                        SB.medium(),
                                        SizedBox(
                                          width: size.width / 2,
                                          child: DistructiveButton(
                                            op: () {
                                              Get.toNamed('/search-screen');
                                            },
                                            text: 'Search',
                                            type: 'filled',
                                            icon: Icons.chevron_right_sharp,
                                            isIcon: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SB.large(),
                                  SB.large(),
                                  SB.large(),
                                  SB.large(),
                                  SB.large(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            CartWidget(),
          ],
        ),
      ),
    );
  }
}

class BannerProduct extends StatelessWidget {
  final int bannerIndex;
  final ShopModel shopModel;
  const BannerProduct({
    Key? key,
    required this.bannerIndex,
    required this.shopModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    StoreProductController storeProductController =
        Get.put(StoreProductController());
    return Obx(
      () => Column(
        children: [
          userController.banners.value.data != null
              ? (userController.banners.value.data!.length - 1 >= bannerIndex)
                  ? BannerWidget(index: bannerIndex)
                  : const SizedBox(
                      width: 0,
                    )
              : const SizedBox(
                  width: 0,
                ),
          SB.medium(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                  // parent:
                  //     AlwaysScrollableScrollPhysics()
                  ),
              child: SizedBox(
                height: 230,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!shopModel.isShopClose!) {
                          storeProductController.setStoreWithoutCat(
                            shopModel,
                          );

                          Get.toNamed('/store-products-screen');
                        } else {
                          CustomSnackbar.infoSnackbar(
                              'Store is temporary closed');
                        }
                      },
                      child: Container(
                        height: 230,
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: ThemeConfig.greyColor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        width: 120,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    shopModel.shopImage.toString(),
                                    // fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SB.medium(),
                              LabelText(
                                text: shopModel.name.toString(),
                                alignment: TextAlign.center,
                              ),
                              DescriptionText(
                                  text:
                                      '${(shopModel.distance! / 1000).toStringAsFixed(1)} km Away'),
                            ],
                          ),
                        ),
                        // color: ThemeConfig.greyColor,
                      ),
                    ),
                    shopModel.randomProducts != null
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: shopModel.randomProducts!.length,
                            itemBuilder: (BuildContext context, int index) {
                              Product product = Product();
                              product.name = shopModel
                                  .randomProducts![index].name
                                  .toString();
                              product.photo = shopModel
                                      .randomProducts![index].photo ??
                                  'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg';
                              product.price = shopModel
                                  .randomProducts![index].price
                                  .toString();
                              product.discount = shopModel
                                  .randomProducts![index].discount
                                  .toString();
                              product.id = int.parse(shopModel
                                  .randomProducts![index].id
                                  .toString());
                              product.weight = double.parse(shopModel
                                  .randomProducts![index].weight
                                  .toString());
                              product.unit = shopModel
                                  .randomProducts![index].unit
                                  .toString();
                              product.shop = ShopModel(
                                  id: shopModel.id != null
                                      ? int.parse(shopModel.id.toString())
                                      : 0);
                              return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ProductContainer(
                                    prodIndex: index,
                                    shopIndex: bannerIndex - 3,
                                    product: product,
                                  ));
                            },
                          )
                        : const SizedBox(),
                    GestureDetector(
                      onTap: () {
                        if (!shopModel.isShopClose!) {
                          storeProductController.setStoreWithoutCat(
                            shopModel,
                          );

                          Get.toNamed('/store-products-screen');
                        } else {
                          CustomSnackbar.infoSnackbar(
                              'Store is temporary closed');
                        }
                      },
                      child: Container(
                        height: 230,
                        decoration: const BoxDecoration(
                            color: ThemeConfig.greyColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        width: 120,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              MainLabelText(
                                text: 'See',
                                isBold: true,
                              ),
                              MainLabelText(
                                text: 'All',
                                isBold: true,
                              ),
                            ],
                          ),
                        ),
                        // color: ThemeConfig.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
