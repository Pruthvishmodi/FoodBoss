import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/app_navigation_bar.dart';
import 'package:seller_app/widgets/drawer/drawer_main.dart';

class PageLayout extends StatelessWidget {
  final Widget child;
  final bool bottombar;
  final int? selectedIndex;
  final bool? backArrow;
  final bool? appBar;
  final Color? color;
  final String? title;
  final TabBar? tabBar;
  final VoidCallback appbarFunc;
  const PageLayout(
      {Key? key,
      required this.child,
      required this.bottombar,
      this.backArrow = true,
      required this.appbarFunc,
      this.appBar = true,
      this.title = "",
      this.selectedIndex = 0,
      this.color,
      this.tabBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      backgroundColor: ThemeConfig.FORM_COLOR,
      appBar: appBar!
          ? AppBar(
              foregroundColor: ThemeConfig.WHITE_COLOR,
              title: Text(
                title!,
                style: TextStyle(color: ThemeConfig.WHITE_COLOR),
              ),
              bottom: tabBar != null
                  ? PreferredSize(
                      preferredSize: tabBar!.preferredSize,
                      child: ColoredBox(
                        color: ThemeConfig.PRIMARY_COLOR,
                        child: tabBar!,
                      ),
                    )
                  : null,
              backgroundColor: color,
              elevation: 0,
            )
          : null,
      // appBar!
      //     ? PreferredSize(
      //         preferredSize: const Size.fromHeight(100.00),
      //         child: AppNavBar(
      //           color: color,
      //           tabBar: tabBar,
      //           title: Text(title!),
      //         ),
      //       )
      //     : null,
      body: child,
      floatingActionButton: bottombar
          ? FloatingActionButton(
              child: const Icon(
                Icons.add,
                color: ThemeConfig.MAIN_TEXT_COLOR,
              ),
              onPressed: appbarFunc,
              backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
            )
          : null,
      drawer: const DrawerMain(),
    );
  }
}
