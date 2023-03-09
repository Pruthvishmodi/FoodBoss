import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        border:
                            Border.all(width: 2, color: Colors.grey.shade400)),
                    child: const Center(child: Text("100")),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "x",
                    style: TextStyle(
                        color: ThemeConfig.SECONDARY_TEXT_COLOR,
                        fontSize: ThemeConfig.NOTIFICATION_SIZE,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.00),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "TATA Sev ",
                        style: TextStyle(
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            fontSize: ThemeConfig.SUB_TITLE_SIZE,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.00),
                      ),
                      const Text(
                        "1 kg ",
                        style: TextStyle(
                            color: ThemeConfig.SECONDARY_TEXT_COLOR,
                            fontSize: ThemeConfig.SUB_TITLE_SIZE,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.00),
                      ),
                    ],
                  ),
                ]),
              ),
              const Text(
                "Rs15.43 ",
                style: TextStyle(
                    color: ThemeConfig.PRIMARY_COLOR,
                    fontSize: ThemeConfig.SUB_TITLE_SIZE,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.00),
              ),
              // SizedBox(width: 5,),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        ),
      ],
    );
  }
}
