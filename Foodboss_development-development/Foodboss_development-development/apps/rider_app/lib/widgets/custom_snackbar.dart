import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  static void showDefaultErrorSnackbar(context) {
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
