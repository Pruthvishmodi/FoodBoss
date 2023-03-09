import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/my_store/store_details_controller.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class Availablity extends StatelessWidget {
  const Availablity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreDetailsController controller = Get.find<StoreDetailsController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => controller.loading.value == false
              ? LabelText(titleString: "Available")
              : Container(
                  width: 100,
                  height: 20,
                  color: ThemeConfig.FORM_COLOR,
                ),
        ),
        Obx(
          () => controller.loading.value == false
              ? Switch.adaptive( 
                  value: controller.data.value.data != null
                      ? controller.data.value.data!.isAvailable != null
                          ? controller.data.value.data!.isAvailable!
                          : false
                      : false,
                  onChanged: (val) {
                    controller.changeAvailablity();
                  })
              : Container(
                  width: 30,
                  height: 20,
                  color: ThemeConfig.FORM_COLOR,
                ),
        ),
      ],
    );
  }
}
