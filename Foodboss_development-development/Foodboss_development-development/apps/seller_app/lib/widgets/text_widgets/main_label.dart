import 'package:flutter/material.dart';
import 'package:seller_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class MainLabelText extends StatelessWidget {
  final String titleString;
  final bool? isWhite;
  const MainLabelText({Key? key, required this.titleString, this.isWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: titleString,
      color: isWhite == null
          ? ThemeConfig.MAIN_TEXT_COLOR
          : ThemeConfig.WHITE_COLOR,
      size: ThemeConfig.TITLE_SIZE,
      weight: FontWeight.w600,
    );
  }
}
