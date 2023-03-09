import 'package:flutter/material.dart';
import 'package:seller_app/config/config.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/food_boss_button.dart';
import 'package:seller_app/widgets/food_boss_card.dart';
import 'package:seller_app/widgets/view_customer_detail_card.dart';


class KhataRequest extends StatelessWidget {
  const KhataRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(backgroundColor: Conifg.primaryColor,elevation: 0,
       title: Text("Khata Request"),
     ),
     body: SingleChildScrollView(
       child: SafeArea(
         child: Column(
           children: const [
             
             SizedBox(
               height: 20.0,
             ),
             ViewCustomerDetials(name: "Jay Soni", address: "A704 RJ prime Gandhinagar", phoneNumber: 9363085698)

             
              ,SizedBox(
                height: 10,
              ),

             



              




              



             
            ],
         )),
     ),
    );
  }
}
