import 'dart:developer' as dev;
import 'dart:math';

import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/store_product_controller.dart';
import 'package:customer_app/Controller/UI%20Controllers/store_product_ui_controller.dart';
import 'package:customer_app/Models/cart_model.dart';
import 'package:customer_app/Models/network_call_models.dart/generate_code_mode.dart';
import 'package:customer_app/Models/network_call_models.dart/ongoing_order_call.dart';
import 'package:customer_app/Models/network_call_models.dart/order_detail_call.dart';
import 'package:customer_app/Models/product_model.dart';
import 'package:customer_app/Services/fcm_services.dart';
import 'package:customer_app/Services/general_services.dart';
import 'package:customer_app/Services/store_services.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // StoreProductController storeProductController =
  //     Get.find<StoreProductController>();
  // StoreProductUiController storeProductUiController =
  //     Get.find<StoreProductUiController>();
  var count = 0.obs;
  // RxList<int> orderIds = <int>[].obs;

  var cart = <Product>[].obs;

  // double cartTotal() {
  //   double total = 0.0;
  //   for (var element in cart.value) {
  //     total = total +
  //         element.quantity! *
  //             double.parse(element.discount != null ? element.discount! : '0');
  //   }

  //   return total;
  // }

  addToCart() {
    // if (!orderIds.contains(id)) {
    //   orderIds.add(id);
    // }
    count++;
  }

  removeFromCart() {
    // if (orderIds.contains(id)) {
    //   orderIds.remove(id);
    // }
    if (count > 0) {
      count--;
    }
  }

  Map<String, dynamic> toAddToCartJson(
      int id, int shopId, int quantity, int vId) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['restaurant_id'] = shopId;
    data['quantity'] = quantity;
    if (vId != 0) {
      data['food_variant_id'] = vId;
    } else {
      data['food_variant_id'] = '';
    }
    return data;
  }

  changeVarient(
      Product product,
      StoreProductUiController storeProductUiController,
      StoreProductController storeProductController) async {
    var vIndex = storeProductController.store.value
        .categories![storeProductUiController.fragIndex.value].filteredProducts!
        .firstWhere((element) => element.id == product.id)
        .selectedVaritent;

    var vId = storeProductController.store.value
        .categories![storeProductUiController.fragIndex.value].filteredProducts!
        .firstWhere((element) => element.id == product.id)
        .variants![vIndex!]
        .id!;

    // cart.value.firstWhere((element) => element.id == product.id, orElse: ()=> ) != -1;
    if (cart.value
            .firstWhere((element) => element.id == product.id,
                orElse: () => Product())
            .quantity !=
        0) {
      var json = toAddToCartJson(
          product.id!,
          product.shop!.id!,
          cart.value
              .firstWhere((element) => element.id == product.id)
              .quantity!,
          vId);
      var call;
      // if (vId != 0) {
      //   call = await StoreServices.addToCartNew(json);
      // } else {
      // }
      call = await StoreServices.addToCart(json);

      if (call["success"] == true) {
        var newquantity = cart.value
            .firstWhere((element) => element.id == product.id)
            .quantity!;
        cart.value.firstWhere((element) => element.id == product.id).quantity =
            newquantity;
        storeProductController
            .store
            .value
            .categories![storeProductUiController.fragIndex.value]
            .filteredProducts!
            .firstWhere((element) => element.id == product.id)
            .quantity = newquantity;
        storeProductController
            .store
            .value
            .categories![storeProductUiController.fragIndex.value]
            .filteredProducts!
            .firstWhere((element) => element.id == product.id)
            .deleteCartId = call["cart_id"];
        storeProductController.store.refresh();
        addToCart();
        cart.refresh();
      }
    }
  }

  addProductTocart(
      Product product,
      StoreProductUiController storeProductUiController,
      StoreProductController storeProductController) async {
    // print(orderIds.contains(product.id));
    // if (orderIds.contains(product.id) == false) {
    //   orderIds.add(product.id!);
    //   orderIds.refresh();
    var vIndex = storeProductController.store.value
        .categories![storeProductUiController.fragIndex.value].filteredProducts!
        .firstWhere((element) => element.id == product.id)
        .selectedVaritent;

    var vId = storeProductController.store.value
        .categories![storeProductUiController.fragIndex.value].filteredProducts!
        .firstWhere((element) => element.id == product.id)
        .variants![vIndex!]
        .id!;
    // }
    dev.log('here in fun');
    if (cart.value.contains(product)) {
      var json = toAddToCartJson(
          product.id!,
          product.shop!.id!,
          cart.value
                  .firstWhere((element) => element.id == product.id)
                  .quantity! +
              1,
          vId);
      var call;
      // if (vId != 0) {
      //   call = await StoreServices.addToCartNew(json);
      // } else {
      // }
      call = await StoreServices.addToCart(json);

      if (call["success"] == true) {
        var newquantity = cart.value
                .firstWhere((element) => element.id == product.id)
                .quantity! +
            1;
        cart.value.firstWhere((element) => element.id == product.id).quantity =
            newquantity;
        storeProductController
            .store
            .value
            .categories![storeProductUiController.fragIndex.value]
            .filteredProducts!
            .firstWhere((element) => element.id == product.id)
            .quantity = newquantity;
        storeProductController
            .store
            .value
            .categories![storeProductUiController.fragIndex.value]
            .filteredProducts!
            .firstWhere((element) => element.id == product.id)
            .deleteCartId = call["cart_id"];
        storeProductController.store.refresh();
        addToCart();
        cart.refresh();
      }
    } else {
      // print(product.quantity);
      var json = toAddToCartJson(product.id!, product.shop!.id!, 1, vId);
      var call;
      // if (vId != 0) {
      //   call = await StoreServices.addToCartNew(json);
      // } else {
      // }

      call = await StoreServices.addToCart(json);
      if (call["success"] == true) {
        cart.value.add(product);
        cart.value.firstWhere((element) => element.id == product.id).quantity =
            1;
        storeProductController
            .store
            .value
            .categories![storeProductUiController.fragIndex.value]
            .filteredProducts!
            .firstWhere((element) => element.id == product.id)
            .quantity = 1;
        storeProductController
            .store
            .value
            .categories![storeProductUiController.fragIndex.value]
            .filteredProducts!
            .firstWhere((element) => element.id == product.id)
            .deleteCartId = call["cart_id"];
        storeProductController.store.refresh();
        addToCart();
        cart.refresh();
      }
      // print('absent');
    }
  }

  removeProductTocart(
      Product product,
      StoreProductUiController storeProductUiController,
      StoreProductController storeProductController) async {
    var vIndex = storeProductController.store.value
        .categories![storeProductUiController.fragIndex.value].filteredProducts!
        .firstWhere((element) => element.id == product.id)
        .selectedVaritent;

    var vId = storeProductController.store.value
        .categories![storeProductUiController.fragIndex.value].filteredProducts!
        .firstWhere((element) => element.id == product.id)
        .variants![vIndex!]
        .id!;
    if (cart.value.contains(product)) {
      print('present');
      if (cart.value
              .firstWhere((element) => element.id == product.id)
              .quantity ==
          1) {
        printInfo(info: product.deleteCartId.toString());
        var call = await StoreServices.removeToCart(product.deleteCartId!);
        if (call) {
          storeProductController
              .store
              .value
              .categories![storeProductUiController.fragIndex.value]
              .filteredProducts!
              .firstWhere((element) => element.id == product.id)
              .quantity = 0;
          storeProductController
              .store
              .value
              .categories![storeProductUiController.fragIndex.value]
              .filteredProducts!
              .firstWhere((element) => element.id == product.id)
              .deleteCartId = 0;
          storeProductController.store.refresh();
          cart.value.remove(product);
          removeFromCart();
          cart.refresh();
        }
      } else {
        // print(cart.value[cart.value.indexOf(product)].quantity);
        var newQuantity = cart.value
                .firstWhere((element) => element.id == product.id)
                .quantity! -
            1;
        var json =
            toAddToCartJson(product.id!, product.shop!.id!, newQuantity, vId);
        var call;
        // if (vId != 0) {
        //   call = await StoreServices.addToCartNew(json);
        // } else {
        // }
        call = await StoreServices.addToCart(json);
        if (call["success"] == true) {
          cart.value
              .firstWhere((element) => element.id == product.id)
              .quantity = newQuantity;
          storeProductController
              .store
              .value
              .categories![storeProductUiController.fragIndex.value]
              .filteredProducts!
              .firstWhere((element) => element.id == product.id)
              .quantity = newQuantity;
          storeProductController.store.refresh();
          cart.refresh();
        }
      }
    } else {
      print('absent');
    }
  }

  removeProductFromDirectly(int productid, int storeId) async {
    try {
      var call = await StoreServices.removeToCart(productid);
      if (call) {
        if (getCart
                .value
                .store![getCart.value.store!
                    .indexWhere((element) => element.id == storeId)]
                .items!
                .length ==
            1) {
          Get.back();
        }
        fetchCart();
      }
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> checkoutJson(
      int id, int address, String comment, String paymentType) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adddress'] = address;
    data['restaurant_id'] = id;
    data['payment_method'] = paymentType;
    data['comment'] = comment;
    return data;
  }

  var comment = ''.obs;
  onChangeComment(val) {
    comment.value = val;
  }

  checkoutCart(
    int orderId,
    int address,
    String fcmToken,
  ) async {
    try {
      var json = checkoutJson(
          orderId,
          address,
          comment.value,
          paymethod.value == PaymentMethod.COD
              ? 'COD'
              : paymethod.value == PaymentMethod.POD
                  ? 'POD'
                  : 'Khata');

      var call = await StoreServices.checkoutCartItems(json);
      print(call);
      if (call == true) {
        paymethod.value = PaymentMethod.COD;
        await fetchOngoingOrders();
        Get.offNamed('/order-completed-animation',
            arguments: [ongoingOrders.value.orders!.first.id]);

        FCMService.sendNotifications(
            'FoodBoss Seller', 'You have 1 new Order', fcmToken);
        count.value =
            count.value - ongoingOrders.value.orders!.first.totalItems!;
        fetchCart();
        // Get.back();

        var removeList = [];
        for (var element in cart.value) {
          print(element.shop!.id);
          if (element.shop!.id == orderId) {
            removeList.add(element);
          }
        }
        for (var element in removeList) {
          cart.value.remove(element);
        }
        cart.refresh();
        // CustomSnackbar.SucessSnackbar('Order Placed Successfully');
      } else {
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);

      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  var getCart = CartModel().obs;
  // RxList<Product> products = RxList<Product>();

  fetchCart() async {
    try {
      var call = await StoreServices.getCartItems();

      if (call != null) {
        getCart.value = call;
        if (getCart.value.store != null) {
          int cartTotal = 0;
          for (var element in getCart.value.store!) {
            if (element.items != null && element.items!.isNotEmpty) {
              // orderIds.addAll(element.items!.map((e) => e.id!));
              cartTotal = cartTotal + element.totalItems!;
              // element.items!.forEach((element) {
              //   print(cart.value.contains(element));
              //   if(!cart.value.contains(element)){
              //     cart.value.add(element);
              //   }
              // });
              // cart.refresh();

              // cart.addAllIf( cart.value.contains(element.items) ,element.items!);
              // cart.addAll(
              //   element.items!
              // );
              // for (var item in cart) {
              //   printInfo(info: item.quantity.toString());
              // }
              // cart.forEach((element) =>
              // );
            }
          }
          count.value = cartTotal;
        }
      } else {
        Get.snackbar('Error', "something went wrong");
      }
    } catch (e) {
      printInfo(info: 'called here error');
      printInfo(info: e.toString());
      Get.snackbar('Error', "Something went wrong");
    }
  }

  var paymethod = PaymentMethod.COD.obs;

  changePayMethod(PaymentMethod paymentMethod) {
    paymethod.value = paymentMethod;
  }

  var ongoingOrders = OngoingOrderCall().obs;

  fetchOngoingOrders() async {
    try {
      var call = await StoreServices.getOngoingOrders();

      if (call != null) {
        ongoingOrders.value = call;
        ongoingOrders.value.orders =
            ongoingOrders.value.orders!.reversed.toList();
        ongoingOrders.refresh();
      } else {
        Get.snackbar('Error', "something went wrong");
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', "Something went wrong");
    }
  }

  var ongoingLoader = false.obs;
  fetchOrderDetails(int orderId) async {
    try {
      ongoingLoader.value = true;
      GetOrderDetails call = await StoreServices.getOrderDetails(orderId);
      print(call.data.toString());
      if (call != null) {
        var orderIndex = ongoingOrders.value.orders!
            .indexWhere((element) => element.id == orderId);

        ongoingOrders.value.orders![orderIndex].items = call.data!.items;
        ongoingOrders.value.orders![orderIndex].deliveryCharge =
            call.data!.deliveryCharge;
        ongoingOrders.value.orders![orderIndex].paymentMethod =
            call.data!.paymentMethod;
        ongoingOrders.value.orders![orderIndex].returnAmount =
            call.data!.returnAmount;
        ongoingOrders.value.orders![orderIndex].totalDiscount =
            call.data!.totalDiscount;
        ongoingOrders.value.orders![orderIndex].totalPrice =
            call.data!.totalPrice;
        ongoingOrders.value.orders![orderIndex].customerComments =
            call.data!.customerComments;
        ongoingOrders.value.orders![orderIndex].orderDatenTime =
            call.data!.orderDatenTime;
        ongoingOrders.value.orders![orderIndex].arrivalDate =
            call.data!.arrivalDate;
        ongoingOrders.value.orders![orderIndex].returnItems = [];
        // if(ongoingOrders.value.orders![orderIndex].removedItems != null ){
        //   print('here');
        //   var removelist = [];
        //   ongoingOrders.value.orders![orderIndex].removedItems!.forEach((element) {
        //     print(element.id);
        //     ongoingOrders.value.orders![orderIndex].items!.remove(element);
        //   });
        //     // removelist.add(element);
        //   // removelist.forEach((element) {
        //   // });
        // }
        ongoingOrders.value.orders![orderIndex].store = call.data!.store;
        ongoingOrders.value.orders![orderIndex].status = call.data!.status;
        ongoingOrders.value.orders![orderIndex].totalPrice =
            call.data!.totalPrice;
        ongoingOrders.value.orders![orderIndex].deliveryBoy =
            call.data!.deliveryBoy;
        ongoingOrders.refresh();
        ongoingLoader.value = false;
      } else {
        Get.snackbar('Error', "something went wrong");
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', "Something went wrong");
    }
  }

  generateDeliveryCode(int orderId, List<int> removeIds) async {
    var rng = Random();
    var code = rng.nextInt(8999) + 1000;
    var json = GenerateCode(
        code: code.toString(),
        orderId: orderId,
        returnItems: ReturnItems(id: removeIds));
    var call = await GeneralServices.generateDeliveryCode(json.toJson());
    if (call == true) {
      sheet(code);
    } else {
      CustomSnackbar.errorSnackbar();
    }
  }

  sheet(code) {
    Get.bottomSheet(
      Wrap(
        children: [
          Container(
            padding: ThemeConfig.screenPadding,
            decoration: const BoxDecoration(
                color: ThemeConfig.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            // height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SB.large(),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    code.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: ThemeConfig.mainTextColor,
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: DescriptionText(
                    text:
                        "Provide this code to delivery man at the time of delivery",
                    alignment: TextAlign.center,
                  ),
                ),
                SB.large(),
                SizedBox(
                  width: double.infinity,
                  child: SecondaryButton(
                    op: () {
                      Get.back();
                      Get.back();
                    },
                    text: 'Done',
                    type: 'filled',
                    width: double.infinity,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Add to cart directly

  Map<String, dynamic> addToCartJson(
      int productId, int shopId, int quantity, int vid) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurant_id'] = shopId;
    data['id'] = productId;
    data['quantity'] = quantity;
    if (vid != 0) {
      data['food_variant_id'] = vid;
    } else {
      data['food_variant_id'] = '';
    }

    return data;
  }

  Future<Map<String, dynamic>> addToCARTDIRECTLY(
      int productId, int shopId, int quantity, int vid) async {
    try {
      print(productId);
      var json = addToCartJson(productId, shopId, quantity, vid);
      var call = await StoreServices.addToCart(json);
      print(call["success"]);
      if (call["success"] == true) {
        return call;
      } else {
        return {"success": true, "cart_id": 0};
      }
    } catch (e) {
      print(e);
      return {"success": true, "cart_id": 0};
    }
  }

  Future<bool> removeToCARTDIRECTLY(int productId) async {
    try {
      var call = await StoreServices.removeToCart(productId);
      print(call);
      if (call == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}

enum PaymentMethod {
  COD,
  POD,
  KHATA,
}
