import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/driver/driver_controller.dart';
import 'package:seller_app/screens/my_delivery_boy_screen/deliver_boy_card.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/no_driver_added.dart';
import 'package:shared_widgets/shared_widgets.dart';

class MyDeliveryBoyScreen extends StatelessWidget {
  const MyDeliveryBoyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    DriverController driverController =
        Get.put(DriverController(), permanent: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        constraints: const BoxConstraints(
          maxWidth: 550,
        ),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.01),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
              ),
              child: const SmallRoundedInputField(
                hintText: "Search",
                tailingIcon: Icons.search,
                textType: TextInputType.name,
              ),
            ),
            Obx(
              () {
                if (driverController.myDriverDataStatus != States.SUCCESS_STATE) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () {
                        return driverController.refreshList();
                      },
                      child:
                      driverController.getMyDriverList.length == 0? NoDriverAdded(button:()  => Get.toNamed('/deliveryboys/add'),):
                       ListView.builder(
                          itemCount: driverController.getMyDriverList.length,
                          itemBuilder: ((context, index) {
                            return Dismissible(
                              direction: DismissDirection.endToStart,
                              confirmDismiss: (dis) async {
                                return await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      title: const Text("Confirm"),
                                      content: const Text(
                                          "Are you sure you wish to delete this item?"),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text(
                                            "CANCEL",
                                            style: TextStyle(
                                                color: ThemeConfig.WHITE_COLOR),
                                          ),
                                        ),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateColor.resolveWith(
                                                        (states) => Colors.red)),
                                            onPressed: () {
                                              Navigator.of(context,rootNavigator: true).pop();
                                              driverController.removeDriver(driverController.getMyDriverList[index].riderId.toString(), context);
                                            },
                                            child: const Text(
                                              "DELETE",
                                              style: TextStyle(
                                                  color: ThemeConfig.WHITE_COLOR),
                                            )),
                                      ],
                                    );
                                  },
                                );
                              },
                              onDismissed: (direction) {},
                              background: Container(
                                margin: const EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.delete,
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              key: UniqueKey(),
                              child: MyDeliveryCard(
                                driver: driverController.getMyDriverList[index],
                                canAdd: false,
                              ),
                            );
                          })),
                    ),
                  );
                }
              },
            ),
          ],
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
