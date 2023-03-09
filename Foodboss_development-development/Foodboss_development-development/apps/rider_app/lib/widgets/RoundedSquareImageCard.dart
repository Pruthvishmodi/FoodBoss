import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class RoundedSquareImageCard extends StatelessWidget {
  final String? image;
  final void Function()? onTap;
  const RoundedSquareImageCard({
    Key? key,
    this.image,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
          color: ThemeConfig.WHITE_COLOR,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 150,
        width: 150,
        child: image != null
            ? Image(
                image: AssetImage(image!),
                fit: BoxFit.fill,
              )
            : const Center(
                child: Icon(Icons.add),
              ),
      ),
    );
  }
}
