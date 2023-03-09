import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/store_registration/delivery_controller.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/label_widget.dart';

class MinimumOrder extends StatelessWidget {
  MinimumOrder({Key? key}) : super(key: key);
  // ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    DeliveryController controller = Get.find<DeliveryController>();
    controller.minimum.value;
    Size size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelText(titleString: 'Minimum Order Amount'),
          SizedBox(
            height: size.height * 0.02,
          ),
          SmallRoundedInputField(
            hintText: controller.minimum.value == ''
                ? 'Enter minimum order amount'
                : controller.minimum.value,
            // profileController.getUser.minimumOrderPrice == '' && profileController.getUser.minimumOrderPrice == null
            //     ? 'Enter minimum amount'
            //     : profileController.getUser.minimumOrderPrice!,
            textType: TextInputType.number,
            labelText: 'Order',
            controller: controller.minController.value,
            onChange: (value) {
              // controller.minController.value.text = value;
              controller.minimum.value = value;
            },
          ),
        ]);
  }
}
