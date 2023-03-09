import 'dart:ui';

import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Models/reviews_model.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Buttons/fav_button_widget.dart';
import 'package:customer_app/Widgets/Buttons/share_button_widget.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/animated_linear_progress_indicator.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:customer_app/utils/dylink_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreDetailScreen extends StatelessWidget {
  StoreDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    StoreProductController storeProductController =
        Get.find<StoreProductController>();
    var store = storeProductController.store.value;
    ScrollController scrollController = ScrollController();

    UserController userController = Get.find<UserController>();
    return Scaffold(
        backgroundColor: ThemeConfig.whiteColor,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.toNamed('/store-review-screen', arguments: [store.id]);
            },
            label: const Text('Add Review'),
            icon: const Icon(Icons.edit),
            backgroundColor: ThemeConfig.secondaryColor),
        body: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            child: NestedScrollView(
              headerSliverBuilder: ((context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    snap: false,
                    pinned: true,
                    forceElevated: innerBoxIsScrolled,

                    floating: false,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      title: Text(store.name!,
                          style: const TextStyle(
                              color: ThemeConfig.mainTextColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold) //TextStyle
                          ), //Text

                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: const Radius.circular(20),
                            bottomRight: const Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(store.shopImage!),
                              fit: BoxFit.cover,
                              opacity: 0.5),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.1, 0.9],
                            colors: [Colors.grey, Colors.transparent],
                          ),
                        ),
                      ),
                    ), //FlexibleSpaceBar
                    expandedHeight: 230,
                    backgroundColor: ThemeConfig.whiteColor,
                    // title: const Text("Maha Laxmi Store",
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 16.0,
                    //     ) //TextStyle
                    //     ),
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: ThemeConfig.mainTextColor,
                      ),
                      tooltip: 'Menu',
                      onPressed: () {
                        Get.back();
                      },
                    ), //IconButton
                    actions: <Widget>[
                      Obx(
                        () => FavButtonWidget(
                          isSelected:
                              storeProductController.store.value.isFavorite,
                          op: () {
                            storeProductController.store.value.isFavorite ==
                                    false
                                ? userController
                                    .addFavStore(
                                        storeProductController.store.value.id!)
                                    .then((value) {
                                    print(value);
                                    if (value) {
                                      storeProductController
                                          .store.value.isFavorite = true;
                                      storeProductController.store.refresh();
                                      CustomSnackbar.SucessSnackbar(
                                          'Store Added to Favorites');
                                    } else {
                                      storeProductController
                                          .store.value.isFavorite = false;
                                      CustomSnackbar.SucessSnackbar(
                                          'Store removed from Favorites');
                                      storeProductController.store.refresh();
                                    }
                                  })
                                : userController
                                    .removeFavStore(
                                        storeProductController.store.value.id!)
                                    .then((value) {
                                    if (value) {
                                      storeProductController
                                          .store.value.isFavorite = false;
                                      CustomSnackbar.SucessSnackbar(
                                          'Store removed from Favorites');

                                      storeProductController.store.refresh();
                                    } else {
                                      storeProductController
                                          .store.value.isFavorite = true;
                                      CustomSnackbar.SucessSnackbar(
                                          'Store Added to Favorites');
                                      storeProductController.store.refresh();
                                    }
                                  });
                          },
                        ),
                      ),
                      ShareButtonWidget(
                        op: () async {
                          var link = await DyLinkHelperClass()
                              .createDynamicStoreLink(
                                  storeProductController.store.value.id!,
                                  storeProductController.store.value.shopImage!,
                                  storeProductController.store.value.name!);
                          print(link);
                          Share.share(link);
                        },
                      ),
                    ], //<Widget>[]
                  ),
                ];
              }),
              body: RefreshIndicator(
                onRefresh: () async {
                  storeProductController.getStoreDetails();
                  storeProductController.checkKhataExsist(store.id!);
                },
                child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate([
                          // SizedBox(width: double.infinity,child: PrimaryButton(op: (){},text: 'Add Review',type: 'filled'),),
                          Obx(() {
                            if (storeProductController.store.value.ratings ==
                                    null ||
                                storeProductController
                                        .store.value.minimumOrderPrice ==
                                    null) {
                              return Shimmer.fromColors(
                                  child: Container(
                                    // height: 600,
                                    padding: ThemeConfig.screenPadding,
                                    child: Column(
                                      children: [
                                        const ShimmerContainer(
                                            width: double.infinity),
                                        const ShimmerContainer(
                                            width: double.infinity),
                                        const ShimmerContainer(
                                            width: double.infinity),
                                        const ShimmerContainer(
                                            width: double.infinity),
                                        const ShimmerContainer(
                                            width: double.infinity),
                                        SB.large(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            ShimmerContainer(),
                                            ShimmerContainer(
                                              width: 50,
                                            )
                                          ],
                                        ),
                                        SB.large(),
                                        ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: 4,
                                            itemBuilder: (context, index) =>
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: const [
                                                        ShimmerContainer(
                                                          width: 100,
                                                        ),
                                                        ShimmerContainer(
                                                          width: 50,
                                                        ),
                                                      ],
                                                    ),
                                                    const ShimmerContainer(
                                                      width: double.infinity,
                                                    ),
                                                    const ShimmerContainer(
                                                      width: 200,
                                                    ),
                                                  ],
                                                )),
                                      ],
                                    ),
                                  ),
                                  baseColor: Colors.grey[100]!,
                                  highlightColor: Colors.grey[50]!);
                            }
                            return Column(
                              children: const [
                                HeaderSection(),
                                RatingSection(),
                                ReviewSection(),
                              ],
                            );
                          }),
                          SB.large(),
                          SB.large(),
                        ]),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}

