import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:flutter/material.dart';

class ShareButtonWidget extends StatelessWidget {
  final VoidCallback? op;
  const ShareButtonWidget({
    Key? key,
    this.op,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: op,
      child: Container(
        padding: const EdgeInsets.all(5),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(30),
        //   border: Border.all(width: 0.1),
        // ),
        child: const Icon(
          Icons.share,
          color: ThemeConfig.mainTextColor,
          size: 20,
        ),
      ),
    );
  }
}
