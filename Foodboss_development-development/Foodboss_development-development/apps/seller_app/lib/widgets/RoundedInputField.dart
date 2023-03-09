import 'package:flutter/material.dart';


// use this input field if you have icon.


class RoundedInputField extends StatelessWidget {

  final String hintText;
  final IconData? icon;
  final bool? isNumber;

  const RoundedInputField({ Key? key, required this.hintText, this.icon, this.isNumber = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: const TextStyle(color: Colors.grey),
        //todo:  add value change logic and input type logic
        icon: Icon(icon ?? null,color: Colors.black,),
        border: InputBorder.none,
      ),
    );
  }
}