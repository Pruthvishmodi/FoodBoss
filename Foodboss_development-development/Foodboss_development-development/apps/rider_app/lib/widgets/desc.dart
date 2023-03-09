import 'package:flutter/material.dart';
import 'package:rider_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class Desc extends StatelessWidget {
  final String descString;
  final TextAlign? alignment;
  final bool? isSec;
  const Desc({Key? key, required this.descString, this.alignment, this.isSec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      style: isSec != null ? 'u' : '',
      string: descString,
      color: isSec != null
          ? ThemeConfig.SUCCESS_COLOR
          : ThemeConfig.SECONDARY_TEXT_COLOR,
      size: ThemeConfig.DESCRIPTION_SIZE,
      weight: FontWeight.normal,
      alignment: alignment,
    );
  }
}
