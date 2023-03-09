import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/UI%20controller/map_adress.dart/change_adress.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';

class AddressPart extends StatelessWidget {
  const AddressPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapAdressController controller = Get.find<MapAdressController>();
    return Container(
      height: 250,
        padding: const EdgeInsets.all(10.00),
        color: ThemeConfig.WHITE_COLOR,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainLabelText(titleString: "select your delivery location"),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 85,
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 40.00,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    // height: 100,
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          MainLabelText(titleString: controller.mainAddress),
                          const SizedBox(
                            height: 5,
                          ),
                          Desc(
                            descString: controller.currentAddress,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(child: Container()),
            
            Divider(),
            // Expanded(child: Container()),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: "CONFIRM & PROCEED",
                    op: () {
                      controller.submitAddress();
                    },
                    type: "filled",
                  ),
                ),
              ],
            ),
            // SizedBox(height: 10),
          ],
        ));
  }
}
