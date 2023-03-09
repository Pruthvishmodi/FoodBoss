import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Config/text_size_responsize.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final bool isDotDor;
  final int? maxlines;
  const TitleText(
      {Key? key,
      required this.text,
      this.alignment,
      this.isDotDor = false,
      this.maxlines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: text,
      color: ThemeConfig.mainTextColor,
      size: ThemeConfig.titleSize,
      weight: FontWeight.w900,
      alignment: alignment,
      isDotDot: isDotDor,
      maxlines: maxlines,
    );
  }
}
