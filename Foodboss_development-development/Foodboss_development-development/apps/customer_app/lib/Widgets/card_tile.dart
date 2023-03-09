import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/small_text.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardTile extends StatelessWidget {
  final String name;
  final double? width;
  final String? imageUrl;
  final double price;
  final bool isFavourite;
  final VoidCallback changeType;
  CardTile({
    Key? key,
    required this.name,
    required this.price,
    required this.isFavourite,
    required this.changeType,
    this.width,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        GestureDetector(
          onTap: changeType,
          child: Container(
            // height: 100,
            width: width,
            margin: EdgeInsets.all(2),
            constraints: const BoxConstraints(maxWidth: 300),
            // padding: const EdgeInsets.only(left: 6,right: ),
            decoration: BoxDecoration(
              color: ThemeConfig.whiteColor,
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   BoxShadow(
              //     color: ThemeConfig.mainTextColor,
              //     spreadRadius: 1,
              //     blurRadius: 15,
              //     offset: const Offset(3, 3),
              //   ),
              // ],
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: ThemeConfig.whiteColor,
                      border:
                          Border.all(width: 1.2, color: ThemeConfig.greyColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          color: ThemeConfig.whiteColor,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl ??
                                "https://aeroclub-issoire.fr/wp-content/uploads/2020/05/image-not-found-300x225.jpg",

                            progressIndicatorBuilder:
                                (BuildContext context, child, loadingProgress) {
                              return Center(
                                  child: Shimmer.fromColors(
                                child: const ShimmerContainerSquare(size: 150),
                                baseColor: Colors.grey[100]!,
                                highlightColor: Colors.grey[50]!,
                                enabled: true,
                              ));
                            },
                            // fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                SB.small(),
                Container(
                    height: 30,
                    child: SmallText(
                      text: name,
                      alignment: TextAlign.center,
                    )),
                // SB.medium(),

                // SizedBox(height: 5÷,),
                // DescriptionText(text: 'sdfsd')
              ],
            ),
          ),
        ),
        // Positioned(
        //   bottom: 10,
        //   right: 0,
        //   child: Padding(
        //     padding: const EdgeInsets.only(right: 2),
        //     child: InkWell(
        //         onTap: changeType,
        //         child: Icon(
        //           isFavourite ? Icons.favorite : Icons.favorite_border_outlined,
        //           color: ThemeConfig.primaryColor,
        //         )),
        //   ),
        // ),
      ],
    );
  }
}
