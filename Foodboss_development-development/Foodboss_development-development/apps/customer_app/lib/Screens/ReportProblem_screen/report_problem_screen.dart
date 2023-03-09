import 'package:customer_app/Config/ThemeConfig.dart';

import 'package:customer_app/Controller/report_problem_controller.dart';
import 'package:customer_app/Models/help_category_model.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';

import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/shimmers/custom_shimmers.dart';
import 'package:customer_app/utils/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportProblemController controller =
        Get.put(ReportProblemController(), permanent: false);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ThemeConfig.whiteColor,
        appBar: AppBar(
          backgroundColor: ThemeConfig.whiteColor,
          title: const MainLabelText(
            text: 'Report a problem',
            isBold: true,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          // backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(child: Obx(
          () {
            if (controller.status == States.LOADING_STATE) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => FocusScope.of(context).unfocus(),
                child: SizedBox(
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
                              ShimmerContainer(
                                height: 15,
                                width: size.width,
                              ),
                              ShimmerContainer(
                                height: 50,
                                width: size.width,
                              ),
                              ShimmerContainer(
                                height: 50,
                                width: size.width,
                              ),
                              ShimmerContainer(
                                height: 50,
                                width: size.width,
                              ),
                              ShimmerContainer(
                                height: 15,
                              ),
                              ShimmerContainer(
                                height: 150,
                                width: size.width,
                              ),
                              // Spacer(),
                              // ShimmerContainer(
                              //   height: 40,
                              //   width: size.width,
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (controller.status == States.ERROR_STATE) {
              return const Center(
                child: MainLabelText(text: 'No screen found'),
              );
            } else {
              return Container(
                height: size.height,
                width: size.width,
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.03),
                      LabelText(text: 'Are you facing any issues while using our mobile application ?'),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: ThemeConfig.whiteColor,
                          border: Border.all(
                              width: 1, color: ThemeConfig.secondaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Obx(
                          () => DropdownButton(
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            underline: Container(
                              height: 0,
                            ),
                            value: controller.getSelected,
                            elevation: 3,
                            style: const TextStyle(
                              color: ThemeConfig.secondaryColor,
                            ),
                            items: controller.helpCategories
                                .map((HelpCategory value) => DropdownMenuItem(
                                    value: value,
                                    child: SubText(
                                      text: value.categoryName!,
                                      color: ThemeConfig.mainTextColor,
                                      size: ThemeConfig.labelSize,
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
                          color: ThemeConfig.whiteColor,
                          border: Border.all(
                              width: 1, color: ThemeConfig.secondaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: ThemeConfig.secondaryColor,
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
                          color: ThemeConfig.whiteColor,
                          border: Border.all(
                              width: 1, color: ThemeConfig.secondaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: ThemeConfig.secondaryColor,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.phone,
                              style: const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      LabelText(text: 'Message'),
                      SizedBox(height: size.height * 0.02),
                      BigRoundedInputField(
                        hintText: 'Write your query/problem',
                        onChange: (val) => controller.changeMessage(val),
                      ),
                      SizedBox(height: size.height * 0.05),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: SecondaryButton(
                                op: () => controller.sendSupportRequest(),
                                text: 'Submit',
                                type: "filled",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        )));
  }
}

class SubText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const SubText(
      {required this.text, required this.color, required this.size, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        maxLines: 2,
        softWrap: false,
        overflow: TextOverflow.visible,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: const AdaptiveTextSize().getadaptiveTextSize(context, size),
        ),
      ),
    );
  }
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}

class BigRoundedInputField extends StatelessWidget {
  final String hintText;
  final Function(String)? onChange;

  const BigRoundedInputField({
    Key? key,
    required this.hintText,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      onChanged: onChange,
      decoration: InputDecoration(
        filled: true,
        fillColor: ThemeConfig.whiteColor,
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: ThemeConfig.secondaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: ThemeConfig.secondaryColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: ThemeConfig.secondaryColor, width: 1),
        ),
      ),
    );
  }
}

class SmallRoundedInputField extends StatelessWidget {
  final String hintText;
  final FocusNode? focusNode;

  final IconData? tailingIcon;
  final TextInputType? textType;
  final TextEditingController? controller;
  final Function? ontap;
  final bool? focus;

  final labelText;
  final Function(String)? onChange;
  final Function(String)? onSubmit;

  const SmallRoundedInputField({
    Key? key,
    required this.hintText,
    this.tailingIcon,
    this.textType,
    this.controller,
    this.onChange,
    this.labelText,
    this.ontap,
    this.onSubmit,
    this.focus,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: focus == true ? true : false,
      onSubmitted: onSubmit,
      cursorColor: ThemeConfig.secondaryColor,
      controller: controller != null ? controller : null,
      keyboardType: textType,
      onChanged: onChange,
      focusNode: focusNode,
      onTap: () {
        ontap!();
      },
      decoration: tailingIcon != null
          ? InputDecoration(
              isDense: true,
              filled: true,
              fillColor: ThemeConfig.whiteColor,
              contentPadding:
                  const EdgeInsets.only(top: 7, bottom: 7, left: 20),
              hintText: hintText,
              labelText: labelText,
              hintStyle: const TextStyle(color: ThemeConfig.descriptionColor),
              prefixIcon: Icon(
                tailingIcon,
                color: ThemeConfig.secondaryColor,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: ThemeConfig.descriptionColor, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: ThemeConfig.secondaryColor, width: 1),
              ),
              border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: ThemeConfig.secondaryColor, width: 1),
              ),
            )
          : InputDecoration(
              isDense: true,
              filled: true,
              fillColor: ThemeConfig.whiteColor,
              contentPadding:
                  const EdgeInsets.only(top: 7, bottom: 7, left: 20),
              hintText: hintText,
              hintStyle: const TextStyle(color: ThemeConfig.secondaryColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: ThemeConfig.secondaryColor, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: ThemeConfig.secondaryColor, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: ThemeConfig.secondaryColor, width: 1),
              ),
            ),
    );
  }
}
