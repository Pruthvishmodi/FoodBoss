import 'package:customer_app/Controller/Business%20Controllers/cart_controller.dart';
import 'package:customer_app/Models/network_call_models.dart/product_detail_call.dart';
import 'package:customer_app/Models/shop_model.dart';
import 'package:customer_app/Services/general_services.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var product = ProductDetailCall().obs;
  CartController cartController = Get.find<CartController>();
  var isLoading = false.obs;
  fetchProductDetails(
    shopId,
    productId,
    quantity,
    vid,
  ) async {
    try {
      isLoading.value = true;
      var call = await GeneralServices.getProductDetials(shopId, productId);
      if (call != null) {
        product.value = call;
        product.value.product!.shop = ShopModel(id: shopId);
        product.value.product!.quantity = quantity;
        product.value.product!.selectedVaritent = product
            .value.product!.variants!
            .indexWhere((element) => element.id == vid);
        product.refresh();
        isLoading.value = false;
      } else {
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  addToCart() async {
    print(product.value.product!.id!);
    print(product.value.product!.shop!.id!);
    print(product.value.product!.quantity!);
    print(product.value.product!.selectedVaritent!);
    var call = await cartController.addToCARTDIRECTLY(
        product.value.product!.id!,
        product.value.product!.shop!.id!,
        product.value.product!.quantity! + 1,
        product.value.product!
            .variants![product.value.product!.selectedVaritent!].id!);

    if (call["success"] == true) {
      product.value.product!.quantity = product.value.product!.quantity! + 1;
      product.value.product!.deleteCartId =
          int.parse(call["cart_id"].toString());
      cartController.addToCart();
      product.refresh();
    }
  }

  changeVarient() async {
    if (product.value.product!.quantity != 0) {
      var call = await cartController.addToCARTDIRECTLY(
          product.value.product!.id!,
          product.value.product!.shop!.id!,
          product.value.product!.quantity!,
          product.value.product!
              .variants![product.value.product!.selectedVaritent!].id!);

      if (call["success"] == true) {
        product.value.product!.quantity = product.value.product!.quantity!;
        product.value.product!.deleteCartId =
            int.parse(call["cart_id"].toString());
        cartController.addToCart();
        product.refresh();
      }
    }
  }

  removeToCart() async {
    if (product.value.product!.quantity! > 1) {
      print('here');
      var call = await cartController.addToCARTDIRECTLY(
          product.value.product!.id!,
          product.value.product!.shop!.id!,
          product.value.product!.quantity! - 1,
          product.value.product!.selectedVaritent!);
      if (call["success"] == true) {
        product.value.product!.quantity = product.value.product!.quantity! - 1;
        product.value.product!.deleteCartId =
            int.parse(call["cart_id"].toString());
        print(call["cart_id"]);
        print(product.value.product!.deleteCartId);

        cartController.removeFromCart();

        product.refresh();
      }
    } else {
      print('removed');
      var call = await cartController
          .removeToCARTDIRECTLY(product.value.product!.deleteCartId!);
      if (call) {
        product.value.product!.quantity = 0;
        cartController.removeFromCart();

        product.refresh();
      }
    }
  }
}
