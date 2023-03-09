import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/khata_controller.dart';
import 'package:seller_app/utils/states.dart';

import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/customer%20details%20card/customer_details_card.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';

class KhataManagement extends StatelessWidget {
  KhataManagement({Key? key}) : super(key: key);

  KhataController khataController = Get.put(KhataController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async => khataController.getMyUsersKhata(),
                child: SingleChildScrollView(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 550),
                    width: size.width,
                    padding: const EdgeInsets.all(20),
                    child: Obx(
                      () {
                        if (khataController.myKhatas.value.khatas == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Container(
                            height: size.height,
                            width: double.infinity,
                            child: Column(
                              children: [
                                MainLabelText(
                                    titleString:
                                        "Total Pending - Rs. ${khataController.totalPendingAmount().toString()}"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: khataController
                                          .myKhatas.value.khatas!.length,
                                      itemBuilder: (context, index) {
                                        return CustomerCard(
                                          khata: khataController
                                              .myKhatas.value.khatas![index],
                                          index: index,
                                        );
                                      }),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      // KhataController.  ;
                      Get.toNamed("/khata-management/request");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ThemeConfig.FORM_COLOR),
                      height: 50,
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: ThemeConfig.DISTRUCTIVE_COLOR),
                              width: 50,
                              height: 50,
                              // color: ThemeConfig.DISTRUCTIVE_COLOR,
                              child: const Icon(
                                Icons.notification_important,
                                color: ThemeConfig.MAIN_TEXT_COLOR,
                              ),
                            ),
                          ),
                          Obx(
                            () => Expanded(
                                flex: 1,
                                child: Center(
                                    child: LabelText(
                                        titleString: khataController
                                                    .data.data ==
                                                null
                                            ? '0'
                                            : '${khataController.data.data!.length}'))),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
      //   onPressed: () {
      //     Get.toNamed("/khata-management/request");
      //   },
      //   child: const Icon(
      //     Icons.notification_important,
      //     color: ThemeConfig.MAIN_TEXT_COLOR,
      //   ),
      // ),
    );
  }
}
