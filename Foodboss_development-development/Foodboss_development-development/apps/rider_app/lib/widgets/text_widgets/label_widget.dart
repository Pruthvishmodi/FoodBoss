import 'package:flutter/material.dart';
import 'package:rider_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class LabelText extends StatelessWidget {
  final String titleString;
  final String? isLeft;

  final bool? isWhite;
  const LabelText(
      {Key? key, required this.titleString, this.isWhite, this.isLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      isLeft: isLeft == 'yes' ? 'yes' : '',
      // alignment: TextAlign.left,
      string: titleString,
      color: isWhite == null
          ? ThemeConfig.MAIN_TEXT_COLOR
          : ThemeConfig.WHITE_COLOR,
      size: ThemeConfig.LABEL_SIZE,
      weight: FontWeight.w600,
    );
  }
}
