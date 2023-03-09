import 'package:flutter/material.dart';
import 'package:seller_app/widgets/text_widgets/heading_widget.dart';
import 'package:seller_app/widgets/text_widgets/sub_heading_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class TitleSubTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool? isWhite;
  final bool? loading;
  const TitleSubTitle(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.subtitle,
      this.isWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        loading == false
            ? HeadingText(
                isWhite: isWhite,
                titleString: title,
              )
            : Container(
                width: 100,
                height: 30,
                color: isWhite == true
                    ? ThemeConfig.FORM_COLOR.withOpacity(0.2)
                    : ThemeConfig.FORM_COLOR,
              ),
        SizedBox(
          height: 5,
        ),
        loading == false
            ? SubHeadingText(
                isWhite: isWhite,
                titleString: subtitle,
                alignment: TextAlign.center,
              )
            : Container(
                width: 80,
                height: 30,
                color: isWhite == true
                    ? ThemeConfig.FORM_COLOR.withOpacity(0.2)
                    : ThemeConfig.FORM_COLOR,
              ),
      ],
    );
  }
}
