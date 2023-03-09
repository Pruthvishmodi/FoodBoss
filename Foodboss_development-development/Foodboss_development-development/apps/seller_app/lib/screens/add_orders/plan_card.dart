import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/auth/login_controller.dart';
import 'package:seller_app/controller/plan_controller.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/models/plan_model.dart';
import 'package:seller_app/models/purchasePlan_model.dart';
import 'package:seller_app/screens/Buy_order_details/buy_details.dart';
import 'package:seller_app/screens/order%20summary/order_summary_screen.dart';
import 'package:seller_app/shimmers/card_shimmer.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/distructive_text.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';

class PlanBuyCard extends StatelessWidget {
  final String? prices;
  final String? id;
  final String? sp;

  final String? orders;
  final bool? loading;
  PlanBuyCard({
    this.prices,
    this.loading = false,
    this.orders,
    this.id,
    this.sp,
  });

  @override
  Widget build(BuildContext context) {
    // PlanController controller = Get.find<PlanController>();
    AuthController controllerAuth = Get.put(AuthController(), permanent: false);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
            color: ThemeConfig.WHITE_COLOR,
          ),
          padding: const EdgeInsets.all(20.00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // const Divider(),
              // const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   width: 30,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(5.00),
                  //     color: ThemeConfig.FORM_COLOR,
                  //   ),
                  //   padding: const EdgeInsets.all(10),
                  //   child: loading == false
                  //       ? const MainLabelText(
                  //           titleString: "\u{20B9}",
                  //         )
                  //       : SizedBox(
                  //           width: 0,
                  //           height: 0,
                  //         ),
                  // ),
                  // const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        loading == false
                            ? LabelText(titleString: "$orders Orders")
                            : Container(
                                width: 80,
                                height: 20,
                                color: ThemeConfig.FORM_COLOR,
                              ),
                        SizedBox(
                          height: 5,
                        ),
                        loading == false
                            ? Desc(descString: "\u{20B9} $prices")
                            : Container(
                                width: 60,
                                height: 20,
                                color: ThemeConfig.FORM_COLOR,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    // flex: 1,
                    child: loading == false
                        ? DistructiveButton(
                            height: 35,
                            text: "Buy",
                            op: () {
                              // controllerAuth.logout();
                              // Get.toNamed("/");
                              Get.to(() => BuyDetails(
                                    order: orders,
                                    price: prices,
                                    id: id,
                                  ));
                            },
                            type: "filled",
                          )
                        : Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  ThemeConfig.BORDERRADIUS_MIN),
                              color: ThemeConfig.FORM_COLOR,
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
        sp != null
            ? Positioned(
                right: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(10)),
                      color: ThemeConfig.PRIMARY_COLOR),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Desc(
                      descString: sp.toString(),
                      isWhite: true,
                    ),
                  ),
                ))
            : Container()
      ],
    );
  }
}
