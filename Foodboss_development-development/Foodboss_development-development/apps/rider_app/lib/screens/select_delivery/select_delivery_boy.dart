import 'package:flutter/material.dart';
import 'package:rider_app/config/TextsizeResponsive.dart';

import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/otp_form.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';

class SelectDeliveryBoy extends StatelessWidget {
  const SelectDeliveryBoy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Select Delivery Boy',
          style: TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR),
        ),
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Container(
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
                  radius: 40,
                  backgroundImage:
                      AssetImage('assets/images/profile_pic.jpg'),
                ),
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
                        SizedBox(height: 3),
                        Desc(descString: "#FBR00256"),
                        SizedBox(height: 3),
                        Desc(descString: "Available from 10 Am to 4 Am"),
                      ]),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ItemListCard(
                borderRadius: 20,
                padding: const EdgeInsets.all(20),
                cardColor: ThemeConfig.WHITE_COLOR,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxWidth:
                                MediaQuery.of(context).size.width * .7),
                        child: const TextSizeResponsive(
                          alignment: TextAlign.center,
                          string:
                              'Pickup Confirmation Code For Delivery Boy',
                          color: ThemeConfig.MAIN_TEXT_COLOR,
                          size: ThemeConfig.TITLE_SIZE,
                          weight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            OtpForm(),
                            OtpForm(),
                            OtpForm(),
                            OtpForm(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .7,
                        child: Expanded(
                          child: PrimaryButton(
                              text: 'Assign Delivery Boy ',
                              op: () {},
                              type: 'filled'),
                        ),
                      )
                    ],
                  ),
                ),
                op: () {},
                margin: const EdgeInsets.symmetric(horizontal: 0)),
          ],
            ),
          ),
        ],
      ),
    ),
        )),
      ),
    );
  }
}



class ItemListCard extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double borderRadius;
  final double? height;
  final Function op;
  final Color cardColor;
  final Color? borderColor;
  final double width;
  final double? borderWidth;

  final Widget child;
  const ItemListCard(
      {Key? key,
      required this.borderRadius,
      required this.padding,
      this.height,
      required this.cardColor,
      required this.width,
      this.borderColor,
      required this.child,
      required this.op,
      this.borderWidth,
      required this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => op(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: cardColor,
          border: Border.all(
              color: borderColor ?? cardColor, width: borderWidth ?? 0),
        ),
        padding: padding,
        margin: margin,
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
