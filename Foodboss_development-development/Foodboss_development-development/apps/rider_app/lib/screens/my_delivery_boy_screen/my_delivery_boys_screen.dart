import 'package:flutter/material.dart';
import 'package:rider_app/screens/my_delivery_boy_screen/my_earning_card.dart';

List<DeliveryBoy> deliveryBoys = [
  DeliveryBoy(
      name: 'Karan Gadani',
      mobileNumber: '+91 8400054184',
      img: 'assets/images/profile_pic.jpg',
      availbleTime: '10 - 6 PM'),
  DeliveryBoy(
      name: 'Karan Gadani',
      mobileNumber: '+91 8400054184',
      img: 'assets/images/profile_pic.jpg',
      availbleTime: '10 - 6 PM'),
  DeliveryBoy(
      name: 'Karan Gadani',
      mobileNumber: '+91 8400054184',
      img: 'assets/images/profile_pic.jpg',
      availbleTime: '10 - 6 PM'),
  DeliveryBoy(
      name: 'Karan Gadani',
      mobileNumber: '+91 8400054184',
      img: 'assets/images/profile_pic.jpg',
      availbleTime: '10 - 6 PM'),
  DeliveryBoy(
      name: 'Karan Gadani',
      mobileNumber: '+91 8400054184',
      img: 'assets/images/profile_pic.jpg',
      availbleTime: '10 - 6 PM'),
  DeliveryBoy(
      name: 'Karan Gadani',
      mobileNumber: '+91 8400054184',
      img: 'assets/images/profile_pic.jpg',
      availbleTime: '10 - 6 PM'),
  DeliveryBoy(
      name: 'Karan Gadani',
      mobileNumber: '+91 8400054184',
      img: 'assets/images/profile_pic.jpg',
      availbleTime: '10 - 6 PM'),
];

class MyDeliveryBoyScreen extends StatelessWidget {
  const MyDeliveryBoyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 550,
          ),
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.01),
          // child: Column(
          //   children: [
          //     DeliveryCard(
          //       name: 'KG',
          //       phone: deliveryBoys[0].mobileNumber,
          //       time: deliveryBoys[0].availbleTime,
          //       img: deliveryBoys[0].img,
          //     ),
          //     DeliveryCard(
          //       name: deliveryBoys[0].name,
          //       phone: deliveryBoys[0].mobileNumber,
          //       time: deliveryBoys[0].availbleTime,
          //       img: deliveryBoys[0].img,
          //     ),
          //     DeliveryCard(
          //       name: deliveryBoys[0].name,
          //       phone: deliveryBoys[0].mobileNumber,
          //       time: deliveryBoys[0].availbleTime,
          //       img: deliveryBoys[0].img,
          //     ),
          //     DeliveryCard(
          //       name: deliveryBoys[0].name,
          //       phone: deliveryBoys[0].mobileNumber,
          //       time: deliveryBoys[0].availbleTime,
          //       img: deliveryBoys[0].img,
          //     ),
          //     DeliveryCard(
          //       name: deliveryBoys[0].name,
          //       phone: deliveryBoys[0].mobileNumber,
          //       time: deliveryBoys[0].availbleTime,
          //       img: deliveryBoys[0].img,
          //     ),
          //     DeliveryCard(
          //       name: deliveryBoys[0].name,
          //       phone: deliveryBoys[0].mobileNumber,
          //       time: deliveryBoys[0].availbleTime,
          //       img: deliveryBoys[0].img,
          //     ),
          //     DeliveryCard(
          //       name: deliveryBoys[0].name,
          //       phone: deliveryBoys[0].mobileNumber,
          //       time: deliveryBoys[0].availbleTime,
          //       img: deliveryBoys[0].img,
          //     ),
          //     DeliveryCard(
          //       name: deliveryBoys[0].name,
          //       phone: deliveryBoys[0].mobileNumber,
          //       time: deliveryBoys[0].availbleTime,
          //       img: deliveryBoys[0].img,
          //     ),
          //     DeliveryCard(
          //       name: deliveryBoys[0].name,
          //       phone: deliveryBoys[0].mobileNumber,
          //       time: deliveryBoys[0].availbleTime,
          //       img: deliveryBoys[0].img,
          //     ),
          //     const SizedBox(
          //       height: 50,
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}

class DeliveryBoy {
  final String name;
  final String mobileNumber;
  final String availbleTime;
  final String img;
  DeliveryBoy(
      {required this.name,
      required this.mobileNumber,
      required this.availbleTime,
      required this.img});
}
