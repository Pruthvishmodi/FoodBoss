import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Config/text_size_responsize.dart';
import 'package:flutter/material.dart';

class MainLabelText extends StatelessWidget {
  final String text;
  final bool? isWhite;
  final bool? isBold;

  final TextAlign? alignment;
  const MainLabelText(
      {Key? key, required this.text, this.alignment, this.isWhite, this.isBold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: text,
      color:
          isWhite == true ? ThemeConfig.whiteColor : ThemeConfig.mainTextColor,
      size: ThemeConfig.mainLabelSize,
      weight: isBold == true? FontWeight.bold : FontWeight.normal,
      alignment: alignment,
    );
  }
}
