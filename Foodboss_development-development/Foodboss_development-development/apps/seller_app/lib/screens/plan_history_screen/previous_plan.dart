import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/error.dart';
import 'package:seller_app/widgets/text_widgets/heading_widget.dart';
import 'package:seller_app/widgets/text_widgets/title_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/plan_history_controller.dart';
import 'package:seller_app/screens/add_orders/add_orders.dart';
import 'package:seller_app/utils/states.dart';

import 'package:seller_app/widgets/food%20boss%20card/food_boss_card.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:seller_app/widgets/text_widgets/title_subtitle.dart';

class PreviousPlan extends StatelessWidget {
  const PreviousPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlanHistoryController controller =
        Get.put(PlanHistoryController(), permanent: false);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeConfig.WHITE_COLOR,
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        elevation: 0,
        title: const Text("Plan history"),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            print("call");
            await controller.getPlanHistoryList();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * .90,
              constraints: const BoxConstraints(maxWidth: 550.00),
              child: Obx(() {
                if (controller.status == States.SUCCESS_STATE) {
                  var planHistory = controller.data.data!;
                  return ListView.builder(
                    itemCount: controller.data.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PlanCard(
                        amount: planHistory[index].amount != null
                            ? planHistory[index].amount!
                            : "200",
                        time: planHistory[index].updatedAt != null
                            ? planHistory[index]
                                .updatedAt!
                                .substring(0, 10)
                                .split('-')
                                .reversed
                                .join('-')
                            : "20-03-2022",
                        points: planHistory[index].orders != null
                            ? planHistory[index].orders!.toString()
                            : "123",
                        rate: '',
                        reference: planHistory[index].referenceNo != null
                            ? planHistory[index].referenceNo!
                            : "123456",
                        mode: planHistory[index].paymentMode != null
                            ? planHistory[index].paymentMode!
                            : "UPI",
                      );
                      // return Obx(() {
                      //   if (controller.status == States.SUCCESS_STATE) {
                      //
                      //     return
                      //   } else {
                      //     return Center(child: CircularProgressIndicator());
                      //   }
                      // });
                    },
                  );
                } else {
                  if (controller.status == States.ERROR_STATE) {
                    return NoPlanPurcharsedScreen(
                      function: controller.getPlanHistoryList,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
              }),
            ),
          ),
        ),
      ),
      //   floatingActionButton: FloatingActionButton(
      //   backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
      //   onPressed: () {
      //     Get.to(const AddOrders());
      //   },
      //   child: const Icon(Icons.add, color: ThemeConfig.WHITE_COLOR),
      // ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String amount;
  final String time;
  final String points;
  final String mode;

  final String rate;
  final String reference;

  const PlanCard(
      {Key? key,
      required this.amount,
      required this.time,
      required this.points,
      required this.rate,
      required this.reference,
      required this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FoodBossCard(
      list: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainLabelText(titleString: points),
            const SizedBox(height: 10.00),
            const Desc(
              descString: "Plan",
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MainLabelText(titleString: amount),
            const SizedBox(height: 10.00),
            Desc(
              descString: time,
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Desc(
                    descString: "Payment Mode",
                  ),
                  SizedBox(height: 10.00),
                  Desc(
                    descString: "Reference Number",
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Desc(
                    descString: mode,
                  ),
                  const SizedBox(height: 10.00),
                  Desc(
                    descString: reference,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class NoPlanPurcharsedScreen extends StatelessWidget {
  NoPlanPurcharsedScreen({Key? key, required this.function}) : super(key: key);

  final Future<void> Function() function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            width: 200,
            image: AssetImage('assets/images/add-product.png'),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
            width: 350,
            child: Row(
              children: const [
                Expanded(
                  child: TitleText(titleString: "No Plan Purchased yet"
                      // style: TextStyle(
                      //   color: ThemeConfig.MAIN_TEXT_COLOR,
                      //   fontSize: 30,
                      // ),
                      ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: size.height * 0.02,
          // ),
          // const SizedBox(
          //   width: 300,
          //   child: Desc(
          //     descString:
          //         "It will take few seconds to add products from our global store",
          //     // style: TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR, fontSize: 15),
          //   ),
          // ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
            width: 200,
            child: Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: "Buy Plan",
                    op: () {
                      Get.back();
                    },
                    type: "filled",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Desc(
                descString: "Already bought plan?",
              ),
              const SizedBox(
                width: 2,
              ),
              GestureDetector(
                onTap: () async {
                  await function;
                },
                child: const LabelText(
                  titleString: "Refresh",
                ),
              ),
            ],
          )
          // NoProductsButton(
          //   size: size,
          //   text: 'Global Store',
          // )
        ],
      ),
    );
  }
}
