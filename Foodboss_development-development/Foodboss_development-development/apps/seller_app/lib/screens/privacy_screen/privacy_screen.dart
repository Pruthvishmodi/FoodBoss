import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/privacy_controller.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:seller_app/widgets/text_widgets/title_subtitle.dart';
import 'package:seller_app/widgets/text_widgets/title_widget.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; 
    PrivacyController controller =
        Get.put(PrivacyController(), permanent: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Obx(
            () {
              if (controller.status == States.SUCCESS_STATE) {
                var privacy = controller.data.data!;
                return Html(
                  data: controller.data.data!.privacyText,
                  style: {
                    "*": Style(
                      fontSize: FontSize(
                          (ThemeConfig.DESCRIPTION_SIZE / 720.00) *
                                      size.height >
                                  ThemeConfig.DESCRIPTION_SIZE
                              ? (ThemeConfig.DESCRIPTION_SIZE / 720.00) *
                                  size.height
                              : ThemeConfig.DESCRIPTION_SIZE),
                      color: ThemeConfig.MAIN_TEXT_COLOR,
                    ),
                    "a": Style(
                      color: Colors.red,
                    ),
                    "div": Style(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        fontSize: const FontSize(ThemeConfig.DESCRIPTION_SIZE)),
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )),
      ),
    );
  }
}
