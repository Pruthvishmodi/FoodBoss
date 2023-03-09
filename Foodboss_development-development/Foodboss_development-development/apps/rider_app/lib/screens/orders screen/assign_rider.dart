import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/screens/my_delivery_boy_screen/my_delivery_boys_screen.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:rider_app/widgets/otp_form.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';

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

class AssignRiderPage extends StatelessWidget {
  const AssignRiderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: ThemeConfig.WHITE_COLOR,
          backgroundColor: ThemeConfig.PRIMARY_COLOR,
          title: Text(
            "Assign delivery boy",
            style: TextStyle(
              color: ThemeConfig.WHITE_COLOR,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // CardDeliveryBoy(name: "name", phone: phone, time: time, img: img)

                  CardDeliveryBoy(
                    name: deliveryBoys[0].name,
                    phone: deliveryBoys[0].mobileNumber,
                    time: deliveryBoys[0].availbleTime,
                    img: deliveryBoys[0].img,
                  ),
                  CardDeliveryBoy(
                    name: deliveryBoys[0].name,
                    phone: deliveryBoys[0].mobileNumber,
                    time: deliveryBoys[0].availbleTime,
                    img: deliveryBoys[0].img,
                  ),
                  CardDeliveryBoy(
                    name: deliveryBoys[0].name,
                    phone: deliveryBoys[0].mobileNumber,
                    time: deliveryBoys[0].availbleTime,
                    img: deliveryBoys[0].img,
                  ),
                  CardDeliveryBoy(
                    name: deliveryBoys[0].name,
                    phone: deliveryBoys[0].mobileNumber,
                    time: deliveryBoys[0].availbleTime,
                    img: deliveryBoys[0].img,
                  ),
                  CardDeliveryBoy(
                    name: deliveryBoys[0].name,
                    phone: deliveryBoys[0].mobileNumber,
                    time: deliveryBoys[0].availbleTime,
                    img: deliveryBoys[0].img,
                  ),
                  CardDeliveryBoy(
                    name: deliveryBoys[0].name,
                    phone: deliveryBoys[0].mobileNumber,
                    time: deliveryBoys[0].availbleTime,
                    img: deliveryBoys[0].img,
                  ),
                  CardDeliveryBoy(
                    name: deliveryBoys[0].name,
                    phone: deliveryBoys[0].mobileNumber,
                    time: deliveryBoys[0].availbleTime,
                    img: deliveryBoys[0].img,
                  ),
                  CardDeliveryBoy(
                    name: deliveryBoys[0].name,
                    phone: deliveryBoys[0].mobileNumber,
                    time: deliveryBoys[0].availbleTime,
                    img: deliveryBoys[0].img,
                  ),
                  CardDeliveryBoy(
                    name: deliveryBoys[0].name,
                    phone: deliveryBoys[0].mobileNumber,
                    time: deliveryBoys[0].availbleTime,
                    img: deliveryBoys[0].img,
                  ),
                  CardDeliveryBoy(
                    name: deliveryBoys[0].name,
                    phone: deliveryBoys[0].mobileNumber,
                    time: deliveryBoys[0].availbleTime,
                    img: deliveryBoys[0].img,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class CardDeliveryBoy extends StatelessWidget {
  final String name;
  final String phone;
  final String time;
  final String img;
  const CardDeliveryBoy(
      {Key? key,
      required this.name,
      required this.phone,
      required this.time,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.00),
        color: ThemeConfig.WHITE_COLOR,
      ),
      margin: const EdgeInsets.only(
        top: 20.00,
      ),
      padding: const EdgeInsets.all(20.00),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(titleString: time),
                    // Desc(descString: phone),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.00),
                  color: ThemeConfig.FORM_COLOR,
                ),
                padding: const EdgeInsets.all(10),
                child: Image(
                  image: AssetImage(img),
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainLabelText(titleString: name),
                    Desc(descString: phone),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Expanded(
              //   flex: 1,
              //   child: PrimaryButton(
              //     op: () {
              //       openBottomSheet();
              //     },
              //     text: "SET CHARGES",
              //     type: "filled",
              //   ),
              // ),
              // const SizedBox(
              //   width: 20,
              // ),
              Expanded(
                  flex: 1,
                  child: PrimaryButton(
                    text: "ASSIGN",
                    op: () {
                      openBottomsheet();
                      // Get.toNamed('/deliveryboy-detail');
                    },
                    type: "filled",
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

openBottomsheet() {
  Get.bottomSheet(
    Wrap(
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                  // padding: ,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MainLabelText(titleString: "Add code")),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OtpForm(
                      index: 1,
                    ),
                    OtpForm(
                      index: 2,
                    ),
                    OtpForm(
                      index: 3,
                    ),
                    OtpForm(
                      index: 4,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: PrimaryButton(
                            text: "Assign", op: () {}, type: "filled")),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    ),
    backgroundColor: ThemeConfig.WHITE_COLOR,
  );
}
