import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/config/page_layout.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "About Us",
      bottombar: false,
      color: ThemeConfig.PRIMARY_COLOR,
      appBar: true,
      appbarFunc: () {
        Get.toNamed("/deliveryboys/add");
      },
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Desc(descString: 'Owned By'),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                launch('https://web.foodboss.in/');
              },
              behavior: HitTestBehavior.translucent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainLabelText(titleString: 'FoodBoss Pvt Ltd'),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Desc(descString: 'Developed By'),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                launch('https://www.demaze.in/');
              },
              behavior: HitTestBehavior.translucent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainLabelText(titleString: 'Demaze Technologies'),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                launch('https://www.thespecialcharacter.com/');
              },
              behavior: HitTestBehavior.translucent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainLabelText(titleString: 'The Special Char'),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
