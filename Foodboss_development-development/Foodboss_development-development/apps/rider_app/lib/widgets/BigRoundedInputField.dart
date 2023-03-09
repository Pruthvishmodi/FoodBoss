import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/widgets/TextFieldContainer.dart';

class BigRoundedInputField extends StatelessWidget {

  final String hintText;
    final Function(String)? onChange;

  const BigRoundedInputField({ Key? key, required this.hintText, this.onChange, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      onChanged: onChange,
      decoration: InputDecoration(
        filled: true,
        fillColor: ThemeConfig.WHITE_COLOR,
        contentPadding:const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
              borderSide: const BorderSide(
                  color: ThemeConfig.DISTRUCTIVE_COLOR, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
              borderSide: const BorderSide(
                  color: ThemeConfig.PRIMARY_COLOR, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
              borderSide: const BorderSide(
                  color: ThemeConfig.PRIMARY_COLOR, width: 1),
      ),),
    );
  }
}