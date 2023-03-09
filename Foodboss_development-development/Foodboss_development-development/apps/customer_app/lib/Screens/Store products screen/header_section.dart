import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/title_text.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreProductController storeProductController =
        Get.find<StoreProductController>();
    var store = storeProductController.store.value;
    // print(store.toJson().toString());
    return Card(
      child: Container(
        padding: ThemeConfig.screenPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Container(
                // padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TitleText(
                              text: store.name!,
                              isDotDor: true,
                              maxlines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            launchUrl(Uri.parse('tel:${store.phoneNumber}'));
                          },
                          child: DescriptionText(
                            text: '+91 ${store.phoneNumber}',
                            color: ThemeConfig.mainTextColor,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        DescriptionText(
                          text:
                              '(${(store.distance! / 1000).toStringAsFixed(1)} km)',
                          color: ThemeConfig.mainTextColor,
                        ),
                      ],
                    ),
                    SB.small(),
                    DescriptionText(
                      text: store.address!,
                    ),
                    SB.small(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(ThemeConfig.radiusMin)),
                    child: Container(
                      width: 65,
                      height: 70,
                      decoration: BoxDecoration(
                        color: ThemeConfig.secondaryColor,
                        borderRadius: BorderRadius.circular(
                          ThemeConfig.radiusMin,
                        ),
                      ),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Get.toNamed('/review-screen', arguments: [store.id]);
                        },
                        child: store.totalRatings == null
                            ? Container(
                                alignment: Alignment.center,
                                height: 35,
                                width: double.infinity,
                                child: const LabelText(
                                  text: 'Add review',
                                  isWhite: true,
                                  alignment: TextAlign.center,
                                ),
                              )
                            : Column(
                                children: [
                                  Container(
                                    height: 35,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          store.totalRatings.toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: ThemeConfig.whiteColor),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        const Icon(
                                          Icons.star_rounded,
                                          color: ThemeConfig.whiteColor,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      height: 35,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: ThemeConfig.whiteColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              ThemeConfig.radiusMin),
                                          bottomRight: Radius.circular(
                                              ThemeConfig.radiusMin),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            store.totalReviews! > 1000
                                                ? '${store.totalReviews} K'
                                                : store.totalReviews.toString(),
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    ThemeConfig.mainTextColor),
                                          ),
                                          // SB.small(),
                                          const Text('Reviews',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  color: ThemeConfig
                                                      .mainTextColor)),
                                        ],
                                      )),
                                ],
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                          text: 'Details',
                          op: () {
                            storeProductController.getStoreDetails();
                            Get.toNamed('/store-detail-screen', arguments: []);
                          },
                          type: 'filled'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
