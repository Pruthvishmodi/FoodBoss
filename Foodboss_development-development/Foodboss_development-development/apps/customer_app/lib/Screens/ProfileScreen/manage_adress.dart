import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Widgets/Text%20widgets/heading_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:flutter/material.dart';

class ManageAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeConfig.whiteColor,
        title: const MainLabelText(
          text: "my addresses",
          isBold: true,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              "assets/images/Direction.png",
              fit: BoxFit.fill,
            ),
          ),
          const MainLabelText(
            text: "Your have no saved address",
            isBold: true,
          ),
          const SizedBox(
            height: 10,
          ),
          const LabelText(
            text: "Tell us where you want your order delivered",
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(const Radius.circular(8)),
                color: ThemeConfig.primaryColor,
              ),
              width: 325,
              height: 28,
              child: const Center(
                child: Text(
                  "Add a new address in Ahmedabad, Ahmedabad",
                  style: const TextStyle(
                      fontSize: 13,
                      color: ThemeConfig.whiteColor,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
