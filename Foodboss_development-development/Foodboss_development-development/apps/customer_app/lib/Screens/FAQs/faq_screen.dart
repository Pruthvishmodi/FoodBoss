import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/faq_controller.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/utils/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class FaqScreen extends StatelessWidget {
  FaqController controller = Get.put(FaqController(), permanent: false);
  FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // FaqController controller = Get.put(FaqController(), permanent: false);

    return Scaffold(
        backgroundColor: ThemeConfig.whiteColor,
        appBar: AppBar(
          backgroundColor: ThemeConfig.whiteColor,
          title: const MainLabelText(
            text: 'FAQs',
            isBold: true,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          // backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: const SafeArea(child: FaqCategory()));
  }
}

class ExpansionCard extends StatelessWidget {
  final String title;
  final String text;
  const ExpansionCard({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeConfig.whiteColor,
      elevation: 0,
      child: ListTileTheme(
        contentPadding: const EdgeInsets.all(0),
        dense: true,
        horizontalTitleGap: 0.0,
        minLeadingWidth: 0,
        child: ExpansionTile(
          collapsedIconColor: ThemeConfig.mainTextColor,
          iconColor: ThemeConfig.mainTextColor,
          tilePadding: const EdgeInsets.all(5),
          childrenPadding: const EdgeInsets.all(5),
          title: Html(
            data: title.toString(),
            style: {
              "*": Style(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  fontWeight: FontWeight.w600),
              "div": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
              "br": Style(
                  display: Display.NONE,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  height: 0),
            },
          ),
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, right: 15, bottom: 15),
                  child: Html(
                    data: text.toString(),
                    style: {
                      "p": Style(
                          margin: EdgeInsets.zero, padding: EdgeInsets.zero),
                      "*": Style(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          fontSize: const FontSize(12)),
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class FaqCategory extends StatelessWidget {
  const FaqCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FaqController controller = Get.put(FaqController(), permanent: false);
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 550),
          padding: EdgeInsets.all(size.width * 0.05),
          height: size.height,
          width: size.width,
          child: RefreshIndicator(
            onRefresh: () => controller.faq(),
            child: Obx(
              () {
                if (controller.status == States.SUCCESS_STATE) {
                  var faq = controller.data.data!;
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      itemCount: faq.length,
                      itemBuilder: (BuildContext context, index) =>
                          ExpansionCard(
                              title: faq[index].question!,
                              text: faq[index].answer!));
                } else if (controller.status == States.ERROR_STATE) {
                  return const Text('Missing Faqs');
                } else {
                  return SizedBox(
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
                                // ShimmerContainer(height: 20),
                                // ShimmerContainer(height: 20),
                                ShimmerContainer(
                                  height: 150,
                                  width: size.width,
                                ),
                                // ShimmerContainer(height: 20),
                                ShimmerContainer(
                                  height: 100,
                                  width: size.width,
                                ),
                                ShimmerContainer(
                                  height: 80,
                                  width: size.width,
                                ),
                                ShimmerContainer(
                                  height: 100,
                                  width: size.width,
                                ),
                                ShimmerContainer(
                                  height: 90,
                                  width: size.width,
                                ),
                                ShimmerContainer(
                                  height: 140,
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
        ),
      ),
    );
  }
}
