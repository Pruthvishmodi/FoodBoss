import 'package:flutter/material.dart';

class FoodBossCard extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double borderRadius;
  final double? height;
  final Function op;
  final Color cardColor;
  final Color? borderColor;
  final double width;
  final double? borderWidth;
  final double? blurRadius;
  final Color? shadowColor;
  final Widget child;
  const FoodBossCard(
      {Key? key,
      required this.borderRadius,
      required this.padding,
      this.height,
      required this.cardColor,
      required this.width,
      this.borderColor,
      this.blurRadius,
      this.shadowColor,
      required this.child,
      required this.op,
      this.borderWidth,
      required this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => op(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: cardColor,
            border: Border.all(
                color: borderColor ?? cardColor, width: borderWidth ?? 0),
            boxShadow: [
              BoxShadow(
                color: shadowColor ?? Colors.transparent,
                blurRadius: blurRadius ?? 0,
              ),
            ]),
        padding: padding,
        margin: margin,
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
