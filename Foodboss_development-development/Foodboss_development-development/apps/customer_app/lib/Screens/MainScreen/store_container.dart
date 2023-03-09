import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Models/shop_model.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreContainer extends StatelessWidget {
  const StoreContainer({
    Key? key,
    required this.shopModel,
  }) : super(key: key);
  final ShopModel shopModel;

  @override
  Widget build(BuildContext context) {
    StoreProductController storeProductController =
        Get.put(StoreProductController());
    return GestureDetector(
        onTap: () {
          // print(shopModel.toJson().toString());

          if (!shopModel.isShopClose!) {
            storeProductController.setStoreWithoutCat(shopModel);
            Get.toNamed('/store-products-screen');
          } else {
            CustomSnackbar.infoSnackbar('Store is temporary closed');
          }
        },
        child: Container(
          width: 120.0,
          height: 140,
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
          // padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
            border: Border.all(color: ThemeConfig.borderColor, width: 1),
            color: ThemeConfig.whiteColor,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      // bottomLeft: Radius.circular(10),
                      // bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Container(
                    foregroundDecoration: shopModel.isShopClose!
                        ? BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                            backgroundBlendMode: BlendMode.saturation,
                          )
                        : null,
                    child: Image.network(
                      shopModel.shopImage!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(maxWidth: 110),
                    child: Center(
                        child: Text(
                      shopModel.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: ThemeConfig.labelSize),
                      overflow: TextOverflow.ellipsis,
                    )),
                  )),
            ],
          ),
        ));
  }
}
