import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/title_text.dart';
import 'package:flutter/material.dart';
import '../../Widgets/Text widgets/label_text.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.whiteColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: ThemeConfig.mainTextColor),
        backgroundColor: ThemeConfig.whiteColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: ThemeConfig.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SB.large(),
                const TitleText(text: 'My orders'),
                const SizedBox(
                  height: 8,
                ),
                const LabelText(text: 'login to view your profile'),
                const SizedBox(
                  height: 40,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpansionTile(
                      collapsedIconColor: ThemeConfig.mainTextColor,
                      title: const MainLabelText(
                        text: 'Laxhmi shop',
                        isBold: true,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  LabelText(
                                    text: 'Order Id : 564545',
                                  ),
                                  LabelText(text: 'Total items : 8'),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: 'Price : 125'),
                                  Container(
                                    // color: ThemeConfig.secondaryColor,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ThemeConfig.secondaryColor),
                                    child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: LabelText(
                                          text: "details",
                                          isWhite: true,
                                        )),
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 12, bottom: 12),
                                child: Divider(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  LabelText(
                                    text: 'Order Id : 564545',
                                  ),
                                  LabelText(text: 'Total items : 8'),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: 'Price : 125'),
                                  Container(
                                    // color: ThemeConfig.secondaryColor,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ThemeConfig.secondaryColor),
                                    child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: LabelText(
                                          text: "Details",
                                          isWhite: true,
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
