import 'package:flutter/material.dart';
import 'package:rider_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class TitleWidget extends StatelessWidget {
  final String titleString;
  const TitleWidget({ Key? key, required this.titleString }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.00),
      child: Center(
        child: TextSizeResponsive(string:titleString,color: ThemeConfig.MAIN_TEXT_COLOR,size: ThemeConfig.HEADING_SIZE,weight: FontWeight.bold,),
      ),
    );
  }
}