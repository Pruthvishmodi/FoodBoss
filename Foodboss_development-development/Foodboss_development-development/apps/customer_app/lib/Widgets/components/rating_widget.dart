import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:flutter/material.dart';

class StarRatingWidget extends Stars {
  StarRatingWidget({Key? key, required double value})
      : super(
            key: key,
            value: value.toInt(),
            isDouble: value.toInt() != value,
            halfStar: const Icon(
              Icons.star_half,
              color: ThemeConfig.primaryColor,
              size: 15,
            ),
            filledStars: const Icon(
              Icons.star,
              size: 15,
              color: ThemeConfig.primaryColor,
            ),
            unfilledStarts: const Icon(
              Icons.star_border,
              size: 15,
              color: ThemeConfig.primaryColor,
            ));
}

class Stars extends StatelessWidget {
  final int value;
  final Widget filledStars;
  final Widget unfilledStarts;
  final Widget halfStar;
  final bool isDouble;
  const Stars(
      {Key? key,
      required this.value,
      required this.filledStars,
      required this.unfilledStarts,
      required this.isDouble,
      required this.halfStar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Row(
      children: List.generate(5, (index) {
        if (index < value) {
          return filledStars;
        } else {
          if (isDouble && count == 0) {
            count++;
            return halfStar;
          } else {
            return unfilledStarts;
          }
        }
      }),
    );
  }
}
