import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/infrastructure/store_service.dart';
import 'package:seller_app/models/store/catagories.dart';
import 'package:seller_app/models/store/items.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class StoreController extends GetxController {
  ScrollController controller = ScrollController();
  var mainCatagories = MainCatModel().data.obs;
  var subCatagories = SubCatModel().data.obs;
  var catagories = Catagory().data.obs;
  var items = ItemModel().data.obs;
  var catLoading = false.obs;
  var subCatLoading = false.obs;
  var subCatError = false.obs;
  var childCatLoading = false.obs;
  var childCatError = false.obs;

  List<ListData>? get mainCategoryList => mainCatagories.value?.data == null
      ? <ListData>[]
      : mainCatagories.value?.data!;
  List<SubCatSubData>? get subCategoryList => subCatagories.value?.data == null
      ? <SubCatSubData>[]
      : subCatagories.value?.data!;
  List<ListCatData>? get categoryList => catagories.value?.data == null
      ? <ListCatData>[]
      : catagories.value?.data!;
  List<ListItemData>? get itemList => items.value?.data!;

  getMainCatagories() async {
    catLoading.value = true;
    try {
      MainCatModel? data = await StoreService.fetchMainCat();
      print(data);
      if (data == null) {
        catLoading.value = false;
        CustomSnackbar.errorSnackbar();
      } else {
        if (data.success == false) {
          catLoading.value = false;
          CustomSnackbar.errorSnackbar();
        } else {
          // #Todo logic
          mainCatagories.value = data.data;
          catLoading.value = false;
        }
      }
    } catch (e) {
      catLoading.value = false;
      CustomSnackbar.errorSnackbar();
    }
  }

  getSubCatagories(int id, BuildContext context) async {
    subCatagories.value?.data = [];
    subCatLoading.value = true;
    try {
      SubCatModel? data = await StoreService.fetchSubCat(id);
      // print(data!.data!.data![0].name!);
      if (data == null) {
        subCatLoading.value = false;
        subCatError.value = true;
        CustomSnackbar.errorSnackbar();
      } else {
        if (data.success == false) {
          subCatError.value = true;
          subCatLoading.value = false;
          Get.snackbar(
            "Opps",
            'Something went wrong',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black,
          );
        } else {
          // #Todo logic
          subCatagories.value = data.data;
          subCatLoading.value = false;
          subCatError.value = false;
        }
      }
    } catch (e) {
      subCatLoading.value = false;
      subCatError.value = true;
      // Get.snackbar("Opps something went wrong!", "",
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.black,
      //     snackStyle: SnackStyle.GROUNDED,
      //     colorText: ThemeConfig.WHITE_COLOR,
      //     icon: const Icon(
      //       Icons.error,
      //       color: ThemeConfig.ERROR_COLOR,
      //     ),
      //     shouldIconPulse: true,
      //     margin: EdgeInsets.only(bottom: 0),
      //     borderRadius: 20);
      CustomSnackbar.showDefaultErrorSnackbarStatic(context);
    }
  }

  getCatagories(int id) async {
    catagories.value?.data = [];
    childCatLoading.value = true;
    try {
      Catagory? data = await StoreService.fetchCat(id);
      if (data == null) {
        childCatLoading.value = false;
        childCatError.value = true;
       CustomSnackbar.errorSnackbar();
      } else {
        if (data.success == false) {
          childCatError.value = true;
          childCatLoading.value = false;
          CustomSnackbar.errorSnackbar();
        } else {
          // #Todo logic
          catagories.value = data.data;
          childCatLoading.value = false;
          childCatError.value = false;
        }
      }
    } catch (e) {
      childCatLoading.value = false;
      childCatError.value = true;
      CustomSnackbar.errorSnackbar();
    }
  }

  getItems(int id, bool fromCat) async {
    try {
      ItemModel? data = await StoreService.fetchItems(id, fromCat);
      print(fromCat);
      if (data == null) {
        CustomSnackbar.errorSnackbar();
      } else {
        if (data.success == false) {
          CustomSnackbar.errorSnackbar();
        } else {
          items.value = data.data;
          Get.toNamed("/product-list-screen");
        }
      }
    } catch (e) {
      CustomSnackbar.errorSnackbar();
    }
  }

  addItems() async {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (items.value!.to! < items.value!.total!) {
          getItemsByPage(items.value!.nextPageUrl!);
        }
      }
    });
  }

  getItemsByPage(String url) async {
    try {
      ItemModel? data = await StoreService.fetchItemsByPage(url);
      // print(fromCat);
      if (data == null) {
        CustomSnackbar.errorSnackbar();
      } else {
        if (data.success == false) {
          CustomSnackbar.errorSnackbar();
        } else {
          items.value!.currentPage = data.data!.currentPage!;
          items.value!.lastPage = data.data!.lastPage!;
          items.value!.prevPageUrl = data.data!.prevPageUrl!;
          items.value!.lastPageUrl = data.data!.lastPageUrl!;
          items.value!.nextPageUrl = data.data!.nextPageUrl!;
          items.value!.firstPageUrl = data.data!.firstPageUrl!;
          items.value!.from = data.data!.from!;
          items.value!.to = data.data!.to!;
          items.value!.total = data.data!.total!;
          items.value!.path = data.data!.path!;
          items.value!.perPage = data.data!.perPage!;
          items.value!.data!.addAll(data.data!.data!);
          Get.toNamed("/product-list-screen");
        }
      }
    } catch (e) {
      CustomSnackbar.errorSnackbar();
    }
  }

  @override
  void onInit() {
    getMainCatagories();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
