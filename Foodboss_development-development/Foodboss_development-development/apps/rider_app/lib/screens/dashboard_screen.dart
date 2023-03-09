import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/config/page_layout.dart';
import 'package:rider_app/controller/business_controller/store_registration/delivery_controller.dart';
import 'package:rider_app/controller/dashboard_controller.dart';
import 'package:rider_app/utils/states.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';

import '../controller/business_controller/store_registration/delivery_controller.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // AuthController authController = Get.put(AuthController());
    DeliveryController deliveryController = Get.put(DeliveryController());

    DashboardController controller =
        Get.put(DashboardController(), permanent: false);
    return PageLayout(
      bottombar: false,
      backArrow: false,
      title: "Dashboard Page",
      color: ThemeConfig.PRIMARY_COLOR,
      selectedIndex: 0,
      appbarFunc: () {},
      child: RefreshIndicator(
        onRefresh: () async {
          controller.getDashBoardData();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 550.00),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  // const HeadingText(titleString: "Orders"),
                  // const Heading('Orders', ThemeConfig.MAIN_TEXT_COLOR),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Obx(() {
                    if (controller.status == States.SUCCESS_STATE) {
                      var dashboard = controller.data.data!;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: OrdersDetailCard(
                              heading: 'New \nOrders',
                              value: controller.data.data!.orderCount?.newOrders
                                  .toString(),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: OrdersDetailCard(
                              heading: 'Return in\n Progress',
                              value: controller
                                  .data.data!.orderCount?.returnInProgress
                                  .toString(),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),

                  // SizedBox(
                  //   height: size.height * 0.02,
                  // ),
                  // Row(
                  //   children: const [
                  //     Expanded(
                  //       flex: 1,
                  //       child: OrdersDetailCard(
                  //         heading: 'Return in Progress',
                  //         value: "54",
                  //       ),
                  //     ),
                  //     // SizedBox(
                  //     //   width: 20,
                  //     // ),
                  //     // Expanded(
                  //     //   flex: 1,
                  //     //   child: OrdersDetailCard(
                  //     //     heading: 'Completed',
                  //     //     value: "99+",
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 12),
                  //   child: Row(
                  //     children: const [
                  //       Expanded(
                  //         flex: 1,
                  //         child: OrdersDetailCard(
                  //           heading: 'My \nStores',
                  //           // value: "54",
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 20,
                  //       ),
                  //       Expanded(
                  //         flex: 1,
                  //         child: OrdersDetailCard(
                  //           heading: 'Delivery \n Settings',
                  //           // value: "99+",
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 12),
                  //   child: Row(
                  //     children: const [
                  //       Expanded(
                  //         flex: 1,
                  //         child: OrdersDetailCard(
                  //           heading: 'Help &\nSupport',
                  //           // value: "54",
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 20,
                  //       ),
                  //       Expanded(
                  //         flex: 1,
                  //         child: OrdersDetailCard(
                  //           heading: 'FAQ',
                  //           // value: "99+",
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 12),
                  //   child: Row(
                  //     children: const [
                  //       Expanded(
                  //         flex: 1,
                  //         child: OrdersDetailCard(
                  //           heading: 'Legal',
                  //           // value: "54",
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 20,
                  //       ),
                  //       Expanded(
                  //         flex: 1,
                  //         child: OrdersDetailCard(
                  //           heading: 'Video for\nHelp',
                  //           // value: "99+",
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  // const HeadingText(titleString: "Sales"),
                  // SizedBox(
                  //   height: size.height * 0.01,
                  // ),
                  // PrimaryButton(
                  //     text: 'abc',
                  //     op: () {
                  //       authController.logout();
                  //     },
                  //     type: 'filled'),
                  SalesDetailsWidget(
                    size: size,
                    title: 'My Stores',
                    icon: Icons.store_mall_directory,
                    route: 'my-store',
                    // value: 5000,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await deliveryController.getDeliverySettings();
                      Get.toNamed('/delivery-schedule', arguments: [false]);
                    },
                    child: Column(
                      children: [
                        Container(
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
                                    Icons.delivery_dining,
                                    size: 30,
                                    color: ThemeConfig.PRIMARY_COLOR,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Desc(descString: 'Delivery Settings'),
                                ],
                              ),
                              // LabelText(
                              //   titleString: '\u{20B9} dfdf}',
                              // ),
                              const Icon(Icons.arrow_forward_ios_rounded),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  SalesDetailsWidget(
                    icon: Icons.support_agent_rounded,
                    size: size,
                    title: 'Help & Support',
                    route: 'support',
                    // value: 50,
                  ),
                  SalesDetailsWidget(
                    icon: Icons.question_answer_rounded,
                    size: size,
                    title: 'FAQ',
                    route: 'faqs',
                    // value: 50,
                  ),
                  SalesDetailsWidget(
                    icon: Icons.credit_score_outlined,
                    size: size,
                    title: 'Terms & Conditions',
                    route: 'terms',
                    // value: 50,
                  ),
                  SalesDetailsWidget(
                    icon: Icons.video_library_outlined,
                    size: size,
                    title: 'Videos For Help',
                    route: 'videos',
                    // value: 50,
                  ),
                  SalesDetailsWidget(
                    icon: Icons.playlist_add_check_circle_outlined,
                    size: size,
                    title: 'Privacy',
                    route: 'privacy',
                    // value: 50,
                  ),
                  // SalesDetailsWidget(
                  //   icon: Icons.playlist_add_check_circle_outlined,
                  //   size: size,
                  //   title: 'About Us',
                  //   route: 'about-us',
                  //   // value: 50,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SalesDetailsWidget extends StatelessWidget {
  final String title;
  // final int value;
  final IconData? icon;
  final String? route;
  const SalesDetailsWidget({
    Key? key,
    required this.size,
    required this.title,
    // required this.value,
    this.icon,
    this.route,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/$route');
      },
      child: Column(
        children: [
          Container(
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
                // LabelText(
                //   titleString: '\u{20B9} dfdf}',
                // ),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class OrdersDetailCard extends StatelessWidget {
  final String heading;
  final String? value;
  const OrdersDetailCard({
    Key? key,
    required this.heading,
    this.value,
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
          Container(
            child: value != null
                ? Text(
                    value!,
                    style: const TextStyle(
                      color: ThemeConfig.WHITE_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  )
                : null,
          ),
          MainLabelText(
            titleString: heading,
            isWhite: true,
          ),
        ],
      ),
    );
  }
}
