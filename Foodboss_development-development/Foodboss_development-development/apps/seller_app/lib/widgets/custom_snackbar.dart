import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class CustomSnackbar {
  // final BuildContext context;

  // SnackBarController(this.context);

  void showTextSnackbar(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: ThemeConfig.WHITE_COLOR),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
      ),
      backgroundColor: ThemeConfig.SUCCESS_COLOR,
    ));
  }

  void showDefaultSuccessSnackbar(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text(
        'Data Added Successfully',
        style: const TextStyle(color: ThemeConfig.WHITE_COLOR),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
      ),
      backgroundColor: ThemeConfig.SUCCESS_COLOR,
    ));
  }

  static showDefaultSuccessSnackbarStatic(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text(
        'Data Added Successfully',
        style: const TextStyle(color: ThemeConfig.WHITE_COLOR),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
      ),
      backgroundColor: ThemeConfig.SUCCESS_COLOR,
    ));
  }

  void showDefaultErrorSnackbar(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text(
        'Opps! Something went wrong',
        style: const TextStyle(color: ThemeConfig.WHITE_COLOR),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
      ),
      backgroundColor: ThemeConfig.ERROR_COLOR,
    ));
  }

  static errorSnackbar() {
    return Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      icon: const Icon(
        Icons.close,
        color: Colors.red,
      ),
      snackStyle: SnackStyle.GROUNDED,
      shouldIconPulse: true,
      messageText: Container(
        child: const Text(
          "Error! Something went wrong",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
   static errorSnackbar2(String text) {
    return Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      icon: const Icon(
        Icons.close,
        color: Colors.red,
      ),
      snackStyle: SnackStyle.GROUNDED,
      shouldIconPulse: true,
      messageText: Container(
        child: Text(
          "$text",
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  static SucessSnackbar(String text) {
    return Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      icon: const Icon(
        Icons.done,
        color: ThemeConfig.SUCCESS_COLOR,
      ),
      snackStyle: SnackStyle.GROUNDED,
      shouldIconPulse: true,
      messageText: Container(
        child: Text(
          text,
          style: const TextStyle(color: ThemeConfig.SUCCESS_COLOR),
        ),
      ),
    );
  }

  static showDefaultErrorSnackbarStatic(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text(
        'Opps! Something went wrong',
        style: const TextStyle(color: ThemeConfig.WHITE_COLOR),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
      ),
      backgroundColor: ThemeConfig.ERROR_COLOR,
    ));
  }
}

// void showDefaultErrorSnackbarStatic(context) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Row(
//         children: [
//           Icon(
//             Icons.check,
//             color: Colors.green,
//           ),
//           const Text(
//             'Sucess',
//             style: const TextStyle(color: Colors.green),
//           ),
//         ],
//       ),
//       behavior: SnackBarBehavior.floating,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
//       ),
//       backgroundColor: Colors.black,
//     ),
//   );
// }



// void showDefaultErrorSnackbar(context) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Row(
//         children: [
//           Icon(
//             Icons.close,
//             color: Colors.red,
//           ),
//           const Text(
//             'Error! Something went wrong',
//             style: const TextStyle(color: Colors.red),
//           ),
//         ],
//       ),
//       behavior: SnackBarBehavior.floating,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
//       ),
//       backgroundColor: Colors.black,
//     ),
//   );
// }
