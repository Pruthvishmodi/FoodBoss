import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_app/Controller/Business%20Controllers/category_page_controller.dart';
import 'package:customer_app/Models/network_call_models.dart/banner_call.dart'
    as bw;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../shimmers/custom_shimmers.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    Key? key,
    required this.banner,
  }) : super(key: key);

  final bw.Banner banner;

  @override
  Widget build(BuildContext context) {
    CategoryPageController categoryPageController =
        Get.find<CategoryPageController>();
    return CarouselSlider(
      options: banner.aspectRatio == "1:1"
          ? CarouselOptions(
              height: 100,

              autoPlay: banner.auto!,
              // aspectRatio: 3 / 2,
              // aspectRatio: int.parse(banner
              //         .aspectRatio!
              //         .split(':')[0]) /
              //     int.parse(banner.aspectRatio!
              //         .split(':')[1]),
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              viewportFraction: .25,

              // aspectRatio: 2.0,

              onPageChanged: (index, reason) {
                // setState(() {
                //   _currentIndex = index;
                // });
              },
            )
          : banner.aspectRatio == "3:2"
              ? CarouselOptions(
                  height: 135,

                  autoPlay: true,
                  // aspectRatio: 3 / 2,
                  // aspectRatio: int.parse(banner
                  //         .aspectRatio!
                  //         .split(':')[0]) /
                  //     int.parse(banner.aspectRatio!
                  //         .split(':')[1]),
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  viewportFraction: .5,

                  // aspectRatio: 2.0,

                  onPageChanged: (index, reason) {
                    // setState(() {
                    //   _currentIndex = index;
                    // });
                  },
                )
              : banner.aspectRatio == "4:3"
                  ? CarouselOptions(
                      height: 120,

                      autoPlay: true,
                      // aspectRatio: 3 / 2,
                      // aspectRatio: int.parse(banner
                      //         .aspectRatio!
                      //         .split(':')[0]) /
                      //     int.parse(banner.aspectRatio!
                      //         .split(':')[1]),
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 500),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      viewportFraction: .40,

                      // aspectRatio: 2.0,

                      onPageChanged: (index, reason) {
                        // setState(() {
                        //   _currentIndex = index;
                        // });
                      },
                    )
                  : banner.aspectRatio == "3:4"
                      ? CarouselOptions(
                          height: 175,

                          autoPlay: true,
                          // aspectRatio: 3 / 2,
                          // aspectRatio: int.parse(banner
                          //         .aspectRatio!
                          //         .split(':')[0]) /
                          //     int.parse(banner.aspectRatio!
                          //         .split(':')[1]),
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 500),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pauseAutoPlayOnTouch: true,
                          viewportFraction: .33,

                          // aspectRatio: 2.0,

                          onPageChanged: (index, reason) {
                            // setState(() {
                            //   _currentIndex = index;
                            // });
                          },
                        )
                      : CarouselOptions(
                          height: 200,

                          autoPlay: true,
                          // aspectRatio: 3 / 2,
                          // aspectRatio: int.parse(banner
                          //         .aspectRatio!
                          //         .split(':')[0]) /
                          //     int.parse(banner.aspectRatio!
                          //         .split(':')[1]),
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 500),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pauseAutoPlayOnTouch: true,
                          viewportFraction: 1,

                          // aspectRatio: 2.0,

                          onPageChanged: (index, reason) {
                            // setState(() {
                            //   _currentIndex = index;
                            // });
                          },
                        ),
      items: banner.urls!
          .map(
            (e) =>
                //  Container(
                //   margin: const EdgeInsets.symmetric(horizontal: 3),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     image: DecorationImage(
                //         fit: BoxFit.fill, image: NetworkImage(e.img!)),
                //   ),
                // ),
                GestureDetector(
              onTap: () {
                print(e.link);
                categoryPageController.getShopListByCategory(e.link!);

                Get.toNamed('/shop-list', arguments: [e.link!]);
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width,
                    imageUrl: e.img!, fit: BoxFit.fitWidth,
                    errorWidget: (context, url, dm) => const Image(
                      image: AssetImage(
                        "assets/images/notfound.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                    // "https://aeroclub-issoire.fr/wp-content/uploads/2020/05/image-not-found-300x225.jpg",

                    progressIndicatorBuilder:
                        (BuildContext context, child, loadingProgress) {
                      return Center(
                          child: Shimmer.fromColors(
                        child:
                            const ShimmerContainerSquare(size: double.infinity),
                        baseColor: Colors.grey[100]!,
                        highlightColor: Colors.grey[50]!,
                        enabled: true,
                      ));
                    },
                    // fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // ClipRRect(
            //   child: Image.network(e.img!),
            //   borderRadius: const BorderRadius.only(
            //       bottomLeft: Radius.circular(10),
            //       bottomRight: Radius.circular(10),
            //       topLeft: Radius.circular(10),
            //       topRight: Radius.circular(10)),
            // )
          )
          .toList(),
    );
  }
}
