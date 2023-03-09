import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class BodyContainer extends StatelessWidget {

  final Widget child;
  const BodyContainer({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children:[ Container(
        color: ThemeConfig.FORM_COLOR,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal :size.width * 0.07 ,),
          child: child,
      ),]
    );
  }
}