import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/text_widgets/title_subtitle.dart';

class OrderCountScreen extends StatelessWidget {
  final double height;
  final String orderCount;
  final bool? loading;
  const OrderCountScreen(
      {Key? key,
      required this.height,
      required this.orderCount,
      this.loading = false})
      : super(key: key);

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
        children: [
          Center(
            child: TitleSubTitle(
              loading: loading,
              title: orderCount,
              subtitle: "Orders left",
              isWhite: true,
            ),
          ),
        ],
      ),
    );
  }
}
