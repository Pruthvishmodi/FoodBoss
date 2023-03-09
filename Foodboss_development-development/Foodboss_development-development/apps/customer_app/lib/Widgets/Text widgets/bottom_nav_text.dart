import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Config/text_size_responsize.dart';
import 'package:flutter/material.dart';

class BottomNavText extends StatelessWidget {
  final String descString;
  final Color color;
  final TextAlign? alignment;
  const BottomNavText(
      {Key? key, required this.descString, this.alignment, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: descString,
      color: color,
      size: ThemeConfig.smallTextSize,
      weight: FontWeight.normal,
      alignment: alignment,
    );
  }
}