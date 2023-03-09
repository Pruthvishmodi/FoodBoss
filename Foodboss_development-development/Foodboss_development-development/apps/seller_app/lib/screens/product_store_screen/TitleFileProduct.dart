import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/my_store/store_details_controller.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class TitleProduct extends StatelessWidget {
  const TitleProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreDetailsController controller = Get.find<StoreDetailsController>();
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => controller.loading.value == false
                ? LabelText(
                    titleString: controller.data.value.data != null
                        ? controller.data.value.data!.name!
                        : "",
                  )
                : Container(
                    // width: 100,
                    height: 50,
                    color: ThemeConfig.FORM_COLOR,
                  ),
          ),
        ),
      ],
    );
  }
}
