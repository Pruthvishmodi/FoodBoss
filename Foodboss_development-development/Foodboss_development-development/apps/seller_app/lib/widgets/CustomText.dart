import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class CustomText extends StatelessWidget {

  final String text;
  final Color? color;
  final double? size;
  const CustomText({ Key? key, required this.text, this.color, this.size }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
              text,
              style: TextStyle(
                  color: color,
                  fontSize: const AdaptiveTextSize().getadaptiveTextSize(
                      context, size),
                  fontFamily: 'Poppins'),
            );
  }
}