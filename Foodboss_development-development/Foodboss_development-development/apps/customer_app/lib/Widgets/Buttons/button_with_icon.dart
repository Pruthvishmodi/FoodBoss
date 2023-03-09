import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:flutter/material.dart';

class ButtonWithIconsWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback op;
  const ButtonWithIconsWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.op,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => op,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: ThemeConfig.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LabelText(
              text: text,
              isWhite: true,
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              icon,
              color: ThemeConfig.whiteColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}