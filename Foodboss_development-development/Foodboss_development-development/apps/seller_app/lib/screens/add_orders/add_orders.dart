import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:seller_app/controller/plan_controller.dart';

import 'package:seller_app/screens/add_orders/order_counter.dart';
import 'package:seller_app/screens/add_orders/plan_card.dart';
import 'package:seller_app/utils/states.dart';

import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/error.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/title_widget.dart';

List dummyD = [1, 2, 3, 4, 5, 6];

class AddOrdersScreen extends StatelessWidget {
  AddOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlanController controller = Get.find<PlanController>();

    // Future<void> refreshList() async {
    //   controller.getPlanData();
    //   return;
    // }

    var size = MediaQuery.of(context).size;
    return Obx(() {
      if (controller.status == States.ERROR_STATE) {
        return SafeArea(
          child: ErrorCard(
              message:
                  "Plans are not available at this moment,please try again later.",
              myFunction: controller.getPlanData,
              refresh: true),
        );
      } else {
        return SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.getPlanData();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                // height: size.height,
                child: Column(
                  children: [
                    Obx(
                      () => controller.status == States.LOADING_STATE
                          ? OrderCountScreen(
                              height: size.height * 0.2,
                              orderCount: "0",
                              loading: true,
                            )
                          : OrderCountScreen(
                              height: size.height * 0.2,
                              orderCount: controller.getOrderCount,
                            ),
                    ),
                    SizedBox(height: size.height * 0.021),
                    Row(
                      children: [
                        Expanded(flex: 1, child: Container()),
                        PrimaryButton(
                            text: "Previous Plans",
                            op: () {
                              Get.toNamed("/plan-history");
                            },
                            type: "text"),
                        const SizedBox(width: 20),
                      ],
                    ),
                    SizedBox(height: size.height * 0.021),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: size.width,
                      child: Wrap(
                        alignment: WrapAlignment.spaceAround,
                        runSpacing: 15,

                        // spacing: 5,
                        children: controller.status == States.LOADING_STATE
                            ? dummyD
                                .map((e) => SizedBox(
                                      width: (size.width * 0.46) - 10,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: PlanBuyCard(
                                                prices: "10",
                                                orders: "10",
                                                id: "1",
                                                loading: true,
                                              )),
                                        ],
                                      ),
                                    ))
                                .toList()
                            : controller.planList
                                .map((e) => SizedBox(
                                      width: (size.width * 0.46) - 10,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: PlanBuyCard(
                                                sp: e.specialText,
                                                prices: e.amount,
                                                orders: e.orders.toString(),
                                                id: e.id.toString(),
                                              )),
                                        ],
                                      ),
                                    ))
                                .toList(),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
