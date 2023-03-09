import 'package:flutter/material.dart';
import 'package:seller_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class Desc extends StatelessWidget {
  final String descString;
  final TextAlign? alignment;
  final bool? isWhite;
  final bool? isSec;

  const Desc({Key? key, required this.descString, this.alignment, this.isWhite, this.isSec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: descString,
      color: isWhite == null
          ? ThemeConfig.MAIN_TEXT_COLOR
          : isSec== null ?ThemeConfig.WHITE_COLOR: ThemeConfig.SUCCESS_COLOR,
      size: ThemeConfig.DESCRIPTION_SIZE,
      weight: FontWeight.normal,
      alignment: alignment,
    );
  }
}
