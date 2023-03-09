import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/title_text.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String headingText;
  final String subtitleText;
  final String imageurl;
  final MaterialColor color;
  const BannerWidget({
    Key? key,
    required this.headingText,
    required this.subtitleText,
    required this.imageurl,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: color,
          ),
          borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
          color: color.shade50),
      height: 100,
      width: double.infinity,
      padding: ThemeConfig.contentPadding2,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(text: headingText),
                DescriptionText(text: subtitleText)
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Image.asset(
                imageurl,
                height: 80,
              ))
        ],
      ),
    );
  }
}
