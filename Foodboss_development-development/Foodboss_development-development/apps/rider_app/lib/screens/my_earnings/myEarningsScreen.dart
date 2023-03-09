import 'package:flutter/material.dart';
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/widgets/Heading.dart';
import 'package:rider_app/widgets/text_widgets/heading_widget.dart';
import 'package:shared_widgets/shared_widgets.dart';

class MyEarningsScreen extends StatelessWidget {
  const MyEarningsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(appbarFunc: (){},
      bottombar: false,
      appBar: true,
      title: 'My Earnings',
      color: ThemeConfig.PRIMARY_COLOR,
      child: Center(
        child: HeadingText(titleString: 'Comming Soon',),
      ),
    );
  }
}
