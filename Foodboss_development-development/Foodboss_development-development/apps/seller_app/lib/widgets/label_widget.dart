import 'package:flutter/material.dart';
import 'package:seller_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class LabelText extends StatelessWidget {
  final String titleString;
  final String? style;
  const LabelText({Key? key, required this.titleString, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(style: style,
      string: titleString,
      color: ThemeConfig.MAIN_TEXT_COLOR,
      size: ThemeConfig.LABEL_SIZE,
      weight: FontWeight.w600,
    );
  }
}
