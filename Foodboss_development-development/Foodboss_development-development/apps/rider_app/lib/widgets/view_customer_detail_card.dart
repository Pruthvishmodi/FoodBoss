import 'package:flutter/material.dart';
import 'package:rider_app/config/config.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/widgets/food_boss_button.dart';
import 'package:rider_app/widgets/food_boss_card.dart';

class ViewCustomerDetials extends StatelessWidget {
  final String name;
  final String address;
  final  double phoneNumber;
  
  

  const ViewCustomerDetials({Key? key, required this.name, required this.address, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FoodBossCard(borderRadius: 20, padding: EdgeInsets.all(20),  cardColor: Colors.white, width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Customer Details:",
                       style: TextStyle(
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            fontSize: ThemeConfig.HEADING_SIZE,
                            fontWeight: FontWeight.bold),
                      ),

                       ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: 
                    Center(
                      child: Column(
                        children: [
                          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              color: Colors.redAccent,
            ),
            child: Image(image: AssetImage('assets/images/intro-01.png'),)
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$name",
            style: TextStyle(
                              color: ThemeConfig.MAIN_TEXT_COLOR,
                              fontSize: ThemeConfig.TITLE_SIZE,
                              fontWeight: FontWeight.bold),
            ),
          )
                          
                        ],
                      ),
                    )
                    ,),
                  ),



                  SizedBox(height: 10,),
                  
                   Row(
                    children: [
                      Container(constraints: BoxConstraints(minWidth: 100, maxWidth: 400),
                        child: Text("ADDRESS: $address",
                        style: TextStyle(
                              color: ThemeConfig.SECONDARY_TEXT_COLOR,
                              fontSize: ThemeConfig.DESCRIPTION_SIZE,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 1.00),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3,),
                   Row(
                    children: [
                      Text("MOBILE NUMBER: $phoneNumber",
                      style: TextStyle(
                            color: ThemeConfig.SECONDARY_TEXT_COLOR,
                            fontSize: ThemeConfig.DESCRIPTION_SIZE,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.00),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("  Set Khata Limit:",
                       style: TextStyle(
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            fontSize: ThemeConfig.DESCRIPTION_SIZE,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.00),
                      ),
                    ],
                  ),



                   Row(
                    children: [
                      Flexible(
                    flex: 2,
            child: Container(height: 50,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Conifg.primaryColor,width: 2),
        borderRadius: BorderRadius.circular(29),
      ),
      child:TextFormField(
                decoration: InputDecoration(   
                  
                border: InputBorder.none, 
                labelStyle: TextStyle(
        color: Conifg.primaryColor
      )
                ),
                
   
                ),
               ),
          ),
            SizedBox(width: 10,),          
 Flexible(
                    flex: 1,
            child: FoodBossButtons(height:50,width:  MediaQuery.of(context).size.width,text: "Set", color: Conifg.primaryColor, bradius: 29, textcolor: Colors.white, fsize: ThemeConfig.DESCRIPTION_SIZE, op: (){}, type: 'filled', bwidth: 0)
          ),
          Flexible(
            flex: 1,
            child: Text(''),
          )
                    ],
                  ),
                 
                 
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("  Set Khata Date:",
                       style: TextStyle(
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            fontSize: ThemeConfig.DESCRIPTION_SIZE,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.00),
                      ),
                    ],
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                     Flexible(
                    flex: 2,
            child: Container(height: 50,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Conifg.primaryColor,width: 2),
        borderRadius: BorderRadius.circular(29),
      ),
      child:TextFormField(
                decoration: InputDecoration(   
                  
                border: InputBorder.none, labelText: 'From',
                labelStyle: TextStyle(
        color: Conifg.primaryColor
      )
                ),
                
   
                ),
               ),
          ),

           Flexible(
                    flex: 1,
            child: Text("--",style: TextStyle(
                              color: ThemeConfig.MAIN_TEXT_COLOR,
                              fontSize: ThemeConfig.HEADING_SIZE,
                              fontWeight: FontWeight.bold),)
          ),

          Flexible(
                    flex: 2,
            child: Container(height: 50,
      margin: EdgeInsets.symmetric(vertical: 0),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Conifg.primaryColor,width: 2),
        borderRadius: BorderRadius.circular(29),
      ),
      child:TextFormField(
                decoration: InputDecoration(   
                  
                border: InputBorder.none, labelText: 'To',
                labelStyle: TextStyle(
        color: Conifg.primaryColor
      )
                ),
                
   
                ),
               ),
          ),

                    ],
                  ),

                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("  Set Delivery Amount:",
                       style: TextStyle(
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            fontSize: ThemeConfig.DESCRIPTION_SIZE,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.00),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                        Flexible(
                    flex: 2,
            child: Container(height: 50,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Conifg.primaryColor,width: 2),
        borderRadius: BorderRadius.circular(29),
      ),
      child:TextFormField(
                decoration: InputDecoration(   
                  
                border: InputBorder.none, labelText: 'In Rupee',
                labelStyle: TextStyle(
        color: Conifg.primaryColor
      )
                ),
                
   
                ),
               ),
          ),
          Flexible(flex: 2,
          child: Text(''),
          ),

                    ],
                  ),




                  SizedBox(height: 20,),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Flexible(
                    flex: 2,
            child: FoodBossButtons(height:50,width:  MediaQuery.of(context).size.width,text: "Reject", color: Conifg.primaryColor, bradius: 29, textcolor: Colors.white, fsize: ThemeConfig.DESCRIPTION_SIZE, op: (){}, type: 'filled', bwidth: 0)
          ),
          SizedBox(width: 8,),
          Flexible(
                    flex: 2,
            child: FoodBossButtons(height:50,width:  MediaQuery.of(context).size.width,text: "Approve", color: Conifg.primaryColor, bradius: 29, textcolor: Colors.white, fsize: ThemeConfig.DESCRIPTION_SIZE, op: (){}, type: 'filled', bwidth: 0)
          ),
               ],
                  )
                ],
              ),
              
              margin: EdgeInsets.all(10.0), op: (){});
  }
}