import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/UI%20controller/map_adress.dart/change_adress.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/main_label.dart';
import 'package:shimmer/shimmer.dart';

class AddressPart extends StatelessWidget {
  const AddressPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapAdressController controller = Get.find<MapAdressController>();
    return Container(
        height: 300,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        children: [

                          controller.loading.value == true ? Container(width: 150,height: 40,color: ThemeConfig.FORM_COLOR,) : MainLabelText(titleString: controller.mainAddress),
                          const SizedBox(
                            height: 5,
                          ),
                         controller.loading.value == true ? Container(width: 350, height: 40,color: ThemeConfig.FORM_COLOR,) : Desc(
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
            Spacer(),
            // Expanded(child: Container()),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: "CONFIRM & PROCEED",
                    op: () {
                      controller.submitAddress();
                      Get.toNamed("/store-address");
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
