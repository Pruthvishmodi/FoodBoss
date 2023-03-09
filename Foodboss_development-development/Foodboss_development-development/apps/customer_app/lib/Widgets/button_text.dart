import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Config/text_size_responsize.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String buttonTextString;
  final Color color;
  const ButtonText(
      {Key? key, required this.buttonTextString, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: buttonTextString,
      color: color,
      size: ThemeConfig.buttonSize,
      weight: FontWeight.normal,
    );
  }
}
