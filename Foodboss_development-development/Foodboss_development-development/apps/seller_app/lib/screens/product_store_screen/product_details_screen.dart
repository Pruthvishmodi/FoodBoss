import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/my_store/store_details_controller.dart';
import 'package:seller_app/screens/product_store_screen/Available.dart';
import 'package:seller_app/screens/product_store_screen/DescriptionAndIngredients.dart';
import 'package:seller_app/screens/product_store_screen/ImageProduct.dart';
import 'package:seller_app/screens/product_store_screen/ProductVarients.dart';
import 'package:seller_app/screens/product_store_screen/TitleFileProduct.dart';
import 'package:seller_app/screens/product_store_screen/stock_and_price.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreDetailsController controller =
        Get.put(StoreDetailsController(), permanent: false);
    return Scaffold(
      backgroundColor: ThemeConfig.WHITE_COLOR,
      appBar: AppBar(
          elevation: 0,
          title: Obx(
            () => controller.loading.value == false
                ? Text(
                    controller.data.value.data != null
                        ? controller.data.value.data!.name!.split('-')[0]
                        : "",
                  )
                : Container(
                    width: 100,
                    height: 20,
                    color: ThemeConfig.FORM_COLOR.withOpacity(0.5),
                  ),
          ),
          foregroundColor: ThemeConfig.WHITE_COLOR,
          backgroundColor: ThemeConfig.PRIMARY_COLOR),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 20),
            TitleProduct(),
            SizedBox(height: 20),
            ImageProduct(),
            SizedBox(height: 20),
            Availablity(),
            SizedBox(height: 20),
            Obx(
              () => controller.loading.value == false
                  ? Row(
                      children: [
                        MainLabelText(
                            titleString:
                                controller.data.value.data!.weight.toString()),
                        SizedBox(
                          width: 2,
                        ),
                        MainLabelText(
                            titleString:
                                controller.data.value.data!.unit.toString()),
                      ],
                    )
                  : Container(
                      width: 100,
                      height: 20,
                      color: ThemeConfig.FORM_COLOR,
                    ),
            ),
            SizedBox(height: 20),

            Description(),
            SizedBox(height: 20),
            StockAndPrice(),
            SizedBox(height: 20),
            ProductVarients(),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: "UPDATE",
                    op: () async {
                      await controller.storeUpdateController(context);
                    },
                    type: "filled",
                  ),
                ),
              ],
            )
          ],
        ),
      ))),
    );
  }
}
