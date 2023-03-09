import 'dart:ui';

import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/khata_controller.dart';
import 'package:customer_app/Models/my_khata_list.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Buttons/fav_button_widget.dart';
import 'package:customer_app/Widgets/Buttons/share_button_widget.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/animated_linear_progress_indicator.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KhataStoreDetailScreen extends StatelessWidget {
  KhataStoreDetailScreen({Key? key}) : super(key: key);

  var args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    KhataController khataController = Get.put(KhataController());
    var id = args[0];
    Size size = MediaQuery.of(context).size;
    ScrollController scrollController = ScrollController();
    return Scaffold(
        backgroundColor: ThemeConfig.whiteColor,
        body: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            child: Obx(
              () {
                if (khataController.khataList.value.data!
                        .firstWhere((element) => element.khataId == id)
                        .paymentHistory ==
                    null) {
                  return const Center(
                    child: const CircularProgressIndicator(),
                  );
                } else {
                  Khata khata = khataController.khataList.value.data!
                      .firstWhere((element) => element.khataId == id);
                  return NestedScrollView(
                    headerSliverBuilder: ((context, innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          snap: false,
                          pinned: true,
                          forceElevated: innerBoxIsScrolled,

                          floating: false,
                          flexibleSpace: FlexibleSpaceBar(
                            centerTitle: false,
                            title: Text(khata.shopName!,
                                style: const TextStyle(
                                    color: ThemeConfig.mainTextColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold) //TextStyle
                                ), //Text

                            background: Container(
                              decoration:  BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(khata.shopImage!),
                                    fit: BoxFit.cover,
                                    opacity: 0.5),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: [0.1, 0.9],
                                  colors: [Colors.grey, Colors.transparent],
                                ),
                              ),
                            ),
                          ), //FlexibleSpaceBar
                          expandedHeight: 200,
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
                        ),
                      ];
                    }),
                    body: CustomScrollView(
                        physics: const BouncingScrollPhysics(),
                        slivers: [
                          SliverList(
                            delegate: SliverChildListDelegate([
                              HeaderSection(
                                khata: khata,
                              ),
                              // SizedBox(width: double.infinity,child: PrimaryButton(op: (){},text: 'Add Review',type: 'filled'),),
                              ReviewSection(
                                khata: khata,
                              ),
                              SB.large(),
                              SB.large(),
                            ]),
                          ),
                        ]),
                  );
                }
              },
            ),
          ),
        ));
  }
}

class ReviewSection extends StatelessWidget {
  final Khata khata;
  const ReviewSection({
    Key? key,
    required this.khata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ThemeConfig.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainLabelText(text: 'Previous Payments', isBold: true),
          SB.medium(),
          khata.paymentHistory!.length == 0
              ? Container(
                padding: const EdgeInsets.only(top: 150),
                alignment: Alignment.center,
                  child: const DescriptionText(text: 'No Previous Payments'),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: khata.paymentHistory!.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    var khataa = khata.paymentHistory!.reversed.toList();
                    return ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: ThemeConfig.secondaryColorLite,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.currency_rupee,
                          color: ThemeConfig.secondaryColor,
                        ),
                      ),
                      title: MainLabelText(
                        text: khataa[index].updatedAt!
                            .split(' ')[0],
                      ),
                      trailing: DescriptionText(
                          text:
                              '\u{20B9} ${khataa[index].amount}'),
                    );
                  })
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final Khata khata;
  const HeaderSection({
    Key? key,
    required this.khata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: ThemeConfig.screenPadding,
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.call),
                  const SizedBox(
                    width: 5,
                  ),
                  DescriptionText(
                    text: '+91 ${khata.phone}',
                    color: ThemeConfig.mainTextColor,
                  ),
                ],
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
                      text: khata.address!,
                      // color: ThemeConfig.mainTextColor,
                    ),
                  ),
                ],
              ),
              SB.large(),
              const MainLabelText(text: 'Khata Details', isBold: true),
              SB.medium(),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const LabelText(text: 'Total Khata limit '),
                  const SizedBox(
                    width: 5,
                  ),
                  DescriptionText(
                    text: '\u{20B9} ${khata.totalAmount}',
                    color: ThemeConfig.mainTextColor,
                  ),
                ],
              ),
              SB.medium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const LabelText(text: 'Used Amount'),
                      const SizedBox(
                        width: 5,
                      ),
                      DescriptionText(
                        text: '${khata.usedAmount}',
                        color: ThemeConfig.mainTextColor,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const LabelText(text: 'Remaining Amount'),
                      const SizedBox(
                        width: 5,
                      ),
                      DescriptionText(
                        text:
                            '${double.parse(khata.totalAmount!) - double.parse(khata.usedAmount!)}',
                        color: ThemeConfig.mainTextColor,
                      ),
                    ],
                  ),
                ],
              ),
              SB.medium(),
              Row(
                children: [
                  Expanded(
                      child: AnimatedLinearProgressIndicator(
                    animatedDuration: const Duration(milliseconds: 300),
                    maxValue: double.parse(khata.totalAmount!),
                    currentValue: double.parse(khata.usedAmount!),
                    size: 30,
                    backgroundColor: ThemeConfig.greyColor,
                    progressColor: ThemeConfig.secondaryColor,
                    // border: Border.all(
                    //     width: 1, color: ThemeConfig.secondaryColor),
                    borderRadius: BorderRadius.circular(5),

                    // displayText: '',
                    // displayTextStyle: const TextStyle(
                    //   color: ThemeConfig.whiteColor,
                    //   fontSize: ThemeConfig.descriptionSize,
                    // ),
                  ))
                ],
              ),
              SB.small(),
              // SizedBox(width: double.infinity,child: PrimaryButton(text: 'Request Khata',op: (){},type: 'filled'),),

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
      ),
    );
  }
}
