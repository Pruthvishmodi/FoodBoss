import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class SmallRoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData? tailingIcon;
  final TextInputType? textType;
  final TextEditingController? controller;
  final Function? ontap;
  final labelText;
  final Function(String)? onChange;

  const SmallRoundedInputField({
    Key? key,
    required this.hintText,
    this.tailingIcon,
    this.textType,
    this.controller,
    this.onChange,
    this.labelText, this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ThemeConfig.PRIMARY_COLOR,
      controller: controller,
      keyboardType: textType,
      onChanged: onChange,
      onTap: () {ontap!();},
      
      decoration: tailingIcon != null
          ? InputDecoration(
              isDense: true,
              filled: true,
              fillColor: ThemeConfig.WHITE_COLOR,
              contentPadding:
                  const EdgeInsets.only(top: 7, bottom: 7, left: 20),
              hintText: hintText,
              labelText: labelText,
              hintStyle: const TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR),
              prefixIcon: Icon(
                tailingIcon,
                color: ThemeConfig.PRIMARY_COLOR,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                borderSide: const BorderSide(
                    color: ThemeConfig.DISTRUCTIVE_COLOR, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                borderSide: const BorderSide(
                    color: ThemeConfig.PRIMARY_COLOR, width: 1),
              ),
              border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                borderSide: const BorderSide(
                    color: ThemeConfig.PRIMARY_COLOR, width: 1),
              ),
            )
          : InputDecoration(
              isDense: true,
              filled: true,
              fillColor: ThemeConfig.WHITE_COLOR,
              contentPadding:
                  const EdgeInsets.only(top: 7, bottom: 7, left: 20),
              hintText: hintText,
              hintStyle: const TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                borderSide: const BorderSide(
                    color: ThemeConfig.DISTRUCTIVE_COLOR, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                borderSide: const BorderSide(
                    color: ThemeConfig.PRIMARY_COLOR, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                borderSide: const BorderSide(
                    color: ThemeConfig.PRIMARY_COLOR, width: 1),
              ),
            ),
    );
  }
}

class SmallRoundedInputField02 extends StatelessWidget {
  final String hintText;
  final IconData? tailingIcon;
  final TextInputType? textType;
  final TextEditingController? controller;
  final labelText;
  final Function(String)? onChange;

  const SmallRoundedInputField02({
    Key? key,
    required this.hintText,
    this.tailingIcon,
    this.textType,
    this.controller,
    this.onChange,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ThemeConfig.PRIMARY_COLOR,
      controller: controller,
      keyboardType: textType,
      onChanged: onChange,
      decoration: tailingIcon != null
          ? InputDecoration(
              // isDense: true,
              filled: true,
              fillColor: ThemeConfig.WHITE_COLOR,
              contentPadding:
                  const EdgeInsets.only(top: 20, bottom: 20, left: 20),
              hintText: hintText,
              labelText: labelText,
              hintStyle: const TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR),
              prefixIcon: Icon(
                tailingIcon,
                color: ThemeConfig.PRIMARY_COLOR,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                borderSide: const BorderSide(
                    color: ThemeConfig.DISTRUCTIVE_COLOR, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                borderSide: const BorderSide(
                    color: ThemeConfig.PRIMARY_COLOR, width: 1),
              ),
              border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                borderSide: const BorderSide(
                    color: ThemeConfig.PRIMARY_COLOR, width: 1),
              ),
            )
          : InputDecoration(
              isDense: true,
              filled: true,
              fillColor: ThemeConfig.WHITE_COLOR,
              contentPadding:
                  const EdgeInsets.only(top: 12.5, bottom: 12.5, left: 20),
              hintText: hintText,
              hintStyle: const TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                borderSide: const BorderSide(
                    color: ThemeConfig.DISTRUCTIVE_COLOR, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                borderSide: const BorderSide(
                    color: ThemeConfig.PRIMARY_COLOR, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                borderSide: const BorderSide(
                    color: ThemeConfig.PRIMARY_COLOR, width: 1),
              ),
            ),
    );
  }
}
