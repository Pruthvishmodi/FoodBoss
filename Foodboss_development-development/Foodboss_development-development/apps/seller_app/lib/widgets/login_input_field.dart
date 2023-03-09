import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class LoginInputField extends StatelessWidget {
  final String text;
  final bool? isNumber;
  final Function(String)? onChange;
  final IconData? icon;
  const LoginInputField(
      {Key? key, required this.text, this.onChange, this.icon, this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:
          isNumber == true ? TextInputType.number : TextInputType.emailAddress,
      onChanged: (value) => onChange!(value),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: ThemeConfig.PRIMARY_COLOR,
        ),
        contentPadding: const EdgeInsets.all(15),
        // hintText: "Name"
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
          borderSide: const BorderSide(),
        ),
      ),
    );
  }
}
