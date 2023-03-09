import 'package:flutter/material.dart';
import 'package:rider_app/config/config.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/widgets/food_boss_button.dart';
import 'package:rider_app/widgets/food_boss_card.dart';
import 'package:rider_app/widgets/individual_customer_details.dart';
import 'package:rider_app/widgets/view_customer_detail_card.dart';


class IndividualKhataUserDetails extends StatelessWidget {
  const IndividualKhataUserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(backgroundColor: Conifg.primaryColor,elevation: 0,
       title: Text("Jay Soni(5500)"),
     ),
     body: SingleChildScrollView(
       child: SafeArea(
         child: Column(
           children: [
             
             SizedBox(
               height: 20.0,
             ),
         
             IndividualDetails(address: 'A704 RJ Prime Zundal Gandhinagar', name: 'Jay Soni', phoneNumber: 8265412025,)
              ,SizedBox(
                height: 10,
              ),

             



              




              



             
            ],
         )),
     ),
    );
  }
}
