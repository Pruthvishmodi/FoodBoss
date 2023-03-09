import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
class ProductStore extends StatelessWidget {
  const ProductStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Store"),
      ),
      body: Row(
        children: [
          Container(
            width: size.width*.20,
            color: ThemeConfig.PRIMARY_COLOR,
            child: Column(
              children: [
              //  TabBar(tabs: tabs,)
              ],
            ),
          ),
          Container(
            width: size.width*.80,
            color: ThemeConfig.DISTRUCTIVE_COLOR,
          ),
        ],
      ),
    );
  }
}