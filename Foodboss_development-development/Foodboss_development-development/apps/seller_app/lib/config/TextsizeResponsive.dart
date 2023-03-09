import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class TextSizeResponsive extends StatelessWidget {
  final String string;
  final Color color;
  final double size;
  final FontWeight weight;
  final String? style;
  final TextAlign? alignment;
  const TextSizeResponsive(
      {Key? key,
      required this.string,
      required this.color,
      required this.size,
      required this.weight,
      this.alignment,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return Text(
      string,
      style: style == 'i'
          ? TextStyle(
              decoration: TextDecoration.lineThrough,
              color: color,
              fontSize: (size / 720.00) * sizeHeight > size
                  ? (size / 720.00) * sizeHeight
                  : (size / 720.00) * sizeHeight,
              fontWeight: weight,
            )
          : TextStyle(
              // decoration: TextDecoration.lineThrough,
              color: color,
              fontSize: (size / 720.00) * sizeHeight > size
                  ? (size / 720.00) * sizeHeight
                  : (size / 720.00) * sizeHeight,
              fontWeight: weight,
            ),
      textAlign: alignment,
    );
  }
}
