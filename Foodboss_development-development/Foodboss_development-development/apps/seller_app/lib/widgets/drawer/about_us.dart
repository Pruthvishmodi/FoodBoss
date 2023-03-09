import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  AboutUs({Key? key}) : super(key: key);

  var data = Get.arguments;

  late bool fromLogin;

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      fromLogin = data[0];
    }
    return PageLayout(
      title: "About Us",
      bottombar: false,
      color: ThemeConfig.PRIMARY_COLOR,
      appBar: fromLogin ? false : true,
      appbarFunc: () {
        // Get.toNamed("/deliveryboys/add");
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
              // SizedBox(
              //   height: 5,
              // ),
              GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse('https://web.foodboss.in/'),
                      mode: LaunchMode.externalApplication);
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
              // SizedBox(
              //   height: 5,
              // ),
              GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse('https://www.demaze.in/'),
                      mode: LaunchMode.externalApplication);
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
              GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse('https://www.thespecialcharacter.com/'),
                      mode: LaunchMode.externalApplication);
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
        ),
      ),
    );
  }
}
