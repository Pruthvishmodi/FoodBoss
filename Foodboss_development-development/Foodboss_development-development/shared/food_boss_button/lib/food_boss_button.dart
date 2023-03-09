library food_boss_button;

import 'package:flutter/material.dart';

class FoodBossButtons extends StatelessWidget {
  final String text;
   final Color color;
  final double height;
  final double width;
  final double bradius;
  final Color textcolor;



   // ignore: non_constant_identifier_names
   const FoodBossButtons({Key? key, required this.text, required this.color, required this.height, required this.width, required this.bradius, required this.textcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){},
    style: TextButton.styleFrom(
        primary: color,
      ),
    
     child: Text(text,style: TextStyle(fontSize: 20),),
     
     
     );

}
}