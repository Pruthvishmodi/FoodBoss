import 'package:flutter/material.dart';


import 'package:rider_app/widgets/food%20boss%20card/food_boss_card.dart';
import 'package:shared_widgets/shared_widgets.dart';

class AddOrderss extends StatelessWidget {
  const AddOrderss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        elevation: 0,
        title: const Text("Add Orders"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CircleAvatar(
                  //   backgroundImage: AssetImage('assets/images/shopImage3.jpg'),
                  //   radius: 40,
                  // ),
                  Container(
                      width: 130.0,
                      height: 130.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Colors.redAccent,
                      ),
                      child: const Image(
                        image: AssetImage('assets/images/intro-01.png'),
                      )),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "Add Order!",
                    style: TextStyle(
                        color: ThemeConfig.MAIN_TEXT_COLOR,
                        fontSize: ThemeConfig.HEADING_SIZE,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Choose your order plan from these ones!",
                    style: TextStyle(
                        color: ThemeConfig.SECONDARY_TEXT_COLOR,
                        fontSize: ThemeConfig.TITLE_SIZE,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(
                      flex: 1, child: OrderCard(amount: '210', orders: '30')),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 1, child: OrderCard(amount: '500', orders: '100'))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(
                      flex: 1, child: OrderCard(amount: '800', orders: '160')),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 1, child: OrderCard(amount: '2,000', orders: '400'))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(
                      flex: 1,
                      child: OrderCard(amount: '4,000', orders: '1,000')),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 1,
                      child: OrderCard(amount: '12,000', orders: '3,000'))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(
                      flex: 1,
                      child: OrderCard(amount: '24,500', orders: '7,000')),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 1,
                      child: OrderCard(amount: '45,500', orders: '13,000'))
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String amount;
  final String orders;
  const OrderCard({Key? key, required this.amount, required this.orders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Text('hello'),
    );
    //   return FoodBossCard(
    //                       borderRadius: 20,
    //                       padding: const EdgeInsets.all(20),
    //                       cardColor: ThemeConfig.FORM_COLOR,
    //                       width: size.width * .4,
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.end,
    //                             children: const [
    //                               Icon(Icons.star_half_rounded,
    //                                   color: ThemeConfig.PRIMARY_COLOR),
    //                             ],
    //                           ),
    //                           // SizedBox(height: 10,),
    //                           Text(
    //                             "\u{20B9}$amount",
    //                             style: TextStyle(
    //                                 fontSize: const AdaptiveTextSize()
    //                                     .getadaptiveTextSize(
    //                                         context, ThemeConfig.TITLE_SIZE),
    //                                 color: ThemeConfig.MAIN_TEXT_COLOR,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                           const SizedBox(
    //                             height: 10,
    //                           ),
    //                           Text(
    //                             "$orders Orders",
    //                             style: TextStyle(
    //                                 fontSize: const AdaptiveTextSize()
    //                                     .getadaptiveTextSize(context,
    //                                         ThemeConfig.DESCRIPTION_SIZE),
    //                                 color: ThemeConfig.DISTRUCTIVE_COLOR,
    //                                 fontWeight: FontWeight.bold),
    //                           )
    //                         ],
    //                       ),
    //                       op: () {},
    //                       margin: const EdgeInsets.all(0));
  }
}
