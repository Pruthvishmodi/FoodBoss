import 'package:flutter/material.dart';
import 'package:rider_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class Label extends StatelessWidget {
  final String descString;
  final TextAlign? alignment;
  const Label({Key? key, required this.descString, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: descString,
      color: ThemeConfig.MAIN_TEXT_COLOR,
      size: ThemeConfig.DESCRIPTION_SIZE,
      weight: FontWeight.normal,
      alignment: alignment,
    );
  }
}
