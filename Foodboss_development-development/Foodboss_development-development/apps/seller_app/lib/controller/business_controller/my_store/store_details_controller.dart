import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/my_store/my_store_controller.dart';
import 'package:seller_app/infrastructure/my_store/get_cat.dart';
import 'package:seller_app/models/store/my_food_detail_model.dart';
import 'package:seller_app/models/store/mystore_item.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';

class StoreDetailsController extends GetxController {
  var data = MyStoreItemDetails().obs;
  var dataDetails = MyStoreItemDetails().obs;
  var loading = false.obs;
  var updateLoading = false.obs;
  var error = false.obs;
  var varientsLength = 1.obs;
  // MyStoreController controller = Get.find<MyStoreController>();

  changePrice(String value) {
    data.value.data!.foodsUsers!.discountPrice = value;
  }

  changeStock(String value) {
    data.value.data!.foodsUsers!.quantity = int.parse(value);
  }

  changeMRP(String value){
    data.value.data!.price = int.parse(value);
  }

  addVarients() {
    data.value.data!.foodsVariant!.add(
      FoodsVariant(
        price: "price",
        quantity: 1000,
        unit: 'Kg',
        listOfUnit: ['Kg', 'g', 'mg', 'L', 'ml', 'pcs', 'pc'],
        priceController: TextEditingController(),
        quantityController: TextEditingController(),
      ),
    );
    // varientsLength.value = varientsLength.value + 1;

    data.refresh();
    // varientsLength.refresh();
  }

  getDetails(String id) async {
    print(id);
    loading.value = true;
    try {
      MyStoreItemDetails? res = await MyStoreServices.getMyStoreDetails(id);
      if (res == null) {
        if (error.value == false) {
          error.value = true;
        }
        loading.value = false;
      } else {
        if (res.success == false) {
          if (error.value == false) {
            error.value = true;
          }
          loading.value = false;
        } else {
          data.value = res;
          print(data.value.data!.media!.length);
          error.value = false;
          loading.value = false;
        }
      }
    } catch (e) {
      if (error.value == false) {
        error.value = true;
      }
      loading.value = false;
      print("error thrown here in items");
      print(e);
    }
  }

  changePriceVarient(String val, int index) {
    data.value.data!.foodsVariant![index].price = val;
  }

  changeQuntityVarients(String val, int index) {
    data.value.data!.foodsVariant![index].quantity = int.parse(val);
  }

  changeUnitVarient(String val, int index) {
    data.value.data!.foodsVariant![index].unit = val;
    print(data.value.data!.foodsVariant![index].unit);
    data.refresh();
  }

  removeVarients(FoodsVariant val) {
    if (data.value.data!.foodsVariant!.length != 0) {
      data.value.data!.foodsVariant!.remove(val);
      // varientsLength.value = varientsLength.value - 1;
    }
    data.refresh();
    // varientsLength.refresh();
  }

  changeAvailablity() {
    data.value.data!.isAvailable =
        data.value.data!.isAvailable == true ? false : true;
    // print(data.value.isAvailable);
    data.refresh();
    // data.value.isAvailable.re
  }

  storeUpdateController(BuildContext context) async {
    updateLoading.value = true;
    try {
      var isValid = true;
      if (data.value.data!.isRemoveMrp == false) {
        if (double.parse(data.value.data!.foodsUsers!.discountPrice!) >
            data.value.data!.price!) {
          CustomSnackbar.errorSnackbar2('Price cannot be greater than MRP');
          isValid = false;
        }
      }

      if (isValid) {
        bool res = await MyStoreServices.updateFood(data.value);
        // print(res);
        if (res) {
          CustomSnackbar.showDefaultSuccessSnackbarStatic(context);
        } else {
          CustomSnackbar.showDefaultErrorSnackbarStatic(context);
        }
      }
      updateLoading.value = false;
    } catch (e) {
      updateLoading.value = false;
      CustomSnackbar.showDefaultErrorSnackbarStatic(context);
      print(e);
    }
  }

  quickUpdateController(BuildContext context, MyStoreItemDetails item) async {
    // updateLoading.value = true;
    try {
      bool res = await MyStoreServices.updateFood(item);
      // print(res);
      if (res) {
        CustomSnackbar.showDefaultSuccessSnackbarStatic(context);
      } else {
        print('here');
        CustomSnackbar.showDefaultErrorSnackbarStatic(context);
      }
      // updateLoading.value = false;
    } catch (e) {
      // updateLoading.value = false;
      print('there');
      CustomSnackbar.showDefaultErrorSnackbarStatic(context);
      print(e);
    }
  }

  @override
  void onInit() {
    var args = Get.arguments;
    // data.value = args[0]!;
    if (args != null) {
      getDetails(args[1]);
    }
    // varientsLength.value = data.value.varients!.length;
    super.onInit();
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }
}
