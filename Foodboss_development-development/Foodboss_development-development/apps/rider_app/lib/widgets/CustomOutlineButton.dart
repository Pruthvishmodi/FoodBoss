import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class CustomOutlineButton extends StatelessWidget {
  final VoidCallback ontap;
  final Color? fontColor;
  final String text;
  final Color outlineColor;
  final Color? backColor;
  final double? height;
  final double? fontSize;
  const CustomOutlineButton(
      {Key? key,
      required this.ontap,
      this.fontColor,
      required this.text,
      required this.outlineColor,
      this.backColor = Colors.white,
      this.fontSize,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: outlineColor),
          color: backColor,
        ),
        width: MediaQuery.of(context).size.width,
        height: height ?? 40,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: fontColor,
              fontSize: fontSize ?? ThemeConfig.SUB_TITLE_SIZE,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
