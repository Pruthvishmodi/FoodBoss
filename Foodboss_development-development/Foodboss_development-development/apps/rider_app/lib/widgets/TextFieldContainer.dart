import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? height;
  final double? width;
  // final bool? hasBorder;
  const TextFieldContainer({
    Key? key,
    required this.child,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height ?? 40.0,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        // border: hasBorder! ? Border.all(width: 1) : null,
        borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MAX),
        color: color ?? ThemeConfig.WHITE_COLOR,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Center(child: child),
    );
  }
}
