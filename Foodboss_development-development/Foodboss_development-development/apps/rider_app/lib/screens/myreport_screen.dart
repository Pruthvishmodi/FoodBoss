import 'package:flutter/material.dart';
import 'package:rider_app/config/config.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/screens/individual_report_screen.dart';
import 'package:rider_app/widgets/food_boss_card.dart';

class MyReports extends StatelessWidget {
  const MyReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Conifg.primaryColor,
        elevation: 0,
        title: const Text("My Reports"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child:  Container(
                            height: 40,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              color: ThemeConfig.WHITE_COLOR,
                              border: Border.all(
                                  width: 1, color: ThemeConfig.PRIMARY_COLOR),
                              borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MAX),
                            ),
                            child: Text('From'),
                          ),
                  ),
                  const Flexible(
                      flex: 1,
                      child: Text(
                        "--",
                        style: TextStyle(
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            fontSize: ThemeConfig.HEADING_SIZE,
                            fontWeight: FontWeight.bold),
                      )),
                  Flexible(
                    flex: 2,
                    child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              color: ThemeConfig.WHITE_COLOR,
                              border: Border.all(
                                  width: 1, color: ThemeConfig.PRIMARY_COLOR),
                              borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MAX),
                            ),
                            child: Text('From'),
                          ),
                  ),
                ],
              ),
            ),
            FoodBossCard(
                borderRadius: 20,
                padding: const EdgeInsets.all(20),
                height: 200,
                cardColor: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                          Text(
                            "January 2022 Reports",
                            style: TextStyle(
                                color: ThemeConfig.MAIN_TEXT_COLOR,
                                fontSize: ThemeConfig.HEADING_SIZE,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                          Text(
                            "Total number of points earned:365",
                            style: TextStyle(
                                color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                fontSize: ThemeConfig.DESCRIPTION_SIZE,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1.00),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text("Value of points"),
                              Text("1 Point= Rs300")
                            ],
                          ),
                          const Text("Final Amount: Rs.1,00,000")
                        ],
                      ),
                    )
                  ],
                ),
                margin: const EdgeInsets.all(10.0),
                op: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IndividualReports()),
                  );
                }),
            FoodBossCard(
                borderRadius: 20,
                padding: const EdgeInsets.all(20),
                height: 200,
                cardColor: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                          Text(
                            "December 2021 Reports",
                            style: TextStyle(
                                color: ThemeConfig.MAIN_TEXT_COLOR,
                                fontSize: ThemeConfig.HEADING_SIZE,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                          Text(
                            "Total number of points earned:365",
                            style: TextStyle(
                                color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                fontSize: ThemeConfig.DESCRIPTION_SIZE,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1.00),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text("Value of points"),
                              Text("1 Point= Rs300")
                            ],
                          ),
                          const Text("Final Amount: Rs.1,00,000")
                        ],
                      ),
                    )
                  ],
                ),
                margin: const EdgeInsets.all(10.0),
                op: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IndividualReports()),
                  );
                }),
            FoodBossCard(
                borderRadius: 20,
                padding: const EdgeInsets.all(20),
                height: 200,
                cardColor: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                          Text(
                            "November 2021 Reports",
                            style: TextStyle(
                                color: ThemeConfig.MAIN_TEXT_COLOR,
                                fontSize: ThemeConfig.HEADING_SIZE,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                          Text(
                            "Total number of points earned:365",
                            style: TextStyle(
                                color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                fontSize: ThemeConfig.DESCRIPTION_SIZE,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1.00),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text("Value of points"),
                              Text("1 Point= Rs300")
                            ],
                          ),
                          const Text("Final Amount: Rs.1,00,000")
                        ],
                      ),
                    )
                  ],
                ),
                margin: const EdgeInsets.all(10.0),
                op: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IndividualReports()),
                  );
                }),
            FoodBossCard(
                borderRadius: 20,
                padding: const EdgeInsets.all(20),
                height: 200,
                cardColor: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                          Text(
                            "October 2021 Reports",
                            style: TextStyle(
                                color: ThemeConfig.MAIN_TEXT_COLOR,
                                fontSize: ThemeConfig.HEADING_SIZE,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                          Text(
                            "Total number of points earned:365",
                            style: TextStyle(
                                color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                fontSize: ThemeConfig.DESCRIPTION_SIZE,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1.00),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text("Value of points"),
                              Text("1 Point= Rs300")
                            ],
                          ),
                          const Text("Final Amount: Rs.1,00,000")
                        ],
                      ),
                    )
                  ],
                ),
                margin: const EdgeInsets.all(10.0),
                op: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IndividualReports()),
                  );
                }),
          ],
        )),
      ),
    );
  }
}
