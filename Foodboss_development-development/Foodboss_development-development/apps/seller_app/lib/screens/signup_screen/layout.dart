import 'package:flutter/material.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:seller_app/screens/signup_screen/signup_screen.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
      child: const RegisterScreenMain(),
    );
  }
}
