import 'package:flutter/material.dart';

import 'package:rider_app/widgets/text_widgets/title_subtitle.dart';
import 'package:shared_widgets/shared_widgets.dart';

class OrderCountScreen extends StatelessWidget {
  final double height;
  final String earning;
  const OrderCountScreen({Key? key, required this.height, required this.earning}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: ThemeConfig.PRIMARY_COLOR,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
            bottomRight: Radius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Center(
            child: TitleSubTitle(
              title: '\u{20B9}${earning}',
              subtitle: "Total Earnings",
              isWhite: true,
            ),
          ),
        ],
      ),
    );
  }
}
