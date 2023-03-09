import 'package:flutter/material.dart';
import 'package:seller_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class HeadingText extends StatelessWidget {
  final String titleString;
  final bool? isWhite;
  const HeadingText({Key? key, required this.titleString, this.isWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: titleString,
      color: isWhite == null
          ? ThemeConfig.MAIN_TEXT_COLOR
          : ThemeConfig.WHITE_COLOR,
      size: ThemeConfig.HEADING_SIZE,
      weight: FontWeight.w500,
    );
  }
}
