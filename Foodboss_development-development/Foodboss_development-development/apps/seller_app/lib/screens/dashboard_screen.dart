import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:seller_app/controller/dashboard_controller.dart';
import 'package:seller_app/controller/plan_controller.dart';
import 'package:seller_app/utils/states.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/Heading.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/heading_widget.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PlanController controller = Get.find<PlanController>();
    PlanController controller = Get.put(PlanController(), permanent: false);
    DashboardController dashboardController =
        Get.put(DashboardController(), permanent: false);

    Size size = MediaQuery.of(context).size;
    return PageLayout(
      bottombar: false,
      backArrow: false,
      title: "Dashboard Page",
      color: ThemeConfig.PRIMARY_COLOR,
      selectedIndex: 0,
      appbarFunc: () {},
      child: RefreshIndicator(
        onRefresh: ()async => dashboardController.getDarshboardScreen(),
        child: SingleChildScrollView(
          child: Center(
            child: Obx(() {
              if (dashboardController.status == States.SUCCESS_STATE) {
                return Container(
                  constraints: const BoxConstraints(maxWidth: 550.00),
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      const HeadingText(titleString: "Orders"),
                      // const Heading('Orders', ThemeConfig.MAIN_TEXT_COLOR),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: OrdersDetailCard(
                              heading: 'Pending',
                              value: dashboardController
                                  .data.data!.orderCount!.pending
                                  .toString(),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: OrdersDetailCard(
                              heading: 'Packed',
                              value: dashboardController
                                  .data.data!.orderCount!.packed
                                  .toString(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: OrdersDetailCard(
                              heading: 'Shipped',
                              value: dashboardController
                                  .data.data!.orderCount!.shipped
                                  .toString(),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: OrdersDetailCard(
                              heading: 'Completed',
                              value: dashboardController
                                  .data.data!.orderCount!.completed
                                  .toString(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      const HeadingText(titleString: "Sales"),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      SalesDetailsWidget(
                        size: size,
                        title: 'Today\'s Sales',
                        icon: Icons.trending_up,
                        value:
                            '\u{20B9} ${dashboardController.data.data!.salesCount!.today.toString()}',
                      ),
                      SalesDetailsWidget(
                        size: size,
                        icon: Icons.monetization_on_outlined,
                        title: 'Monthly Sales',
                        value:
                            '\u{20B9} ${dashboardController.data.data!.salesCount!.monthly.toString()}',
                      ),
                      SalesDetailsWidget(
                        icon: Icons.credit_score_outlined,
                        size: size,
                        title: 'Orders left',
                        value:
                            '${dashboardController.data.data!.salesCount!.ordersLeft.toString()}',
                      )
                    ],
                  ),
                );
              } else {
                return Container(
                    height: size.height,
                    child: const Center(
                      child: const CircularProgressIndicator(),
                    ));
              }
            }),
          ),
        ),
      ),
    );
  }
}

class SalesDetailsWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const SalesDetailsWidget({
    Key? key,
    required this.size,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: size.height * 0.1,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: ThemeConfig.FORM_COLOR,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: ThemeConfig.PRIMARY_COLOR,
              ),
              const SizedBox(
                width: 20,
              ),
              Desc(descString: title),
            ],
          ),
          LabelText(
            titleString: value.toString(),
          ),
        ],
      ),
    );
  }
}

class OrdersDetailCard extends StatelessWidget {
  final String heading;
  final String value;
  const OrdersDetailCard({
    Key? key,
    required this.heading,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeConfig.PRIMARY_COLOR),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: ThemeConfig.WHITE_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: 60,
            ),
          ),
          Desc(
            descString: heading,
            isWhite: true,
          ),
        ],
      ),
    );
  }
}
