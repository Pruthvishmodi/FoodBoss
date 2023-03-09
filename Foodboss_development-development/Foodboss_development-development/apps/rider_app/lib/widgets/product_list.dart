import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class ProductList extends StatelessWidget {
  final String img;
  final String name;
  final String name1;
  final String mass;
  final String unit;

  final String weight;
  final String price;

  const ProductList(
      {Key? key,
      required this.img,
      required this.name,
      required this.weight,
      required this.price,
      required this.name1,
      required this.mass,
      required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(height: 100, width: 100, child: Image.network(img)),
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name1,
                      style: const TextStyle(
                          color: ThemeConfig.MAIN_TEXT_COLOR,
                          fontSize: ThemeConfig.SUB_TITLE_SIZE,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.00),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .44),
                      child: Text(
                        name,
                        style: const TextStyle(
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            fontSize: ThemeConfig.SUB_TITLE_SIZE,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.00),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '${mass} x ${weight}${unit} ',
                      style: TextStyle(
                          color: ThemeConfig.SECONDARY_TEXT_COLOR,
                          fontSize: ThemeConfig.SUB_TITLE_SIZE,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.00),
                    ),
                  ],
                ),
              ]),
              Text(
                "\u{20B9} $price ",
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
