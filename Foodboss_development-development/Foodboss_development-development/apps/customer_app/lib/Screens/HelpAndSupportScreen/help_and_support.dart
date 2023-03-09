import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Widgets/Shadow_container.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/heading_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/title_text.dart';
import 'package:customer_app/Widgets/components/appbar_widget.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Uri emailLaunchUri = ;
    UserController userController = Get.find<UserController>();

    return Scaffold(
      backgroundColor: ThemeConfig.whiteColor,
      appBar: customAppBar('Help and Support'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // color: ThemeConfig.greyColor,
              decoration: const BoxDecoration(
                  // color: ThemeConfig.greyColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.toNamed('/faqs');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.support_agent,
                            size: 40,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MainLabelText(
                                  text: 'Help And Support',
                                  isBold: true,
                                ),
                                SB.small(),
                                Row(
                                  children: const [
                                    DescriptionText(text: 'Do check our '),
                                    LabelText(
                                      text: 'FAQs ',
                                      isSecondary: true,
                                    ),
                                    DescriptionText(text: 'Section once '),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        await launchUrl(Uri.parse("mailto:Customercare@foodboss.in"));
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.mail_outline,
                            size: 40,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MainLabelText(
                                  text: 'Email',
                                  isBold: true,
                                ),
                                SB.small(),
                                const LabelText(
                                    text: 'Customercare@foodboss.in',
                                    isSecondary: true,
                                  ),
                                SB.small(),
                                Container(
                                  constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              .7),
                                  child: const DescriptionText(
                                      text:
                                          'You can email us at the above mentioned email-id, we will revert within 2-3 business day.'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.toNamed('/report');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.report_gmailerrorred,
                            size: 40,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MainLabelText(
                                  text: 'Report A Problem',
                                  isBold: true,
                                ),
                                SB.small(),
                                const LabelText(
                                  text: 'Click here',
                                  isSecondary: true,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(),

                  // TitleText(text: "Help and Support"),
                  // // SizedBox(
                  // //   height: 20,
                  // // ),
                  // // MainLabelText(
                  // //   text: '10 stores near your location',
                  // //   isBold: true,
                  // // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.toNamed('/faqs');
                  //   },
                  //   behavior: HitTestBehavior.translucent,
                  //   child: ShadowContainer(
                  //       child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       LabelText(text: 'FAQs'),
                  //       Icon(
                  //         Icons.arrow_forward_ios,
                  //         size: 15,
                  //       )
                  //     ],
                  //   )),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   behavior: HitTestBehavior.translucent,
                  //   child: ShadowContainer(
                  //       child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       LabelText(text: 'Contact Us(Email)'),
                  //       Icon(
                  //         Icons.arrow_forward_ios,
                  //         size: 15,
                  //       )
                  //     ],
                  //   )),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   behavior: HitTestBehavior.translucent,
                  //   child: ShadowContainer(
                  //       child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       LabelText(text: 'Reprot A Problem'),
                  //       Icon(
                  //         Icons.arrow_forward_ios,
                  //         size: 15,
                  //       )
                  //     ],
                  //   )),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
