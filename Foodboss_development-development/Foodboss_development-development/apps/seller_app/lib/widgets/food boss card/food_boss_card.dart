import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class FoodBossCard extends StatelessWidget {
  final List<Widget> list;
  const FoodBossCard({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.00),
        color: ThemeConfig.WHITE_COLOR,
      ),
      margin: const EdgeInsets.all(20.00),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                bottom: 10.00, left: 20.00, right: 20.00, top: 30.00),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: list[0],
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: list[1],
                ),
              ],
            ),
          )
          ,
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.00),
                bottomRight: Radius.circular(20.00),
              ),
              color: ThemeConfig.FORM_COLOR,
            ),
            padding: const EdgeInsets.all(20.00),
            child: list[2],
          ),
        ],
      ),
    );
  }
}
