import 'package:flutter/material.dart';
import 'package:seller_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class Desc extends StatelessWidget {
  final String descString;
  final TextAlign? alignment;
  const Desc({Key? key, required this.descString, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: descString,
      color: ThemeConfig.SECONDARY_TEXT_COLOR,
      size: ThemeConfig.DESCRIPTION_SIZE,
      weight: FontWeight.normal,
      alignment: alignment,
    );
  }
}
