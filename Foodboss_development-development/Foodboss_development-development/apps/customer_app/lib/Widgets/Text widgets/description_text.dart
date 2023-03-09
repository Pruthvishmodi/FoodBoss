import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Config/text_size_responsize.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  final bool? isWhite;
  final Color? color;
  final TextAlign? alignment;
  final String? type;
  final bool? isDotDot;
  const DescriptionText({Key? key, required this.text, this.alignment, this.isWhite, this.type, this.color, this.isDotDot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: text ,
      color: color ?? ThemeConfig.descriptionColor,
      size: ThemeConfig.descriptionSize,
      weight: FontWeight.normal,
      alignment: alignment,
      style: type == 'i' ? 'i' : null,
      isDotDot: isDotDot,
    );
  }
}