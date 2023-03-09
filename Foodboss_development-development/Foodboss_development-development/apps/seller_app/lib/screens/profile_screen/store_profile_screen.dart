import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/Heading.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/title_widget.dart';

class StoreProfileScreen extends StatelessWidget {
  const StoreProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

 

    return Container(
      padding: EdgeInsets.only(
          top: size.height * 0.03,
          left: size.height * 0.03,
          right: size.height * 0.03),
      // height: size.height > 300 ? size.height * 0.5 : size.height,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 550.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0)),
                          color: Colors.redAccent,
                        ),
                        child: const Image(
                          image: AssetImage('assets/images/profile_pic.jpg'),
                        )),
                  SizedBox(
                    width: size.height * 0.03,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Heading('Lakshmi Shop', ThemeConfig.MAIN_TEXT_COLOR),
                        const Text(
                          'B-706 Sarthak heavens Near Raysan petrol pump,Raysan ,Gandhinagar',
                          maxLines: 3,
                          style: TextStyle(
                              color: ThemeConfig.MAIN_TEXT_COLOR,
                              fontSize: ThemeConfig.NOTIFICATION_SIZE),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        
                        SubText(
                            text: '+91 9314025585',
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            size: ThemeConfig.SUB_TITLE_SIZE),
                      ],
                    ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const SizedBox(height: 40,),
              const Center(child: TitleText(titleString: 'STORE TIMINGS')),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(flex: 1,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Desc(descString: 'Monday'),
                        Desc(descString: 'Tuesday'),
                        Desc(descString: 'Wednesday'),
                        Desc(descString: 'Thursday'),
                        Desc(descString: 'Friday'),
                        Desc(descString: 'Saturady'),
                        Desc(descString: 'Sunday'),
                  
                  
                      ],
                    ),
                  ),
                  Expanded(flex: 1,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Desc(descString: '8-Am to 9Pm'),
                        Desc(descString: '8-Am to 9Pm'),
                        Desc(descString: '8-Am to 9Pm'),
                        Desc(descString: '8-Am to 9Pm'),
                        Desc(descString: '8-Am to 9Pm'),
                        Desc(descString: '8-Am to 9Pm'),
                        Desc(descString: 'Closed'),


                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

