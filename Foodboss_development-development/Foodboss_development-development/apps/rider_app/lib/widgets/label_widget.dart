import 'package:flutter/material.dart';
import 'package:rider_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class LabelText extends StatelessWidget {
  final String titleString;
  final String? style;
  final String? isLeft;
  final TextAlign? align;
  const LabelText(
      {Key? key,
      required this.titleString,
      this.style,
      this.isLeft,
      this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      style: style,
      isLeft: isLeft,
      string: titleString,
      color: ThemeConfig.MAIN_TEXT_COLOR,
      size: ThemeConfig.LABEL_SIZE,
      weight: FontWeight.w600,
      alignment: align ?? TextAlign.left,
    );
  }
}
