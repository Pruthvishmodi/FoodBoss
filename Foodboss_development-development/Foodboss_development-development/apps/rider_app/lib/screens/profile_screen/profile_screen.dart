import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/controller/business_controller/auth/login_controller.dart';
import 'package:rider_app/controller/business_controller/auth/profile_controller.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:rider_app/widgets/text_widgets/title_widget.dart';
import 'package:shared_widgets/shared_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; 

    ProfileController controller = Get.put(ProfileController(), permanent: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        elevation: 0,
        title: Text(
          "Delivery Boy Details ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 550),
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                color: Colors.redAccent,
                              ),
                              child: const Image(
                                image: AssetImage('assets/images/intro-01.png'),
                              )),
                          const SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  MainLabelText(titleString: "Jay Soni"),
                                  SizedBox(height: 10),
                                  Desc(descString: "+91-8787878787"),
                                  SizedBox(height: 5),
                                  Desc(descString: "Time Slot: 10 Am - 04 Pm"),
                                ]),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                Row(children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        LabelText(titleString: "Unique ID"),
                        SizedBox(height: 10.00),
                        LabelText(titleString: "Vehicle Number"),
                        SizedBox(height: 10.00),
                        LabelText(titleString: "Delivery Area"),
                        SizedBox(height: 10.00),
                        LabelText(titleString: "Delivery Radius"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Desc(descString: "#FBR00256"),
                        SizedBox(height: 10.00),
                        Desc(descString: "DL 5S TC 0657"),
                        SizedBox(height: 10.00),
                        Desc(descString: "South Delhi"),
                        SizedBox(height: 10.00),
                        Desc(descString: "10 Kilomeers"),
                      ],
                    ),
                  ),
                ]),
                // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: const [
                //     LabelText(titleString: "Unique Id"),
                //     Desc(descString: "#FBR00256")
                //   ],
                // ),
                // const SizedBox(height: 10),
                // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: const [
                //     LabelText(titleString: "Vehicle Number"),
                //     Desc(descString: "DL 5S TC 0657")
                //   ],
                // ),
                // const SizedBox(height: 10),
                // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: const [
                //     LabelText(titleString: "Delivery Area"),
                //     Desc(descString: "South Delhi")
                //   ],
                // ),
                // const SizedBox(height: 10),
                // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: const [
                //     LabelText(titleString: "Delivery Radius"),
                //     Desc(descString: "10 Kilometers")
                //   ],
                // ),

                const SizedBox(height: 30),

                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .6,
                    child: PrimaryButton(
                      text: "Remove Delivery Boy",
                      op: () {},
                      type: "filled",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

    // Container(
    //   padding: EdgeInsets.only(
    //       top: size.height * 0.03,
    //       left: size.height * 0.03,
    //       right: size.height * 0.03),
    //   // height: size.height > 300 ? size.height * 0.5 : size.height,
    //   child: Center(
    //     child: Container(
    //       constraints: const BoxConstraints(maxWidth: 550.00),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               const CircleAvatar(
    //                                       radius: 40,
    //                                       foregroundImage: AssetImage(
    //                                           'assets/images/profile_pic.jpg'),
    //                                     ),
    //               // Container(
    //               //     width: 100.0,
    //               //     height: 100.0,
    //               //     decoration: const BoxDecoration(
    //               //       borderRadius: BorderRadius.all(Radius.circular(50.0)),
    //               //       color: Colors.redAccent,
    //               //     ),
    //               //     child: const Image(
    //               //       image: AssetImage('assets/images/profile_pic.jpg'),
    //               //     )),
    //               SizedBox(
    //                 width: size.height * 0.03,
    //               ),
    //               Expanded(
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     const Heading(
    //                         'Lakshmi Shop', ThemeConfig.MAIN_TEXT_COLOR),
    //                    const Text(
    //                       'Jay_0020',
    //                       maxLines: 3,
    //                       style: TextStyle(
    //                           color: ThemeConfig.MAIN_TEXT_COLOR,
    //                           fontSize: ThemeConfig.NOTIFICATION_SIZE),
    //                     ),

    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: const [
    //                         SubText(
    //                             text: '+91 9314025585',
    //                             color: ThemeConfig.MAIN_TEXT_COLOR,
    //                             size: ThemeConfig.SUB_TITLE_SIZE),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           const Text(
    //                       'B-706 Sarthak heavens Near Raysan petrol pump,Raysan ,Gandhinagar',
    //                       maxLines: 3,
    //                       style: TextStyle(
    //                           color: ThemeConfig.MAIN_TEXT_COLOR,
    //                           fontSize: ThemeConfig.NOTIFICATION_SIZE),
    //                     ),

    //           const Padding(
    //             padding:  EdgeInsets.symmetric(vertical: 10),
    //             child: Divider(),
    //           ),
    //          const SubText(
    //             text: 'Store Timing',
    //             color: ThemeConfig.MAIN_TEXT_COLOR,
    //             size: ThemeConfig.SUB_TITLE_SIZE),
    //         SizedBox(
    //           height: size.height * 0.02,
    //         ),
    //           Wrap(
    //   spacing: 6.0,
    //   runSpacing: 6.0,
    //   children: days.map((e) => GestureDetector(
    //   onTap: () {

    //   },
    //   child:  Container(
    //     margin: const EdgeInsets.symmetric(horizontal: 5),
    //     child: Chip(
    //       label: SubText(
    //           text: e,
    //           color: ThemeConfig.PRIMARY_COLOR,
    //           size: ThemeConfig.NOTIFICATION_SIZE),
    //       backgroundColor:  ThemeConfig.WHITE_COLOR,
    //       side: const BorderSide(color:  ThemeConfig.PRIMARY_COLOR,width: 1),
    //       padding: const EdgeInsets.all(5),
    //     ),
    //   ),
    // )).toList(),
    // ),
    // const SizedBox(height: 20,),
    //      const SubText(
    //             text: 'Minimum Order Price: \u{20B9} 300',
    //             color: ThemeConfig.MAIN_TEXT_COLOR,
    //             size: ThemeConfig.SUB_TITLE_SIZE),
    //         SizedBox(
    //           height: size.height * 0.02,
    //         ),

    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
