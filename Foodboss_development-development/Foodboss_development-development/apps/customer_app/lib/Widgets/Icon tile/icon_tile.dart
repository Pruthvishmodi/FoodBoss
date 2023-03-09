import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:flutter/material.dart';

class iconTile extends StatelessWidget {
  
  final IconData icon;
  final Color color;

  const iconTile({Key? key, required this.icon, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                ThemeConfig.radiusMin),
            color: ThemeConfig.greyColor),
        child: Icon(
          icon,
          color: color,
          size: 20,
        ));
  }
}