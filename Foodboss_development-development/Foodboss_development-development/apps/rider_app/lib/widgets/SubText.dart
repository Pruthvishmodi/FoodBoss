import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class SubText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const SubText({required this.text, required this.color, required this.size ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        maxLines: 2,
        softWrap: false,
        overflow: TextOverflow.visible,
        textAlign: TextAlign.center,
        style: TextStyle(color: color,fontSize: const AdaptiveTextSize().getadaptiveTextSize(context,size),fontFamily: 'Poppins'),
      ),
    );
  }
}
