import 'package:flutter/material.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/screens/new_delivery_boy_screen/new_delivery_boys_screen.dart';

class AddDeliveryBoyPage extends StatelessWidget {
  const AddDeliveryBoyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: const Text('Add Delivery Boy',),
        backgroundColor: ThemeConfig.PRIMARY_COLOR, 
        foregroundColor: ThemeConfig.WHITE_COLOR,
        elevation: 0,
      ),
      body: const NewDeliveryBoysScreen(),
    );
  }
}
