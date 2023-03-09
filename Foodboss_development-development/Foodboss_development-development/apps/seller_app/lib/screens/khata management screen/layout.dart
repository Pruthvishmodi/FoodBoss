import 'package:flutter/material.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/screens/khata%20management%20screen/khata_management_screen.dart';

class KhataPage extends StatelessWidget {
  const KhataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Khata Management",
      bottombar: false,
      color: ThemeConfig.PRIMARY_COLOR,
      appBar: true,
      appbarFunc: () {},
      child:  KhataManagement(),
    );
  }
}
