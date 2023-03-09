import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/search_controller.dart';
import 'package:customer_app/Models/network_call_models.dart/search_suggestion_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchScreenController searchScreenController =
        Get.put(SearchScreenController());

    Widget _customDropDownPrograms(BuildContext context, Suggestion? item) {
      return Container(
          child: (item == null)
              ? const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text("Search Client",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: ThemeConfig.mainLabelSize,
                          color: ThemeConfig.mainTextColor)),
                )
              : ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    '${item.name}',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13.5, color: Colors.black),
                  )));
    }

    Widget _customPopupItemBuilder(
        BuildContext context, Suggestion item, bool isSelected) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(5),
                color: ThemeConfig.whiteColor,
              ),
        child: ListTile(
          title: Text('${item.name}',
              style: const TextStyle(
                fontSize: 14,
                color: ThemeConfig.mainTextColor,
              )),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DropdownSearch<Suggestion>(
          mode: Mode.MENU,
          popupBackgroundColor: ThemeConfig.whiteColor,
          showSearchBox: true,
          isFilteredOnline: true,
          dropdownButtonProps: const IconButtonProps(
              icon: Icon(
            Icons.arrow_drop_down,
            color: ThemeConfig.mainTextColor,
            size: 25,
          )),
          popupShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ThemeConfig.radiusMin)),
          dropdownSearchDecoration: InputDecoration(
            // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none,gapPadding: 0),
            hintText: 'Search',
            hintStyle:
                const TextStyle(color: ThemeConfig.mainTextColor, fontSize: 25),
            prefixIcon: const Icon(
              Icons.search,
              color: ThemeConfig.mainTextColor,
            ),
            isCollapsed: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
                borderSide: BorderSide.none,
                gapPadding: 0),
            isDense: true,
            fillColor: ThemeConfig.primaryColorLite,
            filled: true,
          ),
          dropdownBuilder: _customDropDownPrograms,
          popupItemBuilder: _customPopupItemBuilder,
          onChanged: (v) {
            // searchScreenController.getSearchSuggestions(v);
          },
          onFind: (v) async {
            // await searchScreenController.getClients();
            return searchScreenController.getSearchSuggestions(v!);
          },
          showClearButton: true,
          clearButtonProps: const IconButtonProps(
              icon: Icon(Icons.clear, size: 17, color: Colors.black)),
        ),
      ],
    );
  }
}
