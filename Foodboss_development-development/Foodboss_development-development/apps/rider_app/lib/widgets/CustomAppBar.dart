import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool? noElevation;


  const CustomAppBar({
    this.noElevation = false,
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: noElevation! ? 0 : 5,
      foregroundColor: ThemeConfig.WHITE_COLOR,
      backgroundColor: ThemeConfig.PRIMARY_COLOR,
      title: Text(
    
        title,
        style: TextStyle(
            // color: ThemeConfig.MAIN_TEXT_COLOR,
            fontFamily: 'Poppins',
            fontSize: const AdaptiveTextSize()
                .getadaptiveTextSize(context, ThemeConfig.TITLE_SIZE)),
      ),
    
    );
  }
}
