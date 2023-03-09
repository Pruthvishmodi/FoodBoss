import 'package:flutter/material.dart';

import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/TextFieldContainer.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:seller_app/widgets/main_label.dart';

class KhataCustomerDetails extends StatelessWidget {
  // final String name;
  // final String address;
  // final double phoneNumber;

  const KhataCustomerDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              // width: 150.0,
                              // height: 150.0,

                              child: const Image(
                            image: AssetImage('assets/images/intro-01.png'),
                            width: 100,
                            height: 100,
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
                                          "11, Sarthak heavens ,near zundal Gandhinagar"),
                                ]),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                // const MainLabelText(titleString: "KHATA PERIOD:-"),
                // const SizedBox(
                //   height: 3,
                // ),
                Row(
                  children: [
                    const LabelText(titleString: "KHATA PERIOD:"),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child:
                              const LabelText(titleString: 'From: 02/02/2020'),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const LabelText(titleString: 'To: 02/03/2020'),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const DetailRow(
                  value: '5,500',
                  title: 'Total Khata Amount',
                ),
                const DetailRow(
                  value: '3,300',
                  title: 'Total Paid Amount',
                ),
                const DetailRow(
                  value: '2,000',
                  title: 'Last Paid Amount',
                ),
                const DetailRow(
                  value: '2,200',
                  title: 'Total Pending Amount',
                ),
                const DetailRow(
                  value: '15/02/2020',
                  title: 'Last Paid Date',
                ),
                const SizedBox(
                  height: 20,
                ),

                MainLabelText(titleString: "Previous Payments:"),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 110,
                  child: ListView(
                    children: const [
                      DetailRow(
                        value: '500',
                        title: '15/02/2020',
                      ),
                      DetailRow(
                        value: '500',
                        title: '15/02/2020',
                      ),
                      DetailRow(
                        value: '500',
                        title: '15/02/2020',
                      ),
                      DetailRow(
                        value: '500',
                        title: '15/02/2020',
                      ),
                      DetailRow(
                        value: '500',
                        title: '15/02/2020',
                      ),
                    ],
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

class DetailRow extends StatelessWidget {
  final String title;
  final String value;
  const DetailRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: LabelText(titleString: title),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Desc(descString: value),
                )),
          ],
        ),
      ),
    );
  }
}
