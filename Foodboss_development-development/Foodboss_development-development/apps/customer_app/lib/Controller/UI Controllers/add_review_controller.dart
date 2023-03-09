import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Models/add_review_model.dart';
import 'package:customer_app/Models/network_call_models.dart/review_call.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class AddReviewController extends GetxController {
  var reviewStars = 1.obs;

  var reviewString = ''.obs;

  onChangeString(val) {
    reviewString.value = val;
  }

  UserController userController = Get.find<UserController>();

  Future<void> sendSupportRequest(String restaurantId) async {
    print(userController.getUser.userId);
    AddReviewModel request = AddReviewModel(
        userId: userController.getUser.userId,
        shopId: int.parse(restaurantId),
        review: reviewString.value,
        rate: reviewStars.value.toString());
    print(request.toJson());
    try {
      var isSent = await ReviewCall.sendReview(request);
      if (isSent == false) {
        CustomSnackbar.errorSnackbar();
      } else {
        Get.back();
        // Get.snackbar('Yoooo', 'Review sent succesfully');
        CustomSnackbar.SucessSnackbar('Review sent succesfully');
      }
    } catch (e) {
      print(e);
    }
  }
}
