import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/driver/driver_controller.dart';
import 'package:seller_app/screens/my_delivery_boy_screen/deliver_boy_card.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';

class NewDeliveryBoysScreen extends StatefulWidget {
  const NewDeliveryBoysScreen({Key? key}) : super(key: key);

  @override
  _NewDeliveryBoysScreenState createState() => _NewDeliveryBoysScreenState();
}

class _NewDeliveryBoysScreenState extends State<NewDeliveryBoysScreen> {
  @override
  Widget build(BuildContext context) {
    DriverController driverController =
        Get.put(DriverController(), permanent: false);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: size.height,
          constraints: const BoxConstraints(maxWidth: 550),
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.01),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: SmallRoundedInputField(
                  hintText: "Search",
                  tailingIcon: Icons.search,
                  textType: TextInputType.number,
                  onChange: (val) {
                    if (val == "") {
                      driverController.getAllDriversData();
                    } else {
                      driverController.searchFromAllDriver(val);
                    }
                  },
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (driverController.allDriverDataStatus.value !=
                      States.SUCCESS_STATE) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: driverController.getDriverList.length,
                        itemBuilder: (context, index) {
                          return DeliveryCard(
                            driver: driverController.getDriverList[index],
                            canAdd: true,
                          );
                        });
                  }
                }),
              ),
            ],
          ),
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
