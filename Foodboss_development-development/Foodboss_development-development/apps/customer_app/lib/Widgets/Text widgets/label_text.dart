import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Config/text_size_responsize.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;
  final bool? isWhite;
  final bool? isSecondary;
  final TextAlign? alignment;
  final bool? isDotDot;
  final int? maxlines;
  final bool? isNormal;
  const LabelText(
      {Key? key,
      required this.text,
      this.alignment,
      this.isWhite,
      this.isNormal,
      this.isSecondary,
      this.isDotDot,
      this.maxlines});

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: text,
      color: isWhite == true
          ? ThemeConfig.whiteColor
          : isSecondary == true
              ? ThemeConfig.secondaryColor
              : ThemeConfig.mainTextColor,
      size: ThemeConfig.labelSize,
      weight: isNormal == true ? FontWeight.w100 : FontWeight.w800,
      alignment: alignment,
      isDotDot: isDotDot == true ? true : false,
      maxlines: maxlines,
    );
  }
}
