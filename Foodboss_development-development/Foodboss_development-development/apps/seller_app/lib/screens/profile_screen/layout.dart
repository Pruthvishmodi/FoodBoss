import 'package:flutter/material.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/screens/profile_screen/profile_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      bottombar: false,
      backArrow: false,
      title: "Profile",
      selectedIndex: 0,
      color: ThemeConfig.PRIMARY_COLOR,
      appbarFunc: () {},
      child:  ProfileScreen(),
    );
  }
}
