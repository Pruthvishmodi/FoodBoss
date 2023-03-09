import 'package:flutter/material.dart';

import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/TextFieldContainer.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:seller_app/widgets/main_label.dart';


class DeliveryBoyDetails extends StatelessWidget {
  // final String name;
  // final String address;
  // final double phoneNumber;

  const DeliveryBoyDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ThemeConfig.PRIMARY_COLOR, elevation: 0,
       title: Text("Delivery Boy Details ",style: TextStyle(color: Colors.black),),
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
                                  Desc(
                                      descString:
                                          "Time Slot: 10 Am - 04 Pm"),
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
                    width: MediaQuery.of(context).size.width*.6,
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
  }
}
