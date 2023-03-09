import 'package:flutter/material.dart';
import 'package:seller_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class SubHeadingText extends StatelessWidget {
  final String titleString;
  final bool? isWhite;
  final TextAlign? alignment;
  const SubHeadingText(
      {Key? key, required this.titleString, this.alignment, this.isWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: titleString,
      color: isWhite == null
          ? ThemeConfig.MAIN_TEXT_COLOR
          : ThemeConfig.WHITE_COLOR,
      size: ThemeConfig.SUB_HEADING_SIZE,
      weight: FontWeight.normal,
      alignment: alignment,
    );
  }
}
