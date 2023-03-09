import 'package:flutter/material.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:seller_app/widgets/main_label.dart';
import 'package:seller_app/widgets/text_widgets/title_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class NoProductsFoundScreen extends StatelessWidget {
  final VoidCallback op;
  final Function op_on_refresh;
  const NoProductsFoundScreen(
      {Key? key, required this.op, required this.op_on_refresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        await op_on_refresh();
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: 200,
                image: AssetImage('assets/images/add-product.png'),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    Expanded(
                      child: const TitleText(
                        titleString: "Add Products to your online store",
                        // style: TextStyle(
                        //   color: ThemeConfig.MAIN_TEXT_COLOR,
                        //   fontSize: 30,
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                width: 300,
                child: const Desc(
                  descString:
                      "It will take few seconds to add products from our global store",
                  // style: TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR, fontSize: 15),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                width: 200,
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        text: "Global Store",
                        op: op,
                        type: "filled",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Desc(
                    descString: "Already added items?",
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await op_on_refresh();
                    },
                    child: LabelText(
                      titleString: "Refresh",
                    ),
                  ),
                ],
              )
              // NoProductsButton(
              //   size: size,
              //   text: 'Global Store',
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class NoProductsButton extends StatelessWidget {
  const NoProductsButton({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        CustomSnackbar.SucessSnackbar('Gajab thayi gayu!! Miracle miracle!! ');
      }),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: ThemeConfig.PRIMARY_COLOR),
        width: size.width * 0.4,
        height: size.height * 0.05,
        // color: ThemeConfig.PRIMARY_COLOR,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
              const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
