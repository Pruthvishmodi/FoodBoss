import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/models/store/mystore_item.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class MyStoreCard extends StatelessWidget {
  final String img;
  final String id;
  final String name;
  final String stock;
  final String price;
  final String discount;
  final bool avaibility;
  final VoidCallback op;
  final ItemMyStoreData item;
  final bool? loading;
  const MyStoreCard({
    Key? key,
    this.loading = false,
    required this.img,
    required this.id,
    required this.name,
    required this.stock,
    required this.price,
    required this.op,
    required this.discount,
    required this.item,
    required this.avaibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (loading == false) {
          Get.toNamed("/store-product/individual", arguments: [item, id]);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
            color: ThemeConfig.WHITE_COLOR,
            border: Border.all(
                width: 1,
                color: int.parse(stock) <= 10
                    ? Colors.red
                    : ThemeConfig.WHITE_COLOR)),
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
                    color: ThemeConfig.FORM_COLOR,
                  ),

                  // padding: const EdgeInsets.all(10),
                  child: loading == false
                      ? Image(
                          image: NetworkImage(img),
                          width: 100,
                          height: 100,
                        )
                      : SizedBox(width: 100, height: 100),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      loading == false
                          ? LabelText(titleString: name)
                          : Container(
                              width: 150,
                              height: 20,
                              color: ThemeConfig.FORM_COLOR,
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      loading == false
                          ? Row(
                              children: [
                                Desc(descString: '$stock Items'),
                                SizedBox(
                                  width: 5,
                                ),
                                int.parse(stock) > 10
                                    ? Container()
                                    : int.parse(stock) == 0
                                        ? Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.red,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            padding: EdgeInsets.all(2),
                                            child: const Text(
                                              'Out of Stock',
                                              style: TextStyle(
                                                  color:
                                                      ThemeConfig.ERROR_COLOR,
                                                  fontSize: ThemeConfig
                                                      .DESCRIPTION_SIZE),
                                            ))
                                        : Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.orange,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            padding: EdgeInsets.all(2),
                                            child: const Text(
                                              'Low Stock',
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: ThemeConfig
                                                      .DESCRIPTION_SIZE),
                                            )),
                              ],
                            )
                          : Container(
                              height: 20,
                              width: 80,
                              color: ThemeConfig.FORM_COLOR,
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      loading == false
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    LabelText(
                                      titleString: '$price',
                                      style: 'i',
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    LabelText(
                                        titleString: '\u{20B9} $discount'),
                                  ],
                                ),
                                Switch(
                                  value: avaibility,
                                  onChanged: (val) {},
                                  activeColor: ThemeConfig.PRIMARY_COLOR,
                                )
                              ],
                            )
                          : Container(
                              height: 20,
                              width: 100,
                              color: ThemeConfig.FORM_COLOR,
                            ),
                    ],
                  ),
                ),
                loading == false
                    ? GestureDetector(
                        onTap: () {
                          print('tapped');
                          op();
                        },
                        child: const Icon(Icons.edit,
                            color: ThemeConfig.DISTRUCTIVE_COLOR))
                    : SizedBox(width: 0),
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
