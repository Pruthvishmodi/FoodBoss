import 'package:flutter/material.dart';
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/screens/khata%20request/khata_request.dart';
import 'package:rider_app/widgets/app_navigation_bar.dart';
import 'package:shared_widgets/shared_widgets.dart';

class KhataRequestPageMain extends StatelessWidget {
  const KhataRequestPageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Khata Request",
        ),
        elevation: 0,
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
      ),
      body: const KhataRequest(),
    );
  }
}
