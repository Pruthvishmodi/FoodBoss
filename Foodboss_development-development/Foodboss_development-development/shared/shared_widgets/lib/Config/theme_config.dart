import 'package:flutter/material.dart';

class ThemeConfig {
  // text sizes
  static const double HEADING_SIZE = 24.00;
  static const double SUB_HEADING_SIZE = 14.00;
  static const double TITLE_SIZE = 18.00;
  static const double SUB_TITLE_SIZE = 12.00;
  static const double DESCRIPTION_SIZE = 12.00;
  static const double NOTIFICATION_SIZE = 12.00;
  static const double LABEL_SIZE = 12.00;
  static const double FORM_TEXT_SIZE = 10.00;
  static const double BUTTON_TEXT_SIZE = 10.00;
  static const double OTP_TEXT_SIZE = 30.00;
  // colors
  // static const Color PRIMARY_COLOR = Color(0xffF8C700);
  // static const Color PRIMARY_COLOR = Color(0xffFCBB00);
  static const Color PRIMARY_COLOR = Color(0xff87cb86);

  // static const Color PRIMARY_COLOR = Color(0xff24D37F);
  // static const Color DISTRUCTIVE_COLOR = Color(0xffB60F6E);
  static const Color DISTRUCTIVE_COLOR = Color.fromARGB(255, 248, 215, 214);
  static const Color MAIN_TEXT_COLOR = Color(0xff2E3E5C);
  static Color GREY_COLOR = Colors.grey.shade300;
  static const Color SECONDARY_TEXT_COLOR = Color(0xff9FA5C0);
  static const Color FORM_COLOR = Color(0xfff7fff7);
  static const Color OUTLINE_COLOR = Color(0xffD0DBEA);
  static const Color SUCCESS_COLOR = Color.fromARGB(255, 61, 182, 37);
  static const Color WHITE_COLOR = Color(0xffFFFFFF);
  static const Color ERROR_COLOR = Color(0xffED4337);

  // button types
  static const int PRIMARY_FILL = 1;
  static const int PRIMARY_OUTLINE = 2;
  static const int PRIMARY_TEXT = 3;
  static const int SECONDARY_FILL = 4;
  static const int SECONDARY_OUTLINE = 5;
  static const int SECONDARY_TEXT = 6;
  static const int DISTRUCTIVE_FILL = 7;
  static const int DISTRUCTIVE_OUTLINE = 8;
  static const int DISTRUCTIVE_TEXT = 9;
  static const int DISABLED_FILL = 10;
  static const int DISABLED_OUTLINE = 11;
  static const int DISABLED_TEXT = 12;

  //

  static const double BORDERRADIUS_MAX = 20;
  static const double BORDERRADIUS_MEDIUM = 20;
  static const double BORDERRADIUS_MIN = 10;

  static const String NOIMAGELINK =
      'https://emedicodiary.com/images/queimg/no-image-found.png';
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}
