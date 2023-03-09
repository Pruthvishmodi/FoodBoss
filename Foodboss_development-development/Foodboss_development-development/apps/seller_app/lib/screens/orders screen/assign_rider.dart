import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:seller_app/controller/business_controller/driver/driver_controller.dart';
import 'package:seller_app/controller/business_controller/orders/orderlist_controller.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/no_orders.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/screens/my_delivery_boy_screen/my_delivery_boys_screen.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:seller_app/widgets/otp_form.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';

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
    DriverController driverController =
        Get.put(DriverController(), permanent: false);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          foregroundColor: ThemeConfig.WHITE_COLOR,
          backgroundColor: ThemeConfig.PRIMARY_COLOR,
          title: const Text(
            "Assign delivery boy",
            style: TextStyle(
              color: ThemeConfig.WHITE_COLOR,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: size.width,
              height: size.height - 100,
              child: Obx(() {
                if (driverController.myDriverDataStatus.value ==
                    States.LOADING_STATE) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (driverController.getMyDriverList.isEmpty) {
                  return const Center(
                    child: Desc(descString: 'No delivery boy found'),
                  );
                } else {
                  return RefreshIndicator(
                      child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(10),
                          itemBuilder: ((context, index) => CardDeliveryBoy(
                              isTrusted: driverController
                                  .getMyDriverList[index].isTrusted!,
                              id: driverController
                                          .getMyDriverList[index].riderId !=
                                      null
                                  ? driverController
                                      .getMyDriverList[index].riderId!
                                  : 0,
                              name: driverController
                                  .getMyDriverList[index].riderName
                                  .toString(),
                              phone: driverController
                                  .getMyDriverList[index].phone
                                  .toString(),
                              time:
                                  '${driverController.getMyDriverList[index].startDeliveryTimings.toString()} to ${driverController.getMyDriverList[index].endDeliveryTimings.toString()}',
                              img: driverController
                                          .getMyDriverList[index].hasMedia ==
                                      true
                                  ? driverController
                                      .getMyDriverList[index].imagePath![0].url
                                      .toString()
                                  : ThemeConfig.NOIMAGELINK)),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 1,
                              ),
                          itemCount: driverController.getMyDriverList.length),
                      onRefresh: () async {
                        await driverController.getMyDriversData();
                      });
                }
              }),
            ),
          ),
        ));
  }
}

class CardDeliveryBoy extends StatelessWidget {
  final int id;
  final String name;
  final String phone;
  final String time;
  final String img;
  final bool isTrusted;
  const CardDeliveryBoy(
      {Key? key,
      required this.name,
      required this.phone,
      required this.time,
      required this.img,
      required this.id,
      required this.isTrusted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderListController ctrl = Get.find<OrderListController>();
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.,
            children: [
              LabelText(titleString: time),
              LabelText(titleString: isTrusted ? 'Trusted' : 'Not Trusted'),
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
                  image: NetworkImage(img),
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
          const SizedBox(
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
                    op: () async {
                      await ctrl.assignRider(
                        driver_id: id,
                        isTrusted: isTrusted,
                      );
                      // openBottomsheet(id);
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

class OtpFormFields extends StatelessWidget {
  final int driver_id;
  OtpFormFields({
    Key? key,
    required this.driver_id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OrderListController ctrl = Get.find<OrderListController>();
    return PinCodeTextField(
      backgroundColor: Colors.transparent,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      showCursor: false,
      textStyle: const TextStyle(
          fontSize: 45,
          fontFamily: 'Digit',
          color: ThemeConfig.MAIN_TEXT_COLOR),
      hintCharacter: '8',
      hintStyle: TextStyle(
          fontSize: 45,
          fontFamily: 'Digit',
          color: Colors.grey.withOpacity(.2)),
      enablePinAutofill: true, keyboardType: TextInputType.number,
      length: 4,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 70,
          fieldWidth: 60,
          activeFillColor: Colors.transparent,
          activeColor: Colors.transparent,
          selectedColor: Colors.transparent,
          inactiveColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          inactiveFillColor: Colors.transparent),
      enableActiveFill: true,
      // controller: textEditingController.textEditingController.value,
      onCompleted: (v) {
        ctrl.pickUp(pick_up: v, driver_id: driver_id);
        
      },
      onChanged: (value) {},
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
}
