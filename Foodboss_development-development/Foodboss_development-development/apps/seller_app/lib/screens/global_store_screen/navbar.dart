import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/business_controller/store/store_controller.dart';
import 'package:seller_app/screens/global_store_screen/global_store_controller.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';

class Sidebar extends StatelessWidget {
  final int widgetIndex;
  final int index;
  final int id;
  final String name;
  final String location;
  final bool? isCat;
  final bool? loading;
  const Sidebar(
      {Key? key,
      this.loading = false,
      required this.widgetIndex,
      required this.index,
      required this.name,
      required this.location,
      required this.id,
      this.isCat = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalStoreController controller = Get.find<GlobalStoreController>();
    // final StoreController controllerGet =
    //     Get.find<StoreController>();
    return InkWell(
      onTap: () {
        if (loading == false) {
          widgetIndex == 0
              ? controller.selectedWidget.value == 0
                  ? controller.changeTabIndex(index, id, widgetIndex)
                  : controller.changeWidgetIndex(widgetIndex)
              : controller.selectedWidget.value == 1
                  ? controller.changeSecondTabIndex(
                      index, id, isCat!, widgetIndex)
                  : controller.changeWidgetIndex(widgetIndex);
        }
        // : Get.toNamed("/product-list-screen");
        // controller.changeWidgetIndex(widgetIndex);
      },
      child: Container(
        decoration: BoxDecoration(
          color: widgetIndex == 0
              ? controller.tabIndex.value == id
                  ? ThemeConfig.WHITE_COLOR
                  : ThemeConfig.WHITE_COLOR
              : controller.secondTabIndex.value == id
                  ? ThemeConfig.WHITE_COLOR
                  : ThemeConfig.WHITE_COLOR,
          border: const Border(
            bottom: BorderSide(
              color: ThemeConfig.OUTLINE_COLOR,
              width: 0.5,
            ),
            right: BorderSide(
              color: ThemeConfig.OUTLINE_COLOR,
              width: 0.5,
            ),
          ),
        ),
        height: 70,
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Row(children: [
          widgetIndex == 0
              ? controller.selectedWidget.value != 0
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    )
              : controller.selectedWidget.value != 1
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                    ),
          Expanded(
            flex: widgetIndex == 0
                ? controller.selectedWidget.value == 0
                    ? 0
                    : 1
                : controller.selectedWidget.value == 1
                    ? 0
                    : 1,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Center(
                child: loading == true
                    ? Container(
                        width: 40,
                        height: 40,
                        color: ThemeConfig.FORM_COLOR,
                      )
                    : Image(
                        width: widgetIndex == 0
                            ? controller.selectedWidget.value == 0
                                ? 40
                                : null
                            : controller.selectedWidget.value == 1
                                ? 40
                                : null,
                        height: widgetIndex == 0
                            ? controller.selectedWidget.value == 0
                                ? 40
                                : 40
                            : controller.selectedWidget.value == 1
                                ? 40
                                : 40,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          // "assets/images/healthy-food.png",
                          location,
                        ),
                      ),
              ),
            ),
          ),
          widgetIndex == 0
              ? controller.selectedWidget.value != 0
                  ? const SizedBox(
                      width: 0,
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    )
              : controller.selectedWidget.value != 1
                  ? const SizedBox(
                      width: 0,
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
          widgetIndex == 0
              ? controller.selectedWidget.value != 0
                  ? const SizedBox(width: 0)
                  : Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: loading == true
                            ? Container(
                                height: 35, color: ThemeConfig.FORM_COLOR)
                            : LabelText(titleString: name),
                      ))
              : controller.selectedWidget != 1
                  ? const SizedBox(width: 0)
                  : Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: loading == true
                            ? Container(
                                height: 35, color: ThemeConfig.FORM_COLOR)
                            : LabelText(titleString: name),
                      )),
          widgetIndex == 0
              ? controller.selectedWidget != 0
                  ? controller.tabIndex.value == id
                      ? Container(
                          width: 2,
                          color: ThemeConfig.MAIN_TEXT_COLOR,
                        )
                      : const SizedBox(width: 0)
                  : SizedBox(
                      width: 30,
                      height: 30,
                      child: Center(
                        child: loading == false
                            ? const Icon(
                                Icons.arrow_forward_ios,
                              )
                            : SizedBox(width: 0),
                      ),
                    )
              : controller.selectedWidget != 1 || isCat == false
                  ? controller.secondTabIndex.value == id
                      ? Container(
                          width: 2,
                          color: ThemeConfig.MAIN_TEXT_COLOR,
                        )
                      : const SizedBox(width: 0)
                  : const SizedBox(
                      width: 30,
                      height: 30,
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    ),
        ]),
      ),
    );
  }
}
