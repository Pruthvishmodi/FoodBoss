import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final String pageRoute;
  final double? width;
  final List<String>? arguments; 
  const CustomButton(this.text, this.color, {Key? key, required this.pageRoute, this.width, this.arguments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(pageRoute,arguments: arguments);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 50,
          width: width ?? MediaQuery.of(context).size.width,
          // child: Text(text,style: const TextStyle(color: Colors.white),
          color: color,
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: ThemeConfig.SUB_TITLE_SIZE),
          )),
        ),
      ),
    );
  }
}
