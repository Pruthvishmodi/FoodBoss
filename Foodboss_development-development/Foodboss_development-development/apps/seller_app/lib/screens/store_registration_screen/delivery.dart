import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/store_registration/delivery_controller.dart';
import 'package:seller_app/screens/store_registration_screen/deliveryTimingSection.dart';
import 'package:seller_app/screens/store_registration_screen/deliveyTimes.dart';
import 'package:seller_app/screens/store_registration_screen/map_radius.dart';
import 'package:seller_app/screens/store_registration_screen/minimum_order.dart';
import 'package:seller_app/screens/store_registration_screen/openDaysSection.dart';
import 'package:seller_app/screens/store_registration_screen/storeTimingsSection.dart';
import 'package:seller_app/widgets/button.dart';

class Delivery extends StatelessWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeliveryController controller =
        Get.put(DeliveryController(), permanent: false);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20),
      child: SingleChildScrollView(
        child: Obx(
          () => controller.settingsLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const OpenDaysSection(),
                    SizedBox(height: size.height * 0.03),
                    StoreTimingsSection(),
                    SizedBox(height: size.height * 0.02),
                    DeliveryTimingSection(),
                    SizedBox(height: size.height * 0.03),
                    MinimumOrder(),
                    SizedBox(height: size.height * 0.03),
                    // DeliveryRadiusSection(),

                    const MapRadius(),
                    SizedBox(height: size.height * 0.03),
                    const DeliveryTimes(),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            text: 'Submit',
                            type: 'filled',
                            op: () {
                              controller.addLocalData(context);
                              // controller.updateSettings(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
        ),
      ),
    );
  }
}
