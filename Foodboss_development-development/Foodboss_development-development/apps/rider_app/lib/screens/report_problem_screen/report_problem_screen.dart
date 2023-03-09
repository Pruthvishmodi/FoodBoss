import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/controller/business_controller/auth/user_controller.dart';
import 'package:rider_app/controller/business_controller/report_problem_controller.dart';
import 'package:rider_app/models/auth/UserModel.dart';
import 'package:rider_app/models/help_category_model.dart';
import 'package:rider_app/utils/states.dart';
import 'package:rider_app/widgets/BigRoundedInputField.dart';
import 'package:rider_app/widgets/BodyContainer.dart';
import 'package:rider_app/widgets/SubText.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({Key? key}) : super(key: key);

  @override
  State<ReportProblemScreen> createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  DateTime selectedDate = DateTime.now();
  String dropDownValue = 'Payment Related';

  // late String name;
  // late String email;
  // late String phone;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //    name = TokenService.getUsername() as String;
  //    email = TokenService.getEmail() as String;
  //    phone = TokenService.getPhoneNumber() as String;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    ReportProblemController controller =
        Get.put(ReportProblemController(), permanent: false);
    UserController userController = Get.put(UserController(), permanent: true);
    User user = userController.getUser;

    controller.changeName(user.Username);
    // controller.changeEmail(user.email);
    controller.changePhone(user.phoneNumber);
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
        () => BodyContainer(
          child: controller.status == States.LOADING_STATE
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: const CircularProgressIndicator(),
                  ),
                )
              : GestureDetector(
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
                          borderRadius: BorderRadius.circular(
                              ThemeConfig.BORDERRADIUS_MAX),
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
                          borderRadius: BorderRadius.circular(
                              ThemeConfig.BORDERRADIUS_MIN),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: ThemeConfig.PRIMARY_COLOR,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.name,
                              style: const TextStyle(fontSize: 15),
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
                          borderRadius: BorderRadius.circular(
                              ThemeConfig.BORDERRADIUS_MIN),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: ThemeConfig.PRIMARY_COLOR,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            // LabelText(titleString: 'Search')
                            Text(
                              controller.phone,
                              style: const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
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
                      SizedBox(height: size.height * 0.05),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: PrimaryButton(
                                op: () => controller.sendSupportRequest(),
                                text: 'Submit',
                                type: "filled",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      const MainLabelText(titleString: "Another way"),
                      SizedBox(height: size.height * 0.05),
                      SizedBox(height: size.height * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => launch("tel://8799328310"),
                            child: Column(
                              children: [
                                Container(
                                    width: 60,
                                    height: 60,
                                    // color: ThemeConfig.WHITE_COLOR,
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/images/call_image.png'),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Desc(descString: "+91-8799328310"),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                launch("mailto:ridersupport@foodboss.in"),
                            child: Column(
                              children: [
                                Container(
                                    width: 70,
                                    height: 70,
                                    // color: ThemeConfig.WHITE_COLOR,
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/images/gmail_image.png'),
                                    )),
                                const SizedBox(
                                  height: 0,
                                ),
                                const Desc(descString: "ridersupport@foodboss.in"),
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
        ),
      ),
    );
  }
}
