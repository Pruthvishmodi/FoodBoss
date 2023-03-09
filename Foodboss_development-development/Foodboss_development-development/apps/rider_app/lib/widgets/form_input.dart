import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class FormInput extends StatelessWidget {
  final String attr;
  final String? sheet;
  const FormInput({ Key? key, required this.attr,  this.sheet }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.00),
      height: 40.00,
      decoration: BoxDecoration(
      color: sheet== 'yes'?ThemeConfig.WHITE_COLOR :ThemeConfig.FORM_COLOR,
      borderRadius: BorderRadius.circular(25.00),
      ),
      child: Center(child: TextFormField(decoration: InputDecoration(border: InputBorder.none,hintText: attr),)),
    );
  }
}