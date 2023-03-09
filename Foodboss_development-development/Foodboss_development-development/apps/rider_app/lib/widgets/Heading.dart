import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';


class Heading extends StatelessWidget {
  final String text;
  final Color color;

  const Heading(this.text,this.color, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: const AdaptiveTextSize().getadaptiveTextSize(context,ThemeConfig.HEADING_SIZE),
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }
}