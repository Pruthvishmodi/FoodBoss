import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/screens/404_error_screen.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/business_controller/auth/user_controller.dart';
import 'package:seller_app/controller/business_controller/report_problem_controller.dart';
import 'package:seller_app/infrastructure/token_service.dart';
import 'package:seller_app/models/auth/UserModel.dart';
import 'package:seller_app/models/help_category_model.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/BigRoundedInputField.dart';
import 'package:seller_app/widgets/BodyContainer.dart';
import 'package:seller_app/widgets/CustomAppBar.dart';
import 'package:seller_app/widgets/CustomOutlineButton.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:seller_app/widgets/TextFieldContainer.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({Key? key}) : super(key: key);

  @override
  State<ReportProblemScreen> createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  DateTime selectedDate = DateTime.now();
  String dropDownValue = 'Payment Related';
  @override
  Widget build(BuildContext context) {
    ReportProblemController controller =
        Get.put(ReportProblemController(), permanent: false);
    List<String> reasons = [
      'Order Related',
      'Payment Related',
      'New Product',
      'Account Related',
      'Food Boss service Related',
      'Offer Related',
    ];

    _ClickSave() {
      Get.toNamed('/home');
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () {
          if (controller.status == States.LOADING_STATE) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.status == States.ERROR_STATE) {
            return ErrorScreen(
              refreshFunction: controller.helpCat,
            );
          } else {
            return BodyContainer(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.03),
                    Text(
                      "Are you facing any issues while using our mobile application ? ",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize:
                              const AdaptiveTextSize().getadaptiveTextSize(
                            context,
                            ThemeConfig.NOTIFICATION_SIZE,
                          ),
                          color: ThemeConfig.MAIN_TEXT_COLOR),
                      maxLines: 2,
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: ThemeConfig.WHITE_COLOR,
                        border: Border.all(
                            width: 1, color: ThemeConfig.PRIMARY_COLOR),
                        borderRadius:
                            BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                      ),
                      child: Obx(
                        () => DropdownButton(
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(
                              ThemeConfig.BORDERRADIUS_MIN),
                          underline: Container(
                            height: 0,
                          ),
                          value: controller.getSelected,
                          elevation: 3,
                          style: const TextStyle(
                            color: ThemeConfig.PRIMARY_COLOR,
                          ),
                          items: controller.helpCategories
                              .map((HelpCategory value) => DropdownMenuItem(
                                  value: value,
                                  child: SubText(
                                    text: value.categoryName!,
                                    color: ThemeConfig.MAIN_TEXT_COLOR,
                                    size: ThemeConfig.NOTIFICATION_SIZE,
                                  )))
                              .toList(),
                          onChanged: (value) {
                            controller.changeSelectedCategory(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: 47,
                      padding:
                          const EdgeInsets.only(top: 7, bottom: 7, left: 20),
                      decoration: BoxDecoration(
                        color: ThemeConfig.WHITE_COLOR,
                        border: Border.all(
                            width: 1, color: ThemeConfig.PRIMARY_COLOR),
                        borderRadius:
                            BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: ThemeConfig.PRIMARY_COLOR,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // LabelText(titleString: 'Search')
                          Text(
                            controller.name,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: 47,
                      padding:
                          const EdgeInsets.only(top: 7, bottom: 7, left: 20),
                      decoration: BoxDecoration(
                        color: ThemeConfig.WHITE_COLOR,
                        border: Border.all(
                            width: 1, color: ThemeConfig.PRIMARY_COLOR),
                        borderRadius:
                            BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: ThemeConfig.PRIMARY_COLOR,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // LabelText(titleString: 'Search')
                          Text(
                            controller.phone,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    // controller.name
                    // SmallRoundedInputField(
                    //   tailingIcon: Icons.phone,
                    //   hintText: controller.phone,
                    //   onChange: (val) => controller.changePhone(val),
                    // ),
                    SizedBox(height: size.height * 0.02),
                    const SubText(
                        text: 'Message',
                        color: ThemeConfig.MAIN_TEXT_COLOR,
                        size: ThemeConfig.SUB_TITLE_SIZE),
                    SizedBox(height: size.height * 0.02),
                    BigRoundedInputField(
                      hintText: 'Type Something..',
                      onChange: (val) => controller.changeMessage(val),
                    ),
                    SizedBox(height: size.height * 0.02),

                    InkWell(
                      onTap: () {
                        controller.addImage();
                      },
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: ThemeConfig.WHITE_COLOR,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: ThemeConfig.PRIMARY_COLOR),
                            ),
                            height: 50,
                            child: Obx(() => Row(
                                  children: [
                                    Expanded(
                                      child: LabelText(
                                        titleString: "+ Upload Image",
                                      ),
                                    ),
                                    controller.req.value.image != null
                                        ? Icon(Icons.check)
                                        : SizedBox()
                                  ],
                                )),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: Obx(
                              () => controller.status == States.LOADING_STATE
                                  ? DisabledButton(
                                      text: "loading",
                                      op: () {},
                                      type: "outlined")
                                  : PrimaryButton(
                                      op: () => controller.sendSupportRequest(),
                                      text: 'Submit',
                                      type: "filled",
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: MainLabelText(titleString: "OR")),
                      ],
                    ),
                    SizedBox(height: size.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => launch("tel://8799321686"),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                // color: ThemeConfig.WHITE_COLOR,
                                child:
                                    Image.asset('assets/images/call_image.png'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Desc(descString: "+91-8799321686"),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              launch("mailto:sellersupport@foodboss.in"),
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                // color: ThemeConfig.WHITE_COLOR,
                                child: Image.asset(
                                    'assets/images/gmail_image.png'),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Desc(descString: "sellersupport@foodboss.in"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
