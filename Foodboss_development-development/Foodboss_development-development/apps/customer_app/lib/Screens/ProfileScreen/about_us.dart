import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/order_history_controller.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/components/appbar_widget.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderHistoryController orderHistoryController =
        Get.put(OrderHistoryController());
    return Scaffold(
      appBar: customAppBar('About Us'),
      backgroundColor: ThemeConfig.whiteColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SB.large(),
                const DescriptionText(text: 'Owned by'),
                SB.small(),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse('https://web.foodboss.in/'),
                        mode: LaunchMode.externalApplication);
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      MainLabelText(text: 'FoodBoss Pvt Ltd'),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                SB.large(),
                const DescriptionText(text: 'Developed by'),
                SB.small(),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse('https://www.demaze.in/'),
                        mode: LaunchMode.externalApplication);
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      MainLabelText(text: 'Demaze Technologies'),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                SB.medium(),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse('https://www.thespecialcharacter.com/'),
                        mode: LaunchMode.externalApplication);
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      MainLabelText(text: 'The Special Char'),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
