import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/title_widget.dart';

class NoCustomerAdded extends StatelessWidget {
    const NoCustomerAdded({ Key? key, required this.button, }) : super(key: key);

  // final Future<void> Function() function;
  final VoidCallback button;
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Image(
              width: 200,
              image:  AssetImage( 'assets/images/add-group.png'),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: 350,
              child: Row(
                children: const [
                  Expanded(
                    child: TitleText(
                      titleString: "No Customer added yet"
                      // style: TextStyle(
                      //   color: ThemeConfig.MAIN_TEXT_COLOR,
                      //   fontSize: 30,
                      // ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            // const SizedBox(
            //   width: 300,
            //   child: Desc(
            //     descString:
            //         "It will take few seconds to add products from our global store",
            //     // style: TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR, fontSize: 15),
            //   ),
            // ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: 200,
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      text: "Add Customer",
                      op: (){
                        button();
                        // Get.back();
                      },
                      type: "filled",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     const Desc(
            //       descString: "Already bought plan?",
            //     ),
            //     const SizedBox(
            //       width: 2,
            //     ),
            //     GestureDetector(
            //       onTap: () async {
            //        await function();
            //       },
            //       child: const LabelText(
            //         titleString: "Refresh",
            //       ),
            //     ),
            //   ],
            // )
            // NoProductsButton(
            //   size: size,
            //   text: 'Global Store',
            // )
          ],
        ),
      ),
    );
  }
}