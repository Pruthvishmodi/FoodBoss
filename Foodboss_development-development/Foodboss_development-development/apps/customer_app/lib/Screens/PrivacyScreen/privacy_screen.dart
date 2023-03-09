import 'package:customer_app/Config/ThemeConfig.dart';

import 'package:customer_app/Controller/faq_controller.dart';
import 'package:customer_app/Controller/privacy_controller.dart';

import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/utils/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PrivacyController controller =
        Get.put(PrivacyController(), permanent: false);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: ThemeConfig.whiteColor,
        appBar: AppBar(
          backgroundColor: ThemeConfig.whiteColor,
          title: const MainLabelText(
            text: 'Privacy Policy',
            isBold: true,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          // backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Obx(
              () {
                if (controller.status == States.SUCCESS_STATE) {
                  var privacy = controller.data.data!;
                  return Html(
                    data: controller.data.data!.privacyText,
                    style: {
                      "*": Style(
                        fontSize: FontSize(
                            (ThemeConfig.descriptionSize / 720.00) *
                                        size.height >
                                    ThemeConfig.descriptionSize
                                ? (ThemeConfig.descriptionSize / 720.00) *
                                    size.height
                                : ThemeConfig.descriptionSize),
                        color: ThemeConfig.mainTextColor,
                      ),
                      "a": Style(
                        color: Colors.red,
                      ),
                      "div": Style(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          fontSize:
                              const FontSize(ThemeConfig.descriptionSize)),
                    },
                  );
                } else {
                  return Container(
                    height: size.height,
                    child: Shimmer.fromColors(
                      enabled: true,
                      baseColor: Colors.grey[200]!,
                      highlightColor: Colors.grey[50]!,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: ThemeConfig.screenPadding,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShimmerContainer(height: 20),
                                ShimmerContainer(height: 20),
                                ShimmerContainer(
                                  height: 300,
                                  width: size.width,
                                ),
                                ShimmerContainer(height: 20),
                                ShimmerContainer(
                                  height: 300,
                                  width: size.width,
                                ),

                                // ShimmerContainer(
                                //   width: double.infinity,
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        )));
  }
}
