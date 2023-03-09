import 'package:flutter/material.dart';
import 'package:rider_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class ButtonText extends StatelessWidget {
  final String titleString;
  final Color color;
  const ButtonText({Key? key, required this.titleString, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: titleString,
      color: color,
      size: ThemeConfig.BUTTON_TEXT_SIZE,
      weight: FontWeight.bold,
    );
  }
}
