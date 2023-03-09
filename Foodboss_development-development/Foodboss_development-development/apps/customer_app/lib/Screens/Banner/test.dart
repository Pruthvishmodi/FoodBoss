import 'package:customer_app/Screens/Banner/CustomBanner.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SafeArea(child: 
      Container(height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomBanner(image: AssetImage('assets/images/123.jpg',), aspect: '',)
          ],
        ),
      )),
    );
  }
}