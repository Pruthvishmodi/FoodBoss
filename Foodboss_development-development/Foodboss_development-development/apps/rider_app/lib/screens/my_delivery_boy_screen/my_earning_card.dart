import 'package:flutter/material.dart';
// import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:url_launcher/url_launcher.dart';

class MyEarningCard extends StatelessWidget {
  final String name;
  final String address;
  final String phone;
  final String time;
  final String earning;

  final String img;
  final bool? canAdd;
  const MyEarningCard(
      {Key? key,
      required this.name,
      required this.phone,
      required this.time,
      required this.img,
      this.canAdd,
      required this.address,
      required this.earning})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool switchValue = true;
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.00),
              color: ThemeConfig.WHITE_COLOR,
            ),
            margin: const EdgeInsets.only(
              top: 20.00,
            ),
            padding: const EdgeInsets.all(20.00),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LabelText(titleString: time),
                          Row(
                            children: [
                              Desc(
                                descString: '\u{20B9}${earning}',
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      // child: child,
                      decoration: BoxDecoration(
                          // color: ThemeConfig.primaryColorLite,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(img),
                          )),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        height: 100,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MainLabelText(titleString: name),
                            LabelText(
                              isLeft: 'yes',
                              titleString: '${address}',
                            ),
                            GestureDetector(
                              onTap: () => launch("tel://${phone}"),
                              child: Desc(
                                descString: "+91${phone}",
                                isSec: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
