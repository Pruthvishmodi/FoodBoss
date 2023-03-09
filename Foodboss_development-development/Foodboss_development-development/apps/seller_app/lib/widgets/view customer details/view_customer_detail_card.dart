import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/khata_controller.dart';

import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/UI%20controller/MyReportScreen/reportDatePickerController.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/TextFieldContainer.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewCustomerDetials extends StatelessWidget {
  final int index;
  // final String address;
  // final double phoneNumber;

  const ViewCustomerDetials({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KhataController khataController = Get.find<KhataController>();
    ReportDatePickerController controller =
        Get.put(ReportDatePickerController(), permanent: false);
    return Center(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 550),
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
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
                                  khataController
                                        .data.data![index].customerName == '' ? 'U': khataController
                                        .data.data![index].customerName!.split('')[0].toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 50,
                                      color: ThemeConfig.PRIMARY_COLOR),
                                ),
                              ),
                        // const CircleAvatar(
                        //   radius: 50,
                        //   foregroundImage: AssetImage(
                        //     'assets/images/profile_pic.jpg',
                        //   ),
                        // ),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainLabelText(
                                    titleString: khataController
                                        .data.data![index].customerName!),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () => launch(
                                      "tel://${khataController.data.data![index].phone!}"),
                                  child: Desc(
                                    descString:
                                      '+91 ${ khataController
                                          .data.data![index].phone!}'),
                                ),
                                // const SizedBox(height: 5),
                                // const Desc(
                                //     descString:
                                //         "B-605,Ganesh Glory 11, Gota, Ahmedabad"),
                              ]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: LabelText(titleString: "Set khata limit"),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SmallRoundedInputField(
                      hintText: "Amount",
                      textType: TextInputType.number,
                      onChange: (v) {
                        khataController.kataLimit.value = v;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child:
                  //       PrimaryButton(op: () {
                  //         khataController.sendSetLimitRequest(khataController
                  //                       .data.data![index].id.toString(), khataAccept,)
                  //       }, text: "Set", type: "filled"),
                  // ),
                ],
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8.0),
              //   child: LabelText(titleString: "Set time limit"),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Obx(
              //   () => Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Flexible(
              //         flex: 1,
              //         child: GestureDetector(
              //           onTap: () {
              //             controller.setDate(context, 0);
              //           },
              //           child: Container(
              //             height: 40,
              //             alignment: Alignment.center,
              //             padding: const EdgeInsets.symmetric(
              //               horizontal: 15,
              //             ),
              //             decoration: BoxDecoration(
              //               color: ThemeConfig.WHITE_COLOR,
              //               border: Border.all(
              //                   width: 1, color: ThemeConfig.PRIMARY_COLOR),
              //               borderRadius: BorderRadius.circular(
              //                   ThemeConfig.BORDERRADIUS_MAX),
              //             ),
              //             child: Text(controller.getStartDate),
              //           ),
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       Flexible(
              //         flex: 1,
              //         child: GestureDetector(
              //           onTap: () {
              //             controller.setDate(context, 1);
              //           },
              //           child: Container(
              //             height: 40,
              //             alignment: Alignment.center,
              //             padding: const EdgeInsets.symmetric(
              //               horizontal: 15,
              //             ),
              //             decoration: BoxDecoration(
              //               color: ThemeConfig.WHITE_COLOR,
              //               border: Border.all(
              //                   width: 1, color: ThemeConfig.PRIMARY_COLOR),
              //               borderRadius: BorderRadius.circular(
              //                   ThemeConfig.BORDERRADIUS_MAX),
              //             ),
              //             child: Text(controller.getEndDate),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8.0),
              //   child: LabelText(titleString: "Set delivery amount"),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: const [
              //     Expanded(
              //       flex: 6,
              //       child: SmallRoundedInputField(
              //         hintText: "Amount",
              //         textType: TextInputType.number,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: PrimaryButton(
                      text: "Reject",
                      op: () {
                        khataController.sendSetLimitRequest(
                          khataController.data.data![index].id.toString(),
                          '2',
                        );
                      },
                      type: "outlined",
                    ),
                  ),
                  const SizedBox(
                    width: 20.00,
                  ),
                  Expanded(
                    flex: 1,
                    child: PrimaryButton(
                      text: "Approve",
                      op: () {
                        khataController.sendSetLimitRequest(
                          khataController.data.data![index].id.toString(),
                          '1',
                        );
                      },
                      type: "filled",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
