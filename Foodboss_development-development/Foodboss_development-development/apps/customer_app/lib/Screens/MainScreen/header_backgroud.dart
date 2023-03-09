import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/UI%20Controllers/map_address_controller.dart';
import 'package:customer_app/Models/address_model.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HeaderBackground extends StatelessWidget {
  const HeaderBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapAdressController controller = Get.find<MapAdressController>();

    return Container(
      padding: ThemeConfig.screenPadding,
      child: Obx(
        () {
          if (controller.allAddress.value.success == null) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.toNamed('/manage-address-screen');
              },
              child: Shimmer.fromColors(
                  child: Container(
                    padding: ThemeConfig.screenPadding,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 20,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  enabled: true,
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[50]!),
            );
          } else {
            var selectedAddress = controller.allAddress.value.addressess!
                .firstWhere((element) => element.isDefault == true,
                    orElse: () => Address());

            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.toNamed('/manage-address-screen');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SB.large(),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: ThemeConfig.primaryColor,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                MainLabelText(
                                  text: selectedAddress.id == null
                                      ? 'Area not selected'
                                      : controller.allAddress.value.addressess!
                                          .firstWhere((element) =>
                                              element.isDefault == true)
                                          .label!,
                                  isBold: true,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  size: 30,
                                ),
                              ],
                            ),
                            // SB.small(),
                            LabelText(
                                isDotDot: true,
                                text: selectedAddress.id == null
                                    ? 'Please select default address'
                                    : '${selectedAddress.addressLine1}, ${selectedAddress.addressLine2 != null ? selectedAddress.addressLine2 : null}, ${selectedAddress.city}, ${selectedAddress.state}, ${selectedAddress.zip}, ${selectedAddress.country}'),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: ThemeConfig.secondaryColor,
                            )),
                        child: Icon(
                          Icons.arrow_right_rounded,
                          size: 25,
                          color: ThemeConfig.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  SB.large(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
