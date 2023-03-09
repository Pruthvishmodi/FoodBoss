import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:dotted_border/dotted_border.dart';
class PhotoSection extends StatelessWidget {

  final String? img;
  
  const PhotoSection({
    Key? key,
    required this.size, this.img,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return img != null? 
     CircleAvatar(
       radius: 75,
       backgroundImage: AssetImage(img!),
     )
    : DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      dashPattern: const [10, 5, 10, 5, 10, 5],
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeConfig.FORM_COLOR,
        ),
        height: size.height * 0.2,
        child: Center(
          child: Column(
            children: const [
              Icon(
                Icons.image,
                size: 90,
                color: Colors.grey,
              ),
              SubText(text:  'Add Cover Photo', color: Colors.black,size: ThemeConfig.SUB_TITLE_SIZE),
              SubText(
                  text: '(upto 12 Mb)',color: Colors.grey, size: ThemeConfig.NOTIFICATION_SIZE),
            ],
          ),
        ),
      ),
    );
  }
}