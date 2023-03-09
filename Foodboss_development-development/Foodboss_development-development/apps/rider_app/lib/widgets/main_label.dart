import 'package:flutter/material.dart';
import 'package:rider_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class MainLabelText extends StatelessWidget {
  final String titleString;
  final bool? isWhite;
  final bool? isAlign;
  final bool? isDot;

  const MainLabelText(
      {Key? key,
      required this.titleString,
      this.isWhite,
      this.isAlign,
      this.isDot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: titleString,
      // alignment: TextAlign.left,
      isLeft: isAlign == true ? "yes" : "no",
      color: isWhite == null
          ? ThemeConfig.MAIN_TEXT_COLOR
          : ThemeConfig.WHITE_COLOR,
      size: ThemeConfig.TITLE_SIZE,
      weight: FontWeight.w600,
      isdot: isDot == true ? true : false,
    );
  }
}
