import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Config/text_size_responsize.dart';
import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  const HeadingText({Key? key, required this.text, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: text,
      color: ThemeConfig.mainTextColor,
      size: ThemeConfig.headingSize,
      weight: FontWeight.bold,
      alignment: alignment,
    );
  }
}
