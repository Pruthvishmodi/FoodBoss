import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder? border;
const ShimmerWidget.rectangular({

this.width, required this.height, this.border, });

  // const ShimmerWidget({Key? key, required this.width, required this.height, required this.border}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ThemeConfig.OUTLINE_COLOR,
      highlightColor: ThemeConfig.WHITE_COLOR,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(shape: border!, color: Colors.grey[400]),
        
      ),
    );
  }
}