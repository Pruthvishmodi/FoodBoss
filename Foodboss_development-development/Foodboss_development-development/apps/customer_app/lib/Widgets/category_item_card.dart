import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Screens/ProductScreen/product_screen.dart';
import 'package:customer_app/Screens/ProfileScreen/my_orders_page.dart';

import 'package:customer_app/Screens/StoreListScreen/store_list_screen.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChooseStoreList()),
        );
      },
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
                  border:
                      Border.all(color: ThemeConfig.borderColor, width: .5)),
              child: Image.asset(
                'assets/images/abcd.png',
              )),
          const SizedBox(
            height: 5,
          ),
          const Expanded(
            child: LabelText(
              text: 'vegetales & fruits',
              alignment: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
