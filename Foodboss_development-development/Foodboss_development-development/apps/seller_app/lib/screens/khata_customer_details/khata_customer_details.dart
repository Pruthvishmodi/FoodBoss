import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/khata_controller.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/animate_linear_indicator.dart';

import 'package:shared_widgets/Config/theme_config.dart';

import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:url_launcher/url_launcher.dart';

class KhataCustomerDetails extends StatelessWidget {
  // final String name;
  // final String address;
  // final double phoneNumber;

  const KhataCustomerDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KhataController khataController = Get.find<KhataController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        elevation: 0,
        title: const Text(
          "Khata User",
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(
      //     Icons.edit,
      //     color: ThemeConfig.WHITE_COLOR,
      //   ),
      //   onPressed: () {
      //     Get.toNamed("/khata-management/request/individual");
      //   },
      //   backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
      // ),
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 550),
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Obx(
            () {
              if (khataController.userKhataDetailsStatus !=
                  States.SUCCESS_STATE) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var user = khataController.userKhataDetails.value.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: const BoxDecoration(
                                  color: ThemeConfig.FORM_COLOR,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  user!.customerName!.split('')[0].toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 50,
                                      color: ThemeConfig.PRIMARY_COLOR),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MainLabelText(
                                          titleString: user.customerName!),
                                      const SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () => launch(
                                            "tel://${user.customerNumber!}"),
                                        child: Desc(
                                            descString:
                                                "+91 ${user.customerNumber!}"),
                                      ),
                                      const SizedBox(height: 5),
                                      user.address == ''
                                          ? const SizedBox()
                                          : Desc(descString: user.address!),
                                    ]),
                              ),
                              IconButton(onPressed: (){
                                Get.toNamed('/khata-pdf-preview');
                              }, icon: Icon(Icons.share_rounded))
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    // const MainLabelText(titleString: "KHATA PERIOD:-"),
                    // const SizedBox(
                    //   height: 3,
                    // ),
                    const MainLabelText(titleString: "Khata Details"),

                    Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5.00),
              //     color: ThemeConfig.FORM_COLOR,
              //   ),
              //   padding: const EdgeInsets.all(10),
              //   child: const MainLabelText(
              //     titleString: "\u{20B9}",
              //   ),
              // ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Desc(descString: "Pending"),
                  const SizedBox(width: 5),
                  LabelText(titleString: "\u{20B9} ${user.totalPendingAmount}"),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Desc(descString: "Total"),
                  const SizedBox(width: 5),
                  LabelText(titleString: "\u{20B9} ${user.totalKhataAmount}"),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedLinearProgressIndicator(
            animatedDuration: const Duration(milliseconds: 300),
            maxValue: double.parse(user.totalKhataAmount!),
            currentValue: double.parse(user.totalPendingAmount!),
            size: 30,
            backgroundColor: ThemeConfig.FORM_COLOR,
            progressColor: ThemeConfig.PRIMARY_COLOR,
            // border: Border.all(
            //     width: 1, color: ThemeConfig.secondaryColor),
            borderRadius: BorderRadius.circular(5),

            // displayText: '',
            // displayTextStyle: const TextStyle(
            //   color: ThemeConfig.whiteColor,
            //   fontSize: ThemeConfig.descriptionSize,
            // ),
          ),
                    //  DetailRow(
                    //   value: double.parse(user.totalKhataAmount!) - double.parse(user.totalPendingAmount),
                    //   title: 'Total Paid Amount',
                    // ),
                    // DetailRow(
                    //   value: user.lastPaidAmount ?? '0',
                    //   title: 'Last Paid Amount',
                    // ),

                    // DetailRow(
                    //   value: user.lastPaidDate!,
                    //   title: 'Last Paid Date',
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),

                    user.previousPayments == null
                        ? const SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MainLabelText(
                                  titleString: "Previous Payments"),
                              const SizedBox(
                                height: 5,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: user.previousPayments!.length,
                                itemBuilder: (context, index) => Card(
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.currency_rupee,
                                      color: ThemeConfig.PRIMARY_COLOR,
                                    ),
                                    title: LabelText(
                                        titleString: user
                                            .previousPayments![index].date!),
                                    trailing: Desc(
                                        descString:
                                            "${user.previousPayments![index].amount}"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String title;
  final String value;
  const DetailRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: LabelText(titleString: title),
                )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Desc(descString: value),
                )),
          ],
        ),
      ),
    );
  }
}
