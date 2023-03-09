import 'package:flutter/material.dart';

import 'package:rider_app/widgets/TextFieldContainer.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';

class IndividaulCustomerDetails extends StatelessWidget {
  const IndividaulCustomerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(elevation: 0,
        title: const Text(
          'My Customer',
          style: TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR),
        ),
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
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
                                  MainLabelText(titleString: "Jay Sony"),
                                  SizedBox(height: 10),
                                  Desc(descString: "+91-8787878787"),
                                  SizedBox(height: 5),
                                  Desc(
                                      descString:
                                          "B-605,Ganesh Glory 11, Gota, Ahmedabad"),
                                ]),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
             
            
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: TextFieldContainer(
                        color: ThemeConfig.WHITE_COLOR,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            style: const TextStyle(
                                color: ThemeConfig.MAIN_TEXT_COLOR),
                            decoration: const InputDecoration(
                              hintText: "Amount",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 4,
                      child: PrimaryButton(
                          op: () {}, text: "Paid", type: "filled"),
                    ),
                    
                  ],
                ),
                
                const SizedBox(height: 10),
                SizedBox(
                    height: 50,
                    width: size.width,
                    child: Expanded(
                        child: PrimaryButton(
                            op: () {}, text: "Free", type: "filled"))),
                            const SizedBox(height: 10,),
              ],
            ),
          ),
        )),
      ),
     
    );
  }
}
