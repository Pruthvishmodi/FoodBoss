import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Screens/StoreListScreen/store_list_screen.dart';
import 'package:customer_app/Widgets/Input/text_input_widget.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailabeKhataStoreScreen extends StatelessWidget {
  const AvailabeKhataStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const MainLabelText(text: 'Available Stores'),
        backgroundColor: ThemeConfig.whiteColor,
        foregroundColor: ThemeConfig.mainTextColor,
        // centerTitle: true,
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   backgroundColor: ThemeConfig.secondaryColor,
      //   label: const LabelText(
      //     text: 'Request New Store',
      //     isWhite: true,
      //   ),
      //   icon: const Icon(
      //     Icons.currency_rupee_rounded,
      //     color: ThemeConfig.whiteColor,
      //   ),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: ThemeConfig.whiteColor,
        height: MediaQuery.of(context).size.height,
        padding: ThemeConfig.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SB.large(),
            // const MainLabelText(text: 'Your khata details'),
            SB.large(),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    // Get.toNamed('/store-products-screen');
                  },
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/123.jpg',
                                    ),
                                    fit: BoxFit.fill,
                                  )),
                              height: 50,

                              // child: Image.asset(
                              //   "assets/images/123.jpg",
                              //   fit: BoxFit.fill,
                              // ),
                            )
                            // Container(
                            //   decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //           image: AssetImage("assets/images/123.jpg"),
                            //           fit: BoxFit.fill),
                            //       borderRadius:
                            //           BorderRadius.circular(ThemeConfig.radiusMax)),
                            // ),
                            ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MainLabelText(
                                  text: "Laxmi Kirana Store",
                                  isBold: true,
                                ),
                                SB.small(),
                                // Row(
                                //   children: const [
                                //     Icon(
                                //       Icons.star,
                                //       size: 17,
                                //       color: ThemeConfig.primaryColor,
                                //     ),
                                //     LabelText(
                                //       text: ' 3.2 (500+)  2Km Away',
                                //       // isBold: true,
                                //     )
                                //   ],
                                // ),
                                // SB.small(),
                                // const LabelText(text: "Milk, Dahi, Chaas"),
                                const DescriptionText(text: 'Gandhinagar')
                              ],
                            )),
                        // Expanded(
                        //     child: Container(
                        //   child: const LabelText(text: '\u{20B9} 1700'),
                        // ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
