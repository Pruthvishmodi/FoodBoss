import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:rider_app/widgets/customer%20details%20card/customer_details_card.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';

class KhataManagement extends StatelessWidget {
  const KhataManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 550),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: const [
                      MainLabelText(titleString: "Total - Rs. 16000"),
                      SizedBox(
                        height: 10,
                      ),
                      CustomerCard(
                        name: "Jay Soni",
                        phone: "+91-8238010502",
                        amount: "2000",
                      ),
                      CustomerCard(
                        name: "Jay Soni",
                        phone: "+91-8238010502",
                        amount: "2000",
                      ),
                      CustomerCard(
                        name: "Jay Soni",
                        phone: "+91-8238010502",
                        amount: "2000",
                      ),
                      CustomerCard(
                        name: "Jay Soni",
                        phone: "+91-8238010502",
                        amount: "2000",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(bottom: 10,right: 10,
                    child: GestureDetector(onTap: (){  Get.toNamed("/khata-management/request");},
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: ThemeConfig.FORM_COLOR),
                                      height: 50,
                                      width: 100,
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: ThemeConfig.DISTRUCTIVE_COLOR),
                            width: 50,
                            height: 50,
                            // color: ThemeConfig.DISTRUCTIVE_COLOR,
                            child: Icon(
                                  Icons.notification_important,
                                  color: ThemeConfig.MAIN_TEXT_COLOR,
                                ),
                          ),
                        ),Expanded(flex: 1 ,child: Center(child: LabelText(titleString: '1')))
                      ],
                                      ),
                                    ),
                    ))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
      //   onPressed: () {
      //     Get.toNamed("/khata-management/request");
      //   },
      //   child: const Icon(
      //     Icons.notification_important,
      //     color: ThemeConfig.MAIN_TEXT_COLOR,
      //   ),
      // ),
    );
  }
}

                