class ReviewSection extends StatelessWidget {
  const ReviewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreProductController storeProductController =
        Get.find<StoreProductController>();
    return Container(
      padding: ThemeConfig.screenPadding,
      child: Obx(
        () {
          if (storeProductController.store.value.ratings!.customers == null) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: const MainLabelText(text: 'No Reviews Yet'),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SB.large(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MainLabelText(text: 'Store Reviews'),
                    LabelText(
                        text:
                            '${storeProductController.store.value.ratings!.totalCount} Reviews')
                  ],
                ),
                SB.large(),
                ListView.separated(
                    shrinkWrap: true,
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: storeProductController
                        .store.value.ratings!.customers!.length,
                    separatorBuilder: (context, index) => Column(
                          children: [const Divider(), SB.medium()],
                        ),
                    itemBuilder: (context, index) {
                      return ReviewCartWidget(
                        review: storeProductController
                            .store.value.ratings!.customers![index],
                      );
                    })
              ],
            );
          }
        },
      ),
    );
  }
}

class ReviewCartWidget extends StatelessWidget {
  final Customers review;
  const ReviewCartWidget({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            width: 40,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: review.rating.toString() == "1"
                    ? Colors.red.shade300
                    : ThemeConfig.secondaryColorLite,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LabelText(
                  text: review.rating.toString(),
                ),
                // SizedBox(
                //   width: 3,
                // ),
                Icon(
                  Icons.star_rounded,
                  color: review.rating.toString() == "1"
                      ? Colors.black
                      : ThemeConfig.secondaryColor,
                  size: 15,
                ),
              ],
            ),
          ),
          SB.small(),
          LabelText(
            text: review.title!,
            isNormal: true,
          ),
          SB.small(),
          DescriptionText(
              text: review.name == "" ? 'Username' : review.name.toString()),
          SB.medium(),
        ],
      ),
    );
  }
}

