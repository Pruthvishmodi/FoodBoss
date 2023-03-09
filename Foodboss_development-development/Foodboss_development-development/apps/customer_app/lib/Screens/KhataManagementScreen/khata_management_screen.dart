import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/khata_controller.dart';
import 'package:customer_app/Models/my_khata_list.dart';
import 'package:customer_app/Widgets/Shadow_container.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/animated_linear_progress_indicator.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KhataManagementScreen extends StatelessWidget {
  KhataManagementScreen({Key? key}) : super(key: key);

  KhataController khataController = Get.put(
    KhataController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const MainLabelText(text: 'Khata Management'),
        backgroundColor: ThemeConfig.whiteColor,
        foregroundColor: ThemeConfig.mainTextColor,
        // centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: ThemeConfig.whiteColor,
        height: MediaQuery.of(context).size.height,
        padding: ThemeConfig.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SB.large(),
            const MainLabelText(text: 'Your khata details'),
            SB.large(),
            Expanded(
              child: Obx(
                () {
                  if (khataController.khataList.value.data == null) {
                    return const Center(
                      child: const CircularProgressIndicator(),
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async => khataController.fetchKhatas(),
                      child: khataController.khataList.value.data!.length == 0
                          ? const Center(
                              child: const DescriptionText(
                                  text:
                                      'Currently, you don\'t have active khata',
                                  alignment: TextAlign.center),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) => SB.medium(),
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount:
                                  khataController.khataList.value.data!.length,
                              itemBuilder: (context, index) {
                                Khata khata = khataController
                                    .khataList.value.data![index];
                                return GestureDetector(
                                  onTap: () {
                                    // Get.toNamed('/store-products-screen');
                                  },
                                  child: ShadowContainer(
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                flex: 4,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  // mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    MainLabelText(
                                                      text: khata.shopName!,
                                                      isBold: true,
                                                    ),
                                                    SB.small(),
                                                    DescriptionText(
                                                        text:
                                                            '+91 ${khata.phone}')
                                                  ],
                                                )),
                                            Expanded(
                                                child: GestureDetector(
                                              behavior:
                                                  HitTestBehavior.translucent,
                                              onTap: () {
                                                khataController
                                                    .fetchKhataDetails(
                                                        khata.khataId!);
                                                Get.toNamed(
                                                    '/khata-store-detail-screen',
                                                    arguments: [
                                                      khata.khataId!
                                                    ]);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: const LabelText(
                                                  text: 'Details',
                                                  isSecondary: true,
                                                ),
                                              ),
                                            )),
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              // alignment: Alignment.center,
                                              child: LabelText(
                                                  text:
                                                      'Used \u{20B9} ${khata.usedAmount!}'),
                                            ),
                                            Container(
                                              // alignment: Alignment.center,
                                              child: LabelText(
                                                  text:
                                                      'Remaining \u{20B9} ${double.parse(khata.totalAmount!) - double.parse(khata.usedAmount!)}'),
                                            ),
                                          ],
                                        ),
                                        SB.medium(),
                                        Row(
                                          children: [
                                            Expanded(
                                                child:
                                                    AnimatedLinearProgressIndicator(
                                              animatedDuration: const Duration(
                                                  milliseconds: 300),
                                              maxValue: double.parse(
                                                  khata.totalAmount!),
                                              currentValue: double.parse(
                                                  khata.usedAmount!),
                                              size: 30,
                                              backgroundColor:
                                                  ThemeConfig.greyColor,
                                              progressColor:
                                                  ThemeConfig.secondaryColor,
                                              // border: Border.all(
                                              //     width: 1, color: ThemeConfig.secondaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(5),

                                              // displayText: '',
                                              // displayTextStyle: const TextStyle(
                                              //   color: ThemeConfig.whiteColor,
                                              //   fontSize: ThemeConfig.descriptionSize,
                                              // ),
                                            ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
