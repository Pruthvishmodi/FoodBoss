import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:flutter/material.dart';

class SquareChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function ontap;
  const SquareChip({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap(),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: LabelText(
            text: text,
            isWhite: isSelected ? true : false,
          ),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected
                ? ThemeConfig.secondaryColor
                : ThemeConfig.whiteColor,
            border: Border.all(width: 1, color: ThemeConfig.secondaryColor),
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}