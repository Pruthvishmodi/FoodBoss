import 'package:flutter/material.dart';
import 'package:rider_app/widgets/text_widgets/heading_widget.dart';
import 'package:rider_app/widgets/text_widgets/sub_heading_widget.dart';

class TitleSubTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool? isWhite;
  const TitleSubTitle(
      {Key? key, required this.title, required this.subtitle, this.isWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeadingText(
          isWhite: isWhite,
          titleString: title,
        ),
        SubHeadingText(
          isWhite: isWhite,
          titleString: subtitle,
          alignment: TextAlign.center,
        ),
      ],
    );
  }
}
