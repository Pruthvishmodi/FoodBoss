import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rider_app/config/config.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/widgets/food_boss_button.dart';
import 'package:rider_app/widgets/food_boss_card.dart';
import 'package:rider_app/widgets/pending_order_card.dart';

class PendingOrders extends StatelessWidget {
  TabBar get _tabBar => TabBar(
        padding: const EdgeInsets.all(5),
        isScrollable: true,
        unselectedLabelColor: Colors.black.withOpacity(0.3),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Conifg.primaryColor),
        tabs: [
          Container(
              height: 40, child: const Center(child: Text("Pending Order"))),
          const Text("Ready to Ship"),
          const Text("Shipped Orders"),
          const Text("Completed Orders"),
          const Text("Cancelled Orders"),
          const Text("Returned Orders"),
          const Text("CRP Orders"),
        ],
      );
  const PendingOrders({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Conifg.primaryColor,
          elevation: 0,
          title: const Text("Orders"),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.grey.shade50,
              child: _tabBar,
            ),
          ),
        ),
        body: TabBarView(children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(""),
                    FoodBossButtons(
                        height: 30,
                        text: "",
                        isIcon: true,
                        icon: Icons.share,
                        color: Colors.grey.shade50,
                        bradius: 30,
                        textcolor: Colors.black,
                        fsize: ThemeConfig.TITLE_SIZE,
                        op: () {},
                        type: 'filled',
                        bwidth: 0)
                  ],
                ),
              ),
              const PendingCard(
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Cancel',
                isCheckbox: true,
              ),
              const PendingCard(
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Cancel',
                isCheckbox: true,
              ),
              const PendingCard(
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Cancel',
                isCheckbox: true,
              ),
            ],
          ),
          ListView(
            //ready to ship
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(""),
                    FoodBossButtons(
                      height: 0,
                      text: "Assign Delivery Boy",
                      bradius: 30,
                      textcolor: Colors.white,
                      fsize: ThemeConfig.TITLE_SIZE,
                      op: () {},
                      type: 'filled',
                      bwidth: 0,
                      color: Conifg.primaryColor,
                    )
                  ],
                ),
              ),
              const PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: true,
              ),
              const PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: true,
              ),
              const PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: true,
              ),

              // FloatingActionButton(,onPressed: (){},child:Text("data") ,elevation: 0,),
            ],
          ),
          ListView(
            //Shipped
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 20,
              ),
              const PendingCard(
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
              const PendingCard(
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
              const PendingCard(
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
            ],
          ),
          ListView(
            //Completed

            children: const [
              SizedBox(
                height: 20,
              ),
              PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
              PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
              PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
            ],
          ),
          ListView(
            //Cancelled

            children: const [
              SizedBox(
                height: 20,
              ),
              PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 350,
                date: '14/05/2020',
                time: '15:30',
                items: 4,
                type: 'Prepaid',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
              PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 2250,
                date: '14/05/2020',
                time: '15:30',
                items: 7,
                type: 'COD',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
              PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 4500,
                date: '14/05/2020',
                time: '15:30',
                items: 5,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
            ],
          ),
          ListView(
            //Returned

            children: const [
              SizedBox(
                height: 20,
              ),
              PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
              PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
              PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
            ],
          ),
          ListView(
            //Returned
            children: [
              FoodBossCard(
                borderRadius: 20,
                cardColor: Colors.white,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10),
                op: () {},
                padding: const EdgeInsets.all(25),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "JAY SONI",
                            style: TextStyle(
                                color: ThemeConfig.MAIN_TEXT_COLOR,
                                fontSize: ThemeConfig.HEADING_SIZE,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Unique Id: FBD02536",
                            style: TextStyle(
                                color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "+91 8232514145",
                            style: TextStyle(
                                color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "10-6 PM",
                            style: TextStyle(
                                color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            color: Colors.redAccent,
                          ),
                          child: const Image(
                            image: AssetImage('assets/images/intro-01.png'),
                          )),
                    ],
                  ),
                ),
              ),
              const PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Prepaid',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
              const PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'Khata',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
              const PendingCard(
                isButton: false,
                orderId: 123456,
                amount: 1500,
                date: '14/05/2020',
                time: '15:30',
                items: 20,
                type: 'COD',
                buttonText: 'Track Order',
                isCheckbox: false,
              ),
            ],
          ),
        ]),
        // floatingActionButton: FloatingActionButton(onPressed: (){},

        //   ),
      ),
    );
  }
}
