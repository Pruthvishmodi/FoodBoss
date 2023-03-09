import 'package:flutter/material.dart';
import 'package:seller_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

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
      size: ThemeConfig.LABEL_SIZE,
      weight: FontWeight.normal,
      alignment: alignment,
    );
  }
}
