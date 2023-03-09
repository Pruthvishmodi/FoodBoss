import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/UI%20controller/map_adress.dart/change_adress.dart';
import 'package:rider_app/controller/business_controller/add_profile_controller.dart';
import 'package:rider_app/widgets/SmallRoundedInputField.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/text_widgets/title_subtitle.dart';
import 'package:shared_widgets/shared_widgets.dart';

class AddressAddScreen extends StatelessWidget {
  const AddressAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapAdressController controller = Get.find<MapAdressController>();
    AddProfileController addProfileController =
        Get.find<AddProfileController>();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        foregroundColor: ThemeConfig.WHITE_COLOR,
        elevation: 0,
        title: const Text(
          "Add Address",
          style: TextStyle(
            color: ThemeConfig.WHITE_COLOR,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Obx(
              () => Column(
                children: [
                  const SizedBox(height: 40),
                  const TitleSubTitle(
                      title: "Step 2",
                      subtitle:
                          "Add appropriate address of your store to continue."),
                  const SizedBox(height: 40),
                  SmallRoundedInputField(
                    controller: controller.controllerText.value['add1']!,

                      hintText:  'Address Line 1',
                      onChange: (value) =>
                          addProfileController.addAddressLine1(value)),
                  const SizedBox(height: 20),
                  SmallRoundedInputField(
                    hintText:addProfileController.store.value.address!.line2 == '' ? 'Address Line 2' :addProfileController.store.value.address!.line2!,
                    onChange: (value) => 
                        addProfileController.addAddressLine2(value),
                  ),
                  const SizedBox(height: 20),
                  SmallRoundedInputField(
                    hintText: addProfileController.store.value.address!.area == '' ?  'Area' : addProfileController.store.value.address!.area!,
                    onChange: (value) =>
                        addProfileController.addAddressArea(value),
                  ),
                  const SizedBox(height: 20),
                  SmallRoundedInputField(
                    hintText: addProfileController.store.value.address!.city == '' ? 'City' : addProfileController.store.value.address!.city!,
                    onChange: (value) =>
                        addProfileController.addAddressCity(value),
                  ),
                  const SizedBox(height: 20),
                  SmallRoundedInputField(
                    hintText: addProfileController.store.value.address!.state == '' ? 'State' : addProfileController.store.value.address!.state!,
                    onChange: (value) =>
                        addProfileController.addAddressState(value),
                  ),
            
                  
                  const SizedBox(height: 20),
                  SmallRoundedInputField(
                    hintText: addProfileController.store.value.address!.zip ?? 'Postal Code',
                    onChange: (value) =>
                        addProfileController.addAddressZip(value),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          text: "NEXT",
                          op: () {
                            addProfileController.addProfileDetials();
                            // Get.toNamed("/delivery-schedule");
                          },
                          type: "filled",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
