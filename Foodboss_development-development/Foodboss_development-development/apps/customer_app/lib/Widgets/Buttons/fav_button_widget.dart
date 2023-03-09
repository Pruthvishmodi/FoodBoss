import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FavButtonWidget extends StatelessWidget {
  bool? isSelected = false;
  final Function()? op;
  FavButtonWidget({ this.isSelected, this.op});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => op!(),
      child: Container(
        padding: EdgeInsets.all(5),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(30),
        //   border: Border.all(width: 0.1),
        // ),
        child: Icon(
          isSelected! ? Icons.favorite_sharp : Icons.favorite_border_outlined,
          color: ThemeConfig.redColor,
          size: 20,
        ),
      ),
    );
  }
}
