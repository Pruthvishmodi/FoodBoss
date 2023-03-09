import 'package:flutter/material.dart';
import 'package:seller_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class TitleText extends StatelessWidget {
  final String titleString;
  const TitleText({Key? key, required this.titleString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: titleString,
      color: ThemeConfig.MAIN_TEXT_COLOR,
      size: ThemeConfig.TITLE_SIZE,
      weight: FontWeight.w600,
    );
  }
}
