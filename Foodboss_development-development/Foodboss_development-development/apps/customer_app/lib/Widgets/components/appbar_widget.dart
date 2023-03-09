import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(String text) {
    return AppBar(
      foregroundColor: ThemeConfig.mainTextColor,
      backgroundColor: ThemeConfig.whiteColor,
      elevation: 0,
      
      title:  MainLabelText(text: text,isBold: true,),
    );
  }