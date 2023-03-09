import 'package:flutter/material.dart';

class TextSizeResponsive extends StatelessWidget {
  final String string;
  final Color color;
  final double size;
  final FontWeight weight;
  final String? style;
  final String? isLeft;
  final bool? isdot;


  final TextAlign? alignment;
  const TextSizeResponsive(
      {Key? key,
      required this.string,
      required this.color,
      required this.size,
      required this.weight,
      this.alignment,
      this.style, this.isLeft, this.isdot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return Text(
      string,
      
      maxLines: 3,
      style: style == 'i'
          ? TextStyle(
              decoration: TextDecoration.lineThrough,
              color: color,
              fontSize: (size / 720.00) * sizeHeight > size
                  ? (size / 720.00) * sizeHeight
                  : size,
              fontWeight: weight,
              
            ):style =='u' ? TextStyle(
              decoration: TextDecoration.underline,
              color: color,
              fontSize: (size / 720.00) * sizeHeight > size
                  ? (size / 720.00) * sizeHeight
                  : size,
              fontWeight: weight,)
          : TextStyle(
              // decoration: TextDecoration.lineThrough,
              color: color,
              fontSize: (size / 720.00) * sizeHeight > size
                  ? (size / 720.00) * sizeHeight
                  : size,
              fontWeight: weight,
            ),
            overflow:isdot == true ? TextOverflow.ellipsis : null ,
      textAlign: isLeft== 'yes'? TextAlign.left: TextAlign.center,
    );
  }
}
