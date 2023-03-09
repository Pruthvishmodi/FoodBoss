import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
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

  const TextInputWidget({
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
      cursorColor: ThemeConfig.mainTextColor,
      controller: controller != null ? controller : null,
      keyboardType: textType,
      onChanged: onChange,
      focusNode: focusNode,
      onTap: () {
        ontap!();
      },
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: ThemeConfig.whiteColor,
        contentPadding: const EdgeInsets.only(top: 7, bottom: 7, left: 7),
        // hintText: hintText,
        hintStyle: const TextStyle(color: ThemeConfig.descriptionColor),
        labelText: hintText,
        labelStyle: TextStyle(color: ThemeConfig.descriptionColor),
        // focusedBorder: const OutlineInputBorder(
        //   borderSide:BorderSide.none,
        //   //  const BorderSide(
        //   //     color: ThemeConfig.secondaryColor, width: 1),
        // ),
        // enabledBorder: InputBorder.none,
        // border:  OutlineInputBorder(
          
        //   borderSide: Border(bottom: Border.)
        // ),
        focusColor: ThemeConfig.greyColor,
      ),
    );
  }
}
