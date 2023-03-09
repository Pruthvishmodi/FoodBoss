import 'package:customer_app/Models/network_call_models.dart/get_storeList_from_search.dart';
import 'package:customer_app/Models/network_call_models.dart/seach_product_call.dart';
import 'package:customer_app/Models/network_call_models.dart/search_suggestion_model.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:customer_app/utils/requests.dart';
import 'package:customer_app/utils/urls.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  var shops = GetStoreListFromSearch().obs;

  fetchNearbyShop() async {
    try {
      var call = await Request.getData(Urls.LIST_SHOP, true);

      if (call.statusCode == 200) {
        if (call != null) {
          shops.value = GetStoreListFromSearch.fromJson(call.data);
          shops.value.data = shops.value.data!
              .where((element) => element.isShopClose == false)
              .toList();
          shops.refresh();
        } else {
          CustomSnackbar.errorSnackbar();
        }
      }
    } catch (e) {
      print('here $e');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  var products = SearchProductCall().obs;

  fetchProducts(String name) async {
    products.value.products = [];
    // try {
    //   var call = await Request.getData(Urls.SEARCHPRODUCTS(name), true);

    //   if (call.statusCode == 200) {
    //     if (call != null) {
    //       products.value = SearchProductCall.fromJson(call.data);

    //       products.refresh();
    //     } else {
    //       // Get.snackbar('Error', 'Something went wrong');
    //       CustomSnackbar.errorSnackbar();
    //     }
    //   }
    // } catch (e) {
    //   print('there $e');
    //   // Get.snackbar('Something went wrongee', 'Network Error');
    //   CustomSnackbar.errorSnackbar2('Something went wrong');
    // }
  }

//   {
//     "index":"foods",
//     "query":"chan"
// }
  Map<String, dynamic> toSearchJson(name) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['index'] = "foods";
    data['query'] = name;
    return data;
  }

  onChangeSearch(String name) async {
    try {
      var call = await Request.getData(Urls.SEARCHPRODUCTS(name), true);

      if (call.statusCode == 200) {
        if (call != null) {
          products.value = SearchProductCall.fromSearchJson(call.data);
          products.refresh();
        } else {
          // Get.snackbar('Error', 'Something went wrong');
          CustomSnackbar.errorSnackbar();
        }
      }
    } catch (e) {
      print('there $e');
      // Get.snackbar('Something went wrongee', 'Network Error');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  var suggestion = <Suggestion>[].obs;
  Future<List<Suggestion>> getSearchSuggestions(String val) async {
    try {
      var call =
          await Request.postData(Urls.SEARCHSUGGESTIONS, {"search": val}, true);
      print(call);

      if (call.statusCode == 200) {
        if (call != null) {
          suggestion.value = SearchSuggestionModel.fromJson(call.data).data!;
          suggestion.refresh();
          return suggestion.value;
        } else {
          // Get.snackbar('Error', 'Something went wrong');
          // CustomSnackbar.errorSnackbar();
          return <Suggestion>[];
        }
      }
      return suggestion;
    } catch (e) {
      print('there $e');
      // Get.snackbar('Something went wrongee', 'Network Error');
      // CustomSnackbar.errorSnackbar2('Something went wrong');
      return <Suggestion>[];
    }
  }

  getProducts(int val) async {
    try {
      var call = await Request.getData(Urls.GETSEARCHPROD(val), true);
      print(call);

      if (call.statusCode == 200) {
        if (call != null) {
          products.value = SearchProductCall.fromSearchJson(call.data);
          products.refresh();
        } else {
          // Get.snackbar('Error', 'Something went wrong');
          CustomSnackbar.errorSnackbar();
        }
      }
      // return suggestion;
    } catch (e) {
      print('there $e');
      // Get.snackbar('Something went wrongee', 'Network Error');
      // CustomSnackbar.errorSnackbar2('Something went wrong');
      // return <Suggestion>[];
    }
  }

  @override
  void onInit() {
    fetchNearbyShop();
    fetchProducts('neem');
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
