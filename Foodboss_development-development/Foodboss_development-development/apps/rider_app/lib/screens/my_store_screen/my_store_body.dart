import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/screens/my_store_screen/demo_my_store.dart';
import 'package:rider_app/screens/my_store_screen/my_store_card.dart';
import 'package:rider_app/screens/my_store_screen/my_store_modal.dart';
import 'package:rider_app/screens/product_store_screen/product_store_screen.dart';
import 'package:rider_app/shimmers/card_shimmer.dart';
import 'package:rider_app/shimmers/my_store_shimmer.dart';
import 'package:rider_app/widgets/Heading.dart';
import 'package:rider_app/widgets/RoundedInputField.dart';
import 'package:rider_app/widgets/SmallRoundedInputField.dart';
import 'package:rider_app/widgets/TextFieldContainer.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/form_input.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:shared_widgets/shared_widgets.dart';

class MyStoreBody extends StatelessWidget {
  const MyStoreBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: democategoryList
          .map((e) => MyFragement(productList: e.products!))
          .toList(),
      // children: [
      //   MyFragement(
      //     productList: democategoryList[0].products,
      //   ),
      //   PendingOrd(
      //     floating: false,
      //     type: "pending",
      //   ),
      //   PendingOrd(
      //     floating: false,
      //     type: "pending",
      //   ),
      //   PendingOrd(
      //     floating: false,
      //     type: "pending",
      //   ),
      //   PendingOrd(
      //     floating: false,
      //     type: "pending",
      //   ),
      //   PendingOrd(
      //     floating: false,
      //     type: "pending",
      //   ),
      //   PendingOrd(
      //     floating: false,
      //     type: "pending",
      //   ),
      // ],
    );
  }
}

class MyFragement extends StatelessWidget {
  final List<Products> productList;
  const MyFragement({Key? key, required this.productList}) : super(key: key);

  openBottomSheet(Size size, int index) {
    Get.bottomSheet(Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: ThemeConfig.WHITE_COLOR,
          ),
          padding: EdgeInsets.all(size.width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading(
                  productList[index].productName, ThemeConfig.MAIN_TEXT_COLOR),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 2,
                    child: LabelText(titleString: 'Stock'),
                  ),
                  Expanded(
                      flex: 1,
                      child: SmallRoundedInputField(
                          hintText:
                              productList[index].quantity.substring(0, 4))),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 2,
                    child: LabelText(titleString: 'Price'),
                  ),
                  Expanded(
                      flex: 1,
                      child: SmallRoundedInputField(
                          hintText: productList[index].price)),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      op: () {},
                      text: 'Save',
                      type: "filled",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.03),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded( 
                child: SmallRoundedInputField(
                  hintText: "Search",
                  tailingIcon: Icons.search,
                  textType: TextInputType.name,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) => MyStoreCard(
                img: productList[index].imageLocation,
                name: productList[index].productName,
                stock: productList[index].quantity,
                price: productList[index].price,
                op: () {
                  openBottomSheet(size, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
