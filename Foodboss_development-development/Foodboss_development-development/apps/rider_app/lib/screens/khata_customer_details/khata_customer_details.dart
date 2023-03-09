import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Khata User",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.edit,
          color: ThemeConfig.WHITE_COLOR,
        ),
        onPressed: () {
          Get.toNamed("/khata-management/request/individual");
        },
        backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
      ),
      body: SingleChildScrollView(
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
                        const CircleAvatar(
                          radius: 50,
                          foregroundImage:
                              AssetImage('assets/images/profile_pic.jpg'),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainLabelText(titleString: "Jay Soni"),
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () => launch("tel://8780508717"),
                                  child: Desc(descString: "+91-8787878787"),
                                ),
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
              const MainLabelText(titleString: "KHATA PERIOD"),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child:
                            const LabelText(titleString: 'From - 02/02/2020'),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const LabelText(titleString: 'To - 02/03/2020'),
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
                value: '2,200',
                title: 'Total Pending Amount',
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
                value: '15/02/2020',
                title: 'Last Paid Date',
              ),
              const SizedBox(
                height: 20,
              ),

              const MainLabelText(titleString: "Previous Payments:"),
              const SizedBox(
                height: 5,
              ),
              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.monetization_on_outlined,
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  title: LabelText(titleString: "15/02/2020"),
                  trailing: Desc(descString: "Rs. 500"),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.monetization_on_outlined,
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  title: LabelText(titleString: "15/02/2020"),
                  trailing: Desc(descString: "Rs. 500"),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.monetization_on_outlined,
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  title: LabelText(titleString: "15/02/2020"),
                  trailing: Desc(descString: "Rs. 500"),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.monetization_on_outlined,
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  title: LabelText(titleString: "15/02/2020"),
                  trailing: Desc(descString: "Rs. 500"),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.monetization_on_outlined,
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  title: LabelText(titleString: "15/02/2020"),
                  trailing: Desc(descString: "Rs. 500"),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.monetization_on_outlined,
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  title: LabelText(titleString: "15/02/2020"),
                  trailing: Desc(descString: "Rs. 500"),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.monetization_on_outlined,
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  title: LabelText(titleString: "15/02/2020"),
                  trailing: Desc(descString: "Rs. 500"),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.monetization_on_outlined,
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  title: LabelText(titleString: "15/02/2020"),
                  trailing: Desc(descString: "Rs. 500"),
                ),
              )
            ],
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
            const SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Desc(descString: value),
                )),
          ],
        ),
      ),
    );
  }
}
