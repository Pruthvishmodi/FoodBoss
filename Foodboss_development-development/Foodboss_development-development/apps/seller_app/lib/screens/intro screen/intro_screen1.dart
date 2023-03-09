import 'package:flutter/material.dart';

import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/food%20boss%20button/food_boss_button.dart';


class IntroScreen extends StatelessWidget {
  
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Center(
          child: Column(
            children: [
              const SizedBox(

                height: 20.0,
              ),


              
               const Expanded(
                 flex: 3,
                 child: Image(image: AssetImage('assets/images/intro-01.png'),)),

               const SizedBox(
                 height: 40.0,
               ),

               Expanded(
                 flex: 1,
                 child: Column(
                   children: const [
                     Text(
                      'Get Started',
                      style: TextStyle(
                          color: ThemeConfig.MAIN_TEXT_COLOR,
                          fontSize: ThemeConfig.HEADING_SIZE,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
              ),
                  

                 SizedBox(
                   height: 20.0,
                 ),

                 Padding(
                   padding: EdgeInsets.all(20.0),
                   child: Text(
                      'It has survived not only five centuries, but also the leap into electronic typesetting.',
                      style: TextStyle(
                          color: ThemeConfig.SECONDARY_TEXT_COLOR,
                          fontSize: ThemeConfig.DESCRIPTION_SIZE,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.00),
                      textAlign: TextAlign.center,
                    ),
                 ),
                   ],
                 ),
               ),
                const SizedBox(
                 height: 20.0,
               ),
                Expanded(
                  flex: 1,
                  child: FoodBossButtons(width: 400,height: 50,text: "Done", color: ThemeConfig.PRIMARY_COLOR, bradius: 20.0, textcolor: Colors.white, fsize: 20, op: (){}, type: "filled", bwidth: 20)),
        
            ],
            

          ),
        ),
        
      ),
      ),
    );
  }
}