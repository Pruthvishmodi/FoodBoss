import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class RoutesForDrawer extends StatelessWidget {
  final String url;
  final String title;
  final IconData icon;
  final int? badgeCount;
  RoutesForDrawer({
    Key? key,
    required this.url,
    required this.title,
    required this.icon,
    this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Get.toNamed(url);
      },
      trailing: badgeCount != null
          ? Container(
              decoration: const BoxDecoration(
                color: ThemeConfig.PRIMARY_COLOR,
                shape: BoxShape.circle,
              ),
              height: 40,
              padding: const EdgeInsets.all(10),
              child: Text(
                badgeCount.toString(),
                style: TextStyle(color: ThemeConfig.WHITE_COLOR),
              ),
            )
          : null,
    );
  }
}
