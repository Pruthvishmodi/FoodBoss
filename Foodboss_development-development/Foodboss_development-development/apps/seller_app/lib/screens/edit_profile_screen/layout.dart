import 'package:flutter/material.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:seller_app/screens/edit_profile_screen/edit_profile_screen.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      bottombar: true,
      backArrow: false,
      title: "Edit profile",
      selectedIndex: 0,
      color: Colors.transparent,
      appbarFunc: () {},
      child: const EditProfileScreen(),
    );
  }
}
