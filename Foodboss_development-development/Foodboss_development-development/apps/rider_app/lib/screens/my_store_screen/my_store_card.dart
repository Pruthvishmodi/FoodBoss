import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';

class MyStoreCard extends StatelessWidget {
  final String img;
  final String name;
  final String stock;
  final String price;
  final VoidCallback op;
  const MyStoreCard({
    Key? key,
    required this.img,
    required this.name,
    required this.stock,
    required this.price,
    required this.op,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/store-product/individual");
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.00),
          color: ThemeConfig.WHITE_COLOR,
        ),
        margin: const EdgeInsets.only(
          top: 10.00,
        ),
        padding: const EdgeInsets.all(10.00),
        child: Column(
          children: [


            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           LabelText(titleString: "\u{20B9} $price"),
            //           // Desc(descString: phone),
            //         ],
            //       ),
            //     ),
            //     Expanded(
            //       child: Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           GestureDetector(
            //               onTap: () {
            //                 op();
            //               },
            //               child: Icon(Icons.edit,
            //                   color: ThemeConfig.DISTRUCTIVE_COLOR)),
            //           // Desc(descString: phone),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 10),
            // const Divider(),
            // const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.00),
                    // color: ThemeConfig.FORM_COLOR,
                  ),
                  // padding: const EdgeInsets.all(10),
                  child: Image(
                    image: AssetImage(img),
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainLabelText(titleString: name),
                      Desc(descString: stock),
                      Row(
                        children: [
                          LabelText(titleString: '\u{20B9} 100',style: 'i',),SizedBox(width: 5,),
                          LabelText(titleString: '\u{20B9} $price'),
                        ],
                      ),
                    ],
                  ),
                ),
                 GestureDetector(
                          onTap: () {
                            op();
                          },
                          child: Icon(Icons.edit,
                              color: ThemeConfig.DISTRUCTIVE_COLOR)),
              ],
            ),
            // // SizedBox(
            // //   height: 20,
            // // ),
          ],
        ),
      ),
    );
  }
}
