import 'package:flutter/material.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/screens/khata%20request/khata_request.dart';
import 'package:seller_app/widgets/app_navigation_bar.dart';

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
      body:  KhataRequest(),
    );
  }
}
