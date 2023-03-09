import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Models/shop_model.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/title_text.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const inactivecardColor = Color.fromARGB(255, 224, 219, 219);
const ActiveContainerColor = Color.fromARGB(255, 6, 6, 9);

enum Slot {
  Delivery,
  Dining,
}

class FavroiteStore extends StatefulWidget {
  const FavroiteStore({Key? key}) : super(key: key);

  @override
  State<FavroiteStore> createState() => _FavroiteStoreState();
}

class _FavroiteStoreState extends State<FavroiteStore>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'LEFT'),
    const Tab(text: 'RIGHT'),
  ];
  Slot selectedSlot = Slot.Delivery;
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

  var args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    _controller.index = args[0];
    UserController userController = Get.find<UserController>();
    Size size = MediaQuery.of(context).size;
    bool isSelected = false;
    return Scaffold(
      backgroundColor: ThemeConfig.whiteColor,
      appBar: AppBar(
        backgroundColor: ThemeConfig.whiteColor,
        iconTheme: const IconThemeData(color: ThemeConfig.mainTextColor),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          padding: ThemeConfig.screenPadding,
          constraints:
              const BoxConstraints(maxWidth: ThemeConfig.maxScreenSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(text: 'My Favourites'),
              const SizedBox(
                height: 20,
              ),
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

                  // give the indicator a decoration (color and border radius)
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
                Obx(
                  () {
                    if (userController.favFoods.value.products == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (userController.favFoods.value.products!.isEmpty) {
                        return const Center(
                          child: MainLabelText(
                              text: 'No Favorite products added yet'),
                        );
                      } else {
                        return Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ListView.builder(
                            itemCount:
                                userController.favFoods.value.products!.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return ProductListTile(
                                index: index,
                              );
                            },
                          ),
                        );
                      }
                    }
                  },
                ),
                Obx(
                  () {
                    if (userController.favStores.value.stores == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (userController.favStores.value.stores!.isEmpty) {
                        return const Center(
                          child: MainLabelText(
                              text: 'No Favorite Stores added yet'),
                        );
                      } else {
                        return Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ListView.builder(
                            itemCount:
                                userController.favStores.value.stores!.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return StoreListTile(
                                index: index,
                              );
                            },
                          ),
                        );
                      }
                    }
                  },
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

class ProductListTile extends StatelessWidget {
  final int index;
  const ProductListTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    ProductController productController = Get.put(ProductController());
    Product product = userController.favFoods.value.products![index];
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                productController.fetchProductDetails(
                    product.shop!.id, product.id, 0, 0);

                Get.toNamed('/product-detail');
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                // color: ThemeConfig.secondaryColor,
                child: Row(
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
                            LabelText(
                              text: product.name!.split('-')[0],
                              isSecondary: true,
                            ),
                            MainLabelText(
                              text: product.name!.split('-')[1].trim(),
                              isBold: true,
                            ),
                            SB.small(),
                            Row(
                              children: [
                                // Icon(
                                //   Icons.star,
                                //   size: 17,
                                //   color: ThemeConfig.primaryColor,
                                // ),
                                LabelText(
                                  text: product.shop!.name!,
                                  // isBold: true,
                                )
                              ],
                            ),
                            DescriptionText(
                                text: '\u{20B9} ${product.discount!}')
                            // SB.small(),
                            //  LabelText(text: "\u{20B9} ${product.price!}"),
                            //  DescriptionText(text: '150g')
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              userController.removeFavFood(
                product.id!,
                product.shop!.id!,
              );
            },
            child: const SizedBox(
              height: 100,
              // color: ThemeConfig.secondaryColor,
              child: Icon(
                Icons.favorite,
                color: Colors.pink,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}

class StoreListTile extends StatelessWidget {
  final int index;
  const StoreListTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    StoreProductController storeProductController =
        Get.put(StoreProductController());
    ShopModel store = userController.favStores.value.stores![index];
    return GestureDetector(
      onTap: () {
        if (!store.isShopClose!) {
          storeProductController.setStoreWithoutCat(
            store,
          );

          Get.toNamed('/store-products-screen');
        } else {
          CustomSnackbar.infoSnackbar('Store is temporary closed');
        }
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              foregroundDecoration: store.isShopClose!
                  ? BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      backgroundBlendMode: BlendMode.saturation,
                    )
                  : null,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  store.shopImage!,
                  fit: BoxFit.fill,
                ),
              ),
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
                    MainLabelText(
                      text: store.name!,
                      isBold: true,
                    ),
                    SB.small(),
                    Row(
                      children: [
                        store.totalReviews == 0
                            ? const SizedBox()
                            : const Icon(
                                Icons.star,
                                size: 17,
                                color: ThemeConfig.primaryColor,
                              ),
                        LabelText(
                          text: store.totalReviews == 0
                              ? "${(store.distance! / 1000).toStringAsPrecision(1)} km Away"
                              : '${store.totalRatings} (${store.totalReviews})  ${(store.distance! / 1000).toStringAsPrecision(1)} km Away',
                          // isBold: true,
                        )
                      ],
                    ),
                    SB.small(),
                    // const LabelText(text: "Milk, Dahi, Chaas"),
                    DescriptionText(text: store.address!),
                    store.isShopClose!
                        ? const LabelText(text: 'Temporarily closed')
                        : const SizedBox()
                  ],
                )),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                userController.removeFavStore(store.id!);
              },
              child: const SizedBox(
                height: 100,
                // color: ThemeConfig.secondaryColor,
                child: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
