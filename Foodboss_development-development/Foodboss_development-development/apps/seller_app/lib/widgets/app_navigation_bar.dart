import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class AppNavBar extends StatelessWidget {
  // final IconData icons;
  // final VoidCallback op;
  final Widget? title;
  final Color? color;
  final TabBar? tabBar;
  final List<Widget>? actions;
  const AppNavBar(
      {Key? key,
      // required this.icons,
      // required this.op,
      this.title,
      this.actions,
      this.color,
      this.tabBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //   icon: Icon(icons),
      //   onPressed: op,
      // ),
      title: title,
      actions: actions,
      elevation: 0.00,
      backgroundColor: color!,
      bottom: tabBar != null
          ? PreferredSize(
              preferredSize: tabBar!.preferredSize,
              child: ColoredBox(
                color: ThemeConfig.PRIMARY_COLOR,
                child: tabBar!,
              ),
            )
          : null,
    );
  }
}
