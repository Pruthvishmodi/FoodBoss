import 'package:flutter/material.dart';
import 'package:rider_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class DistructiveText extends StatelessWidget {
  final String titleString;
  const DistructiveText({Key? key, required this.titleString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: titleString,
      color: ThemeConfig.MAIN_TEXT_COLOR,
      size: ThemeConfig.LABEL_SIZE,
      weight: FontWeight.w500,
    );
  }
}
