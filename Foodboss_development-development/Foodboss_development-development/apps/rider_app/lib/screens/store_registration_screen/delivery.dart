import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/business_controller/store_registration/delivery_controller.dart';
import 'package:rider_app/screens/store_registration_screen/map_radius.dart';
import 'package:rider_app/screens/store_registration_screen/openDaysSection.dart';
import 'package:rider_app/screens/store_registration_screen/storeTimingsSection.dart';
import 'package:rider_app/utils/states.dart';
import 'package:rider_app/widgets/button.dart';

class Delivery extends StatelessWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeliveryController controller =
        Get.put(DeliveryController(), permanent: false);

    var args = Get.arguments;
    var fromRegistration = args[0];
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          // top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20),
      child: SingleChildScrollView(
        child: Obx(
          () {
            if (controller.getStatus.value == States.SUCCESS_STATE ||
                fromRegistration == true) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.03),
                  const OpenDaysSection(),
                  SizedBox(height: size.height * 0.03),
                  StoreTimingsSection(),
                  SizedBox(height: size.height * 0.02),
                  // MinimumOrder(),
                  // SizedBox(height: size.height * 0.03),
                  // DeliveryRadiusSection(),
                  MapRadius(),
                  SizedBox(height: size.height * 0.03),
                  // DeliveryTimes(),
                  // SizedBox(height: size.height * 0.03),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          text: 'Submit',
                          type: 'filled',
                          op: () {
                            controller.addLocalData(context);
                            // controller.updateSettings();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
