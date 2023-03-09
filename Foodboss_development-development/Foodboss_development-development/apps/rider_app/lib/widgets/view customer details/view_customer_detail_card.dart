import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/controller/UI%20controller/MyReportScreen/reportDatePickerController.dart';
import 'package:rider_app/widgets/SmallRoundedInputField.dart';
import 'package:rider_app/widgets/TextFieldContainer.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewCustomerDetials extends StatelessWidget {
  // final String name;
  // final String address;
  // final double phoneNumber;

  const ViewCustomerDetials({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        const CircleAvatar(
                          radius: 50,
                          foregroundImage: AssetImage(
                            'assets/images/profile_pic.jpg',
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainLabelText(titleString: "Jay Soni"),
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () => launch("tel://8780508717"),
                                  child: Desc(descString: "+91-8787878787"),
                                ),
                                SizedBox(height: 5),
                                Desc(
                                    descString:
                                        "B-605,Ganesh Glory 11, Gota, Ahmedabad"),
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
                  const Expanded(
                    flex: 1,
                    child: SmallRoundedInputField(
                      hintText: "Amount",
                      textType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child:
                        PrimaryButton(op: () {}, text: "Set", type: "filled"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: LabelText(titleString: "Set time limit"),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          controller.setDate(context, 0);
                        },
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeConfig.WHITE_COLOR,
                            border: Border.all(
                                width: 1, color: ThemeConfig.PRIMARY_COLOR),
                            borderRadius: BorderRadius.circular(
                                ThemeConfig.BORDERRADIUS_MAX),
                          ),
                          child: Text(controller.getStartDate),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          controller.setDate(context, 1);
                        },
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeConfig.WHITE_COLOR,
                            border: Border.all(
                                width: 1, color: ThemeConfig.PRIMARY_COLOR),
                            borderRadius: BorderRadius.circular(
                                ThemeConfig.BORDERRADIUS_MAX),
                          ),
                          child: Text(controller.getEndDate),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: LabelText(titleString: "Set delivery amount"),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Expanded(
                    flex: 6,
                    child: SmallRoundedInputField(
                      hintText: "Amount",
                      textType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: PrimaryButton(
                      text: "Reject",
                      op: () {},
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
                      op: () {},
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