class RatingSection extends StatelessWidget {
  const RatingSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreProductController storeProductController =
        Get.find<StoreProductController>();
    // var ratings = storeProductController.store.value.ratings;
    return Card(
      child: Wrap(
        children: [
          Container(
            padding: ThemeConfig.screenPadding,
            child: Obx(
              () => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          LabelText(
                              text: storeProductController
                                  .store.value.ratings!.avarege!
                                  .toString()),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(
                            Icons.star_rounded,
                            color: ThemeConfig.primaryColor,
                            size: 20,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // LabelText(text: 'Ratings '),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // DescriptionText(
                          //   text: '1234',
                          //   color: ThemeConfig.mainTextColor,
                          // ),
                          const SizedBox(
                            width: 5,
                          ),
                          const LabelText(text: 'Reviews '),
                          const SizedBox(
                            width: 5,
                          ),
                          DescriptionText(
                            text: storeProductController
                                .store.value.ratings!.totalCount
                                .toString(),
                            color: ThemeConfig.mainTextColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  SB.medium(),
                  RatingRow(
                      number: 5,
                      value: storeProductController.store.value.ratings!.i5!,
                      numberOfReviews:
                          storeProductController.store.value.ratings!.i5!,
                      maxValue: storeProductController
                          .store.value.ratings!.totalCount!),
                  RatingRow(
                      number: 4,
                      value: storeProductController.store.value.ratings!.i4!,
                      numberOfReviews:
                          storeProductController.store.value.ratings!.i4!,
                      maxValue: storeProductController
                          .store.value.ratings!.totalCount!),
                  RatingRow(
                      number: 3,
                      value: storeProductController.store.value.ratings!.i3!,
                      numberOfReviews:
                          storeProductController.store.value.ratings!.i3!,
                      maxValue: storeProductController
                          .store.value.ratings!.totalCount!),
                  RatingRow(
                    number: 2,
                    value: storeProductController.store.value.ratings!.i2!,
                    numberOfReviews:
                        storeProductController.store.value.ratings!.i2!,
                    color: Colors.yellow,
                    maxValue:
                        storeProductController.store.value.ratings!.totalCount!,
                  ),
                  RatingRow(
                    number: 1,
                    value: storeProductController.store.value.ratings!.i1!,
                    numberOfReviews:
                        storeProductController.store.value.ratings!.i1!,
                    color: Colors.red,
                    maxValue:
                        storeProductController.store.value.ratings!.totalCount!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RatingRow extends StatelessWidget {
  final int number;
  final int value;
  final int maxValue;
  final int numberOfReviews;
  final Color? color;
  const RatingRow({
    Key? key,
    required this.number,
    required this.value,
    required this.numberOfReviews,
    this.color,
    required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(width: 10, child: LabelText(text: number.toString())),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.star_rounded,
            color: ThemeConfig.primaryColor,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: AnimatedLinearProgressIndicator(
            animatedDuration: const Duration(milliseconds: 800),
            progressColor: color ?? ThemeConfig.secondaryColor,
            border: Border.all(width: 0.5, color: ThemeConfig.greyColor),
            currentValue: double.parse(value.toString()),
            maxValue: double.parse(maxValue.toString()),
            borderRadius: BorderRadius.circular(25),
            size: 20,
          )),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 30,
            child: DescriptionText(
              text: numberOfReviews.toString(),
              color: ThemeConfig.mainTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreProductController storeProductController =
        Get.find<StoreProductController>();
    return Card(
      child: Obx(
        () {
          var store = storeProductController.store.value;
          print(store.toJson().toString());
          return Container(
            padding: ThemeConfig.screenPadding,
            child: Container(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      launchUrl(Uri.parse('tel:${store.phoneNumber}'));
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.call),
                        const SizedBox(
                          width: 5,
                        ),
                        DescriptionText(
                          text: '+91 ${store.phoneNumber}',
                          color: ThemeConfig.mainTextColor,
                        ),
                      ],
                    ),
                  ),
                  SB.small(),
                  Row(
                    children: [
                      const Icon(Icons.location_pin),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: DescriptionText(
                          text: store.address ?? '',
                          // color: ThemeConfig.mainTextColor,
                        ),
                      ),
                    ],
                  ),
                  SB.small(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const LabelText(text: 'Distance '),
                      const SizedBox(
                        width: 5,
                      ),
                      DescriptionText(
                        text: store.distance == null
                            ? '0'
                            : '${(store.distance! / 1000).toStringAsFixed(1)} km away',
                        color: ThemeConfig.mainTextColor,
                      ),
                    ],
                  ),
                  SB.small(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const LabelText(text: 'Minimum Order value '),
                      const SizedBox(
                        width: 5,
                      ),
                      DescriptionText(
                        text: '\u{20B9} ${store.minimumOrderPrice ?? 0}',
                        color: ThemeConfig.mainTextColor,
                      ),
                    ],
                  ),
                  SB.small(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const LabelText(text: 'Delivery charge '),
                      const SizedBox(
                        width: 5,
                      ),
                      DescriptionText(
                        text: store.deliveryCharge == null ||
                                store.deliveryCharge == 0
                            ? 'free'
                            : store.deliveryCharge!.toString(),
                        color: ThemeConfig.mainTextColor,
                      ),
                    ],
                  ),
                  SB.medium(),
                  storeProductController.store.value.khataAvailable!
                      ? Container()
                      : SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              // Expanded(child: DistructiveButton(text: 'Go Shopping',op: (){},type: 'filled',height: 40,)),
                              // const SizedBox(width: 5,),
                              Expanded(
                                  child: PrimaryButton(
                                      text: 'Request Khata',
                                      op: () {
                                        storeProductController
                                            .addKhataRequest(store.id!);
                                      },
                                      type: 'filled')),
                            ],
                          ),
                        ),

                  // Container(
                  //   width: double.infinity,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       const DescriptionText(
                  //         text: '2.5 ',
                  //         color: ThemeConfig.mainTextColor,
                  //       ),
                  //       StarRatingWidget(
                  //         value: 2.5,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
