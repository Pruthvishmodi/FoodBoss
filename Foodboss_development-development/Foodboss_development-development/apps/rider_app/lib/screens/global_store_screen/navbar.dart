import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/controller/business_controller/store/store_controller.dart';
import 'package:rider_app/screens/global_store_screen/global_store_controller.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:shared_widgets/shared_widgets.dart';

class Sidebar extends StatelessWidget {
  final int widgetIndex;
  final int index;
  final int id;
  final String name;
  final String location;
  final bool? isCat;
  const Sidebar(
      {Key? key,
      required this.widgetIndex,
      required this.index,
      required this.name,
      required this.location,
      required this.id,
      this.isCat = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalStoreController controller =
        Get.put(GlobalStoreController(), permanent: false);
    final StoreController controllerGet =
        Get.put(StoreController(), permanent: false);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: widgetIndex == 0
          ? controller.tabIndex.value == index
              ? ThemeConfig.FORM_COLOR
              : ThemeConfig.WHITE_COLOR
          : controller.secondTabIndex.value == index
              ? ThemeConfig.FORM_COLOR
              : ThemeConfig.WHITE_COLOR,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        child: GestureDetector(
          onTap: () {
            widgetIndex == 0
                ? controller.changeTabIndex(index, id, widgetIndex)
                : controller.selectedWidget.value == 1
                    ? controller.changeSecondTabIndex(
                        index, id, isCat!, widgetIndex)
                    : controller.changeWidgetIndex(widgetIndex);
            // : Get.toNamed("/product-list-screen");
            // controller.changeWidgetIndex(widgetIndex);
          },
          child: Row(children: [
            widgetIndex == 0
                ? controller.selectedWidget != 0
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      )
                : controller.selectedWidget != 1
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.20,
                      ),
            Expanded(
              flex: widgetIndex == 0
                  ? controller.selectedWidget == 0
                      ? 0
                      : 1
                  : controller.selectedWidget == 1
                      ? 0
                      : 1,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Image(
                    width: 35,
                    height: 35,
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
                ? controller.selectedWidget != 0
                    ? const SizedBox(
                        width: 0,
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      )
                : controller.selectedWidget != 1
                    ? const SizedBox(
                        width: 0,
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
            widgetIndex == 0
                ? controller.selectedWidget != 0
                    ? const SizedBox(width: 0)
                    : Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LabelText(titleString: name),
                        ))
                : controller.selectedWidget != 1
                    ? const SizedBox(width: 0)
                    : Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LabelText(titleString: name),
                        )),
            widgetIndex == 0
                ? controller.selectedWidget != 0
                    ? const SizedBox(width: 0)
                    : const SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ),
                      )
                : controller.selectedWidget != 1 || isCat == false
                    ? const SizedBox(width: 0)
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
      ),
    );
  }
}
