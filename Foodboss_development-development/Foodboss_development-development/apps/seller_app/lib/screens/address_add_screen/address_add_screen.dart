import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seller_app/controller/business_controller/store_registration/store_registration_controller.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/UI%20controller/map_adress.dart/change_adress.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/text_widgets/title_subtitle.dart';

class AddressAddScreen extends StatelessWidget {
  const AddressAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapAdressController controller = Get.find<MapAdressController>();
    StoreRegistrationController controllerRegistration =
        Get.find<StoreRegistrationController>();
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
                  SizedBox(height: 40),
                  SmallRoundedInputField(
                    controller: controller.controllerText.value['add1']!,
                    hintText: 'Address line 1',
                    onChange: (value) {
                      controllerRegistration.addShopAddress(value);
                    },
                  ),
                  SizedBox(height: 20),
                  SmallRoundedInputField(
                    controller: controller.controllerText.value['add2']!,

                    hintText: 
                         "Address line 2",

                    onChange: (value) {
                      controllerRegistration.addShopAddress2(value);
                    },
                  ),
                  SizedBox(height: 20),
                  SmallRoundedInputField(
                    controller: controller.controllerText.value['area']!,
                    hintText: "Area",
                    onChange: (val) {
                      controllerRegistration.addShopArea(val);
                    },
                  ),
                  SizedBox(height: 20),
                  SmallRoundedInputField(
                    controller: controller.controllerText.value['city']!,
                    hintText: "City",
                    onChange: (val) {
                      controllerRegistration.addShopCity(val);
                    },
                  ),
                  SizedBox(height: 20),
                  SmallRoundedInputField(
                    controller: controller.controllerText.value['state']!,
                    hintText: "State",
                    onChange: (val) {
                      controllerRegistration.addShopState(val);
                    },
                  ),
                  SizedBox(height: 20),
                  SmallRoundedInputField(
                    controller: controller.controllerText.value['country']!,
                    hintText: controller.country,
                    onChange: (val) {
                      // controllerRegistration.add
                    },
                  ),
                  SizedBox(height: 20),
                  SmallRoundedInputField(
                    controller: controller.controllerText.value['zip']!,
                    hintText: "Zip",
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: (controller
                                        .controllerText.value['add1']!.text ==
                                    '' ||
                                controller
                                        .controllerText.value['area']!.text ==
                                    '' ||
                                controller
                                        .controllerText.value['city']!.text ==
                                    '' ||
                                controller.controllerText.value['country']!
                                        .text ==
                                    '' ||
                                controller.controllerText.value['zip']!.text ==
                                    '' )
                            ? DisabledButton(
                                text: "Next", op: () {}, type: "outlined")
                            : Obx(()=>controllerRegistration.isLoading.value == false? PrimaryButton(
                                  text: "NEXT",
                                  op: () {
                                    print(controller
                                        .controllerText.value['add1']!.text);
                                    if (controller.controllerText.value['add1']!
                                                .text ==
                                            '' ||
                                        controller.controllerText.value['area']!
                                                .text ==
                                            '' ||
                                        controller.controllerText.value['city']!
                                                .text ==
                                            '' ||
                                        controller.controllerText
                                                .value['country']!.text ==
                                            '' ||
                                        controller.controllerText.value['zip']!
                                                .text ==
                                            '') {
                                      CustomSnackbar.errorSnackbar2(
                                          'Please fill all details');
                                    } else {
                                      controllerRegistration.addShop();
                                    }
                                    // Get.toNamed("/delivery-schedule");
                                  },
                                  type: "filled",
                                ):DisabledButton(text: "Loading", op: (){}, type: "outlined"),
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
