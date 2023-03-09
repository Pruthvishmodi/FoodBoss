import 'package:flutter/material.dart';
import 'package:rider_app/config/page_layout.dart';
import 'package:rider_app/screens/login_screen/login_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      appBar: false,
      bottombar: false,
      backArrow: false,
      title: "Edit profile",
      selectedIndex: 0,
      color: Colors.transparent,
      appbarFunc: () {},
      child: const LoginScreenMain(),
    );
  }
}
