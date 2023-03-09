import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/UI%20Controllers/main_screen_ui_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/map_address_controller.dart';
import 'package:customer_app/Models/address_model.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/components/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class ManageAddressScreen extends StatelessWidget {
  ManageAddressScreen({Key? key}) : super(key: key);

  MapAdressController mapAdressController = Get.find<MapAdressController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.whiteColor,
      appBar: customAppBar('My Addresses'),
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              bool isLocationEnabled = await Location.instance.serviceEnabled();
              if (isLocationEnabled) {
                mapAdressController.getloc();
                Get.toNamed('/pick-location-screen', arguments: [false, 0]);
              } else {
                Get.defaultDialog(
                    title: "Alert",
                    contentPadding: EdgeInsets.all(0),
                    titlePadding: EdgeInsets.only(top: 20),
                    titleStyle: TextStyle(fontWeight: FontWeight.bold),
                    content:
                        BottomSheetLocation(op: mapAdressController.getloc),
                    barrierDismissible: false);
              }
            },
            child: Container(
              height: 50,
              width: double.infinity,
              padding: ThemeConfig.screenPadding,
              color: ThemeConfig.greyColor,
              child: Row(
                children: const [
                  Icon(
                    Icons.add_circle_outline_sharp,
                    color: ThemeConfig.secondaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  LabelText(
                    text: 'add a new address',
                    isNormal: true,
                  )
                ],
              ),
            ),
          ),
          Expanded(child: Obx(
            () {
              if (mapAdressController.allAddress.value.success == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () async => mapAdressController.getAllAddress(),
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(
                          parent: const AlwaysScrollableScrollPhysics()),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: mapAdressController
                          .allAddress.value.addressess!.length,
                      itemBuilder: (context, index) => AddressTile(
                            isSelected: index == 1,
                            address: mapAdressController
                                .allAddress.value.addressess![index],
                          )),
                );
              }
            },
          )),
        ],
      ),
    );
  }
}

class AddressTile extends StatelessWidget {
  final Address address;
  final bool isSelected;
  AddressTile({
    Key? key,
    required this.isSelected,
    required this.address,
  }) : super(key: key);

  MapAdressController mapAdressController = Get.find<MapAdressController>();
  MainScreenController mainScreenController = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: ThemeConfig.screenPadding,
      color: ThemeConfig.whiteColor,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(
                text: address.label != '' ? address.label! : 'Office',
                // isNormal: true,
              ),
              LabelText(
                text: address.fullName ?? 'Name',
                isNormal: true,
              ),
              LabelText(
                text: address.addressLine1 ?? 'Line 1',
                isNormal: true,
              ),
              LabelText(
                text: address.addressLine2 ?? 'Line 2',
                isNormal: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelText(
                    text: '${address.area}, ${address.state}',
                    isNormal: true,
                  ),
                  Container(
                    child: PopupMenuButton<int>(
                      icon: const Icon(
                        Icons.more_horiz,
                      ),
                      color: Colors.white,
                      offset: const Offset(0, 0),
                      itemBuilder: (context) => address.isDefault!
                          ? [
                              const PopupMenuItem<int>(
                                  value: 0,
                                  child: MainLabelText(
                                    text: 'Edit',
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                  )),
                            ]
                          : [
                              const PopupMenuItem<int>(
                                  value: 0,
                                  child: MainLabelText(
                                    text: 'Edit',
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                  )),
                              const PopupMenuItem<int>(
                                  value: 1,
                                  child: MainLabelText(
                                    text: 'Set as Default',
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                  )),
                              const PopupMenuItem<int>(
                                  value: 2,
                                  child: MainLabelText(
                                    text: 'Delete',
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                  )),
                            ],
                      onSelected: (item) {
                        if (item == 2) {
                          mapAdressController.deleteAddress(address.id);
                        }
                        if (item == 0) {
                          mapAdressController.fromUpdate(address.id);
                          Get.toNamed('/pick-location-screen',
                              arguments: [true, address.id]);
                        }
                        if (item == 1) {
                          if (address.isDefault != true) {
                            address.isDefault = true;
                            mapAdressController.updateAddress(
                                address, mainScreenController);
                          }
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
          address.isDefault!
              ? Positioned(
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: ThemeConfig.secondaryColorLite,
                        border: Border.all(
                            width: 0.5, color: ThemeConfig.secondaryColor),
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: const [
                        LabelText(text: 'Selected'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.check_circle_rounded,
                          color: ThemeConfig.secondaryColor,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
  

// class CustomSwitch extends StatefulWidget {
//    bool valuee;
//    CustomSwitch({
//     Key? key, required this.valuee,
//   }) : super(key: key);



//   @override
//   State<CustomSwitch> createState() => _CustomSwitchState();
// }

// class _CustomSwitchState extends State<CustomSwitch> {

 
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
