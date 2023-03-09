import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/my_store/store_details_controller.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class StockAndPrice extends StatelessWidget {
  const StockAndPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreDetailsController controller = Get.find<StoreDetailsController>();
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => controller.loading.value == false
                    ? LabelText(titleString: "My Price")
                    : Container(
                        width: 80,
                        height: 20,
                        color: ThemeConfig.FORM_COLOR,
                      ),
              ), 
              SizedBox(height: 10),
              Obx(
                () => controller.loading.value == false
                    ? SmallRoundedInputField(
                        textType: TextInputType.number,
                        tailingIcon: Icons.currency_rupee,
                        controller: controller.data.value.data != null
                            ? controller.data.value.data!.foodsUsers != null
                                ? controller.data.value.data!.foodsUsers!
                                    .priceController
                                : null
                            : null,
                        hintText: "1000",
                        onChange: (val) {
                          controller.changePrice(val);
                        })
                    : Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: ThemeConfig.FORM_COLOR,
                          borderRadius: BorderRadius.circular(
                              ThemeConfig.BORDERRADIUS_MAX),
                        )),
              ),
            ],
          ),
        ),
        SizedBox(width: 50),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => controller.loading.value == false
                    ? LabelText(titleString: "Stock")
                    : Container(
                        width: 80,
                        height: 20,
                        color: ThemeConfig.FORM_COLOR,
                      ),
              ),
              SizedBox(height: 10),
              Obx(
                () => controller.loading.value == false
                    ? SmallRoundedInputField(
                        controller: controller.data.value.data != null
                            ? controller.data.value.data!.foodsUsers != null
                                ? controller.data.value.data!.foodsUsers!
                                    .stockController
                                : null
                            : null,
                        hintText: "2000",
                        textType: TextInputType.number,
                        tailingIcon: Icons.balance,
                        onChange: (val) {
                          controller.changeStock(val);
                        })
                    : Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: ThemeConfig.FORM_COLOR,
                          borderRadius: BorderRadius.circular(
                            ThemeConfig.BORDERRADIUS_MAX,
                          ),
                        )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
