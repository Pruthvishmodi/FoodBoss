import 'package:flutter/material.dart';
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/screens/profile_screen/profile_screen.dart';
import 'package:shared_widgets/shared_widgets.dart';

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
      child: const ProfileScreen(),
    );
  }
}
