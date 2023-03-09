import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:seller_app/screens/404_error_screen.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/business_controller/faq_controller.dart';
import 'package:seller_app/utils/states.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // FaqController controller = Get.put(FaqController(), permanent: false);

    return const FaqCategory();
  }
}

class ExpansionCard extends StatelessWidget {
  final String title;
  final String text;
  const ExpansionCard({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ExpansionTile(
        collapsedIconColor: ThemeConfig.MAIN_TEXT_COLOR,
        iconColor: ThemeConfig.MAIN_TEXT_COLOR,
        title: Html(
          data: title,
          style: {
            "*": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
            "div": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
            "br": Style(
                display: Display.NONE,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                height: 0),
          },
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Html(
              data: text,
              style: {
                "p": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
                "*": Style(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    fontSize: FontSize(12)),
              },
            ),
          )
        ],
      ),
    );
  }
}

class FaqCategory extends StatelessWidget {
  const FaqCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FaqController controller = Get.put(FaqController(), permanent: false);
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 550),
          padding: EdgeInsets.all(size.width * 0.05),
          height: size.height,
          width: size.width,
          child: RefreshIndicator(
            onRefresh: () => controller.faq(),
            child: Obx(
              () {
                if (controller.status == States.SUCCESS_STATE) {
                  var faq = controller.data.data!;
                  return ListView.builder(
                      itemCount: faq.length,
                      itemBuilder: (BuildContext context, index) =>
                          ExpansionCard(
                              title: faq[index].question!,
                              text: faq[index].answer!));
                } else if (controller.status == States.ERROR_STATE) {
                  return ErrorScreen(
                    refreshFunction: controller.faq,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
