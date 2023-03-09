import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final Function(String)? onChange;
  const SearchBox({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: ThemeConfig.mainTextColor, width: .2))),
      child: TextField(
        autofocus: false,
        cursorColor: ThemeConfig.primaryColor,
        onTap: () {},
        onChanged: onChange,
        decoration: InputDecoration(
          filled: true,
          fillColor: ThemeConfig.whiteColor,
          contentPadding: const EdgeInsets.only(top: 7, bottom: 7, left: 20),
          hintText: 'Search',
          hintStyle: const TextStyle(color: ThemeConfig.descriptionColor),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: ThemeConfig.mainTextColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ThemeConfig.whiteColor),
            borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
            borderSide:
                const BorderSide(color: ThemeConfig.whiteColor, width: 0),
          ),
          border: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
            borderSide:
                const BorderSide(color: ThemeConfig.whiteColor, width: 0),
          ),
        ),
      ),
    );
  }
}
