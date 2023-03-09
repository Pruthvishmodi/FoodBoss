import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Config/text_size_responsize.dart';
import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final String text;
  const LargeText({ Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
    );
  }
}

