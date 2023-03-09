import 'package:flutter/material.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:seller_app/widgets/text_widgets/heading_widget.dart';

class CommingSoon extends StatelessWidget {
  const CommingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      appBar: false,
      appbarFunc: () {},
      bottombar: false,
      child: const Center(
        child: HeadingText(
          titleString: "Comming soon",
        ),
      ),
    );
  }
}
