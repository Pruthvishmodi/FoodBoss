import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final ImageProvider image;
  final String aspect;
  const CustomBanner({Key? key, required this.image, required this.aspect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.all(5),
              child: Image(
                image: image,
                width: 150,
                fit: BoxFit.fill,
              ));
        },
      ),
    );
  }
}
