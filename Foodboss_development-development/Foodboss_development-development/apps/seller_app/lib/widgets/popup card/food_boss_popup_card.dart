import 'package:flutter/material.dart';

import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/food%20boss%20button/food_boss_button.dart';
import 'package:seller_app/widgets/food%20boss%20card/food_boss_card.dart';

class FoodBossPopupCard extends StatelessWidget {
  final String titleText;
  final String buttonText;
  final String descriptionText;
  final VoidCallback op;

  final bool isSuccess;

  final VoidCallback buttonOnpressed;

  const FoodBossPopupCard({
    Key? key,
    required this.op,
    required this.isSuccess,
    required this.titleText,
    required this.descriptionText,
    required this.buttonOnpressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        height: 400,
        width: 400,
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            isSuccess == true
                ? const Expanded(
                    flex: 2,
                    child: Image(
                      image: AssetImage('assets/images/intro-01.png'),
                    ))
                : const Expanded(
                    flex: 2,
                    child: Icon(
                      Icons.warning_outlined,
                      size: 150.0,
                      color: Colors.red,
                    )),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      titleText,
                      style: const TextStyle(
                          color: ThemeConfig.MAIN_TEXT_COLOR,
                          fontSize: ThemeConfig.HEADING_SIZE,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      descriptionText,
                      style: const TextStyle(
                          color: ThemeConfig.SECONDARY_TEXT_COLOR,
                          fontSize: ThemeConfig.DESCRIPTION_SIZE,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.00),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: FoodBossButtons(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  text: buttonText,
                  color: isSuccess == true
                      ? ThemeConfig.PRIMARY_COLOR
                      : Colors.red,
                  bradius: 50.0,
                  textcolor: Colors.white,
                  fsize: ThemeConfig.SUB_TITLE_SIZE,
                  op: buttonOnpressed,
                  type: "filled",
                  bwidth: 20,
                  isDisabled: false,
                  isIcon: false,
                  isLoading: false,
                )),
          ],
        ));
  }
}
