import 'package:get/get.dart';

class StoreProductUiController extends GetxController{

  var fragIndex = 0.obs;

  changeIndex(val){
    fragIndex.value = val;
  }
}