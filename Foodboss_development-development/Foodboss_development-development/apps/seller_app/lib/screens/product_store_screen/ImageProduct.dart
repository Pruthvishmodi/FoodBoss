import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/my_store/store_details_controller.dart';
import 'package:seller_app/screens/product_store_screen/product_store_screen.dart';
import 'package:seller_app/widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class ImageProduct extends StatelessWidget {
  const ImageProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreDetailsController controller = Get.find<StoreDetailsController>();
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: size.width - ((size.width - 20) / 3) - 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ThemeConfig.FORM_COLOR,
                      borderRadius:
                          BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                    ),
                    child: Obx(
                      () => controller.data.value.data != null
                          ? controller.data.value.data!.hasMedia != false
                              ? Image(
                                  // height:
                                  //     size.width - ((size.width - 20) / 3) - 20,
                                  fit: BoxFit.contain,
                                  image: NetworkImage(controller
                                      .data.value.data!.media!.first.url!),
                                )
                              : SizedBox(width: 0)
                          : SizedBox(width: 0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Obx(
                        () => controller.data.value.data != null
                            ? controller.data.value.data!.hasMedia == true
                                ? controller.data.value.data!.images != null
                                    ? controller.data.value.data!.images!
                                                .length >
                                            0
                                        ? Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    PageRouteBuilder(
                                                        pageBuilder:
                                                            (context, _, __) {
                                                  return GestureDetector(
                                                    onTap: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    child: Container(
                                                      width: size.width,
                                                      height: size.height,
                                                      color: Colors.black
                                                          .withOpacity(0.9),
                                                      child: Center(
                                                        child: CarouselSlider(
                                                          items:
                                                              controller
                                                                      .data
                                                                      .value
                                                                      .data!
                                                                      .hasMedia!
                                                                  ? controller
                                                                      .data
                                                                      .value
                                                                      .data!
                                                                      .images!
                                                                      .map(
                                                                        (e) =>
                                                                            Container(
                                                                          margin:
                                                                              const EdgeInsets.all(6.0),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                ThemeConfig.WHITE_COLOR,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            image:
                                                                                DecorationImage(
                                                                              image: NetworkImage(e.url!),
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )
                                                                      .toList()
                                                                  : [
                                                                      Container(
                                                                        margin:
                                                                            const EdgeInsets.all(6.0),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          image:
                                                                              const DecorationImage(
                                                                            image:
                                                                                NetworkImage(ThemeConfig.NOIMAGELINK),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                          options:
                                                              CarouselOptions(
                                                            height: 400.0,
                                                            enlargeCenterPage:
                                                                true,
                                                            autoPlay: false,
                                                            aspectRatio: 16 / 9,
                                                            viewportFraction:
                                                                0.8,
                                                          ),
                                                        ),
                                                        // child: Image(image: AssetImage('assets/images/shopImage0.jpg'),fit: BoxFit.cover,),
                                                      ),
                                                    ),
                                                  );
                                                }));
                                              },
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius
                                                        .circular(ThemeConfig
                                                            .BORDERRADIUS_MIN),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: ThemeConfig
                                                            .FORM_COLOR,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          ThemeConfig
                                                              .BORDERRADIUS_MIN,
                                                        ),
                                                      ),
                                                      child: Image(
                                                        // height:
                                                        //     size.width - ((size.width - 20) / 3) - 20,
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            controller
                                                                .data
                                                                .value
                                                                .data!
                                                                .images![0]
                                                                .url!),
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: MainLabelText(
                                                      titleString:
                                                          '${controller.data.value.data!.images!.length} +',
                                                      isWhite: true,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : SizedBox(height: 0)
                                    : SizedBox(height: 0)
                                : SizedBox(height: 0)
                            : SizedBox(height: 0),
                      ),
                      Obx(
                        () => controller.data.value.data != null
                            ? controller.data.value.data!.hasMedia != false
                                ? controller.data.value.data!.images != null
                                    ? controller.data.value.data!.images!
                                                .length >
                                            0
                                        ? SizedBox(
                                            height: 5,
                                          )
                                        : SizedBox(height: 0)
                                    : SizedBox(height: 0)
                                : SizedBox(height: 0)
                            : SizedBox(height: 0),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            addPhotoBottomSheet(
                                size,
                                controller.data.value.data != null
                                    ? controller.data.value.data!.id.toString()
                                    : '');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ThemeConfig.FORM_COLOR,
                              borderRadius: BorderRadius.circular(
                                ThemeConfig.BORDERRADIUS_MIN,
                              ),
                            ),
                            child: Icon(
                              Icons.add_a_photo_outlined,
                              color: ThemeConfig.MAIN_TEXT_COLOR,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
