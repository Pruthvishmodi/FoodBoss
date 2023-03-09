import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/search-screen');
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(top: 7, bottom: 7, left: 20),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: ThemeConfig.greyColor,
              blurRadius: 10.0,
              spreadRadius: 7.0,
            )
          ],
          color: ThemeConfig.whiteColor,
          borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
        ),
        child: Row(
          children: const [
            Icon(
              Icons.search,
              color: ThemeConfig.descriptionColor,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Search',
              style:
                  TextStyle(fontSize: 15, color: ThemeConfig.descriptionColor),
            )
          ],
        ),
      ),
    );
  }
}
