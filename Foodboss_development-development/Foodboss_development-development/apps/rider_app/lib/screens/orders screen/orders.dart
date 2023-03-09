import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/UI%20controller/OrderController/new_order_controller.dart';
import 'package:rider_app/utils/states.dart';
import 'package:rider_app/widgets/Heading.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/food%20boss%20card/primary_card.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:rider_app/widgets/no%20order%20widget/no_order_screen.dart';
import 'package:rider_app/widgets/text_widgets/heading_widget.dart';
import 'package:shared_widgets/shared_widgets.dart';

class PendingOrd extends StatefulWidget {
  final String type;
  final bool floating;
  final IconData? icon;
  const PendingOrd(
      {Key? key, required this.type, required this.floating, this.icon})
      : super(key: key);

  @override
  State<PendingOrd> createState() => _PendingOrdState();
}

class _PendingOrdState extends State<PendingOrd> {
  openBottomSheet() {
    Get.bottomSheet(Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: ThemeConfig.WHITE_COLOR,
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Heading('Generated Code', ThemeConfig.MAIN_TEXT_COLOR),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    HeadingText(titleString: '1'),
                    HeadingText(titleString: '2'),
                    HeadingText(titleString: '8'),
                    HeadingText(titleString: '7'),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: PrimaryButton(
                  op: () {},
                  text: 'Done',
                  type: "filled",
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  List<String> deliveryBoyList = [
    'All',
    'Karan Gadani',
    'Jay Soni',
  ];
  List<String> deliveryBoyListCrp = [
    'All',
    'Karan Gadani',
    'Jay Soni',
  ];
  List<String> paymentList = ['All', 'Payment Completed', 'Payment Remaining'];
  String deliveryBoyDropdownValue = 'All';
  String deliveryBoyDropdownValueCrp = 'All';

  String paymentListDropdownValue = 'All';

  NewOrderController OrderController =
      Get.put(NewOrderController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.floating
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(
                widget.icon!,
                color: ThemeConfig.MAIN_TEXT_COLOR,
              ),
              backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
            )
          : null,
      body: RefreshIndicator(
        onRefresh: () async {
          OrderController.getNewOrderData();
          OrderController.getShippedOrderData();
          OrderController.getCompletedOrderData();
          OrderController.getPayReturnOrderData();
        },
        child: Center(
          child: Container(
              constraints: const BoxConstraints(maxWidth: 550.00),
              child: widget.type == "new order"
                  ? Stack(children: [
                      Obx(
                        () {
                          if (OrderController.status == States.SUCCESS_STATE) {
                            if (OrderController.data.data!.totalNewOrders ==
                                0) {
                              return const NoOrder();
                            } else {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        right: 10,
                                        left: 10,
                                        bottom: 10),
                                    child: Row(
                                      children: [
                                        MainLabelText(
                                            titleString:
                                                'Total New Orders : ${OrderController.data.data!.totalNewOrders ?? "0"}  ')
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: OrderController
                                          .data.data!.newOrdersStore!.length,
                                      itemBuilder: (context, index) =>
                                          PrimaryCard(
                                        newOrders: OrderController
                                            .data.data!.newOrdersStore![index],
                                        buttonText: 'Accept',
                                        delete: false,
                                        singleButton: true,
                                        type: "khata",
                                        ordertype: 'Pending',
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ])
                  : widget.type == "shipped"
                      ? Stack(children: [
                          Obx(() {
                            if (OrderController.shippedStatus ==
                                States.SUCCESS_STATE) {
                              if (OrderController
                                      .shippedd.data!.totalShippedOrders ==
                                  0) {
                                return const NoOrder();
                              } else {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          right: 10,
                                          left: 10,
                                          bottom: 10),
                                      child: Row(
                                        children: [
                                          MainLabelText(
                                              titleString:
                                                  'Total Shipped Orders : ${OrderController.shippedd.data!.totalShippedOrders}')
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: ListView.builder(
                                      itemCount: OrderController.shippedd.data!
                                          .progressOrders!.length,
                                      itemBuilder: (context, index) =>
                                          PrimaryCard(
                                        progressOrders: OrderController.shippedd
                                            .data!.progressOrders![index],
                                        buttonText: 'Assign rider',
                                        delete: false,
                                        singleButton: true,
                                        type: "khata",
                                        ordertype: 'Packed',
                                      ),
                                    )),
                                  ],
                                );
                              }
                            } else {
                              return const Center(
                                child: const CircularProgressIndicator(),
                              );
                            }
                          }),
                        ])
                      : widget.type == "completed"
                          ? Stack(children: [
                              Obx(() {
                                if (OrderController.completedStatus ==
                                    States.SUCCESS_STATE) {
                                  if (OrderController.completed.data!
                                          .totalCompletedOrders ==
                                      0) {
                                    return const NoOrder();
                                  } else {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              right: 10,
                                              left: 10,
                                              bottom: 10),
                                          child: Row(
                                            children: [
                                              MainLabelText(
                                                  titleString:
                                                      'Total Delivered Orders : ${OrderController.completed.data!.totalCompletedOrders}')
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: ListView.builder(
                                          itemCount: OrderController.completed
                                              .data!.progressOrders!.length,
                                          itemBuilder: (context, index) =>
                                              PrimaryCard(
                                            completeOrders: OrderController
                                                .completed
                                                .data!
                                                .progressOrders![index],
                                            buttonText: 'Assign rider',
                                            delete: false,
                                            singleButton: true,
                                            type: "khata",
                                            ordertype: OrderController
                                                .completed
                                                .data!
                                                .progressOrders![index]
                                                .type,
                                          ),
                                        )),
                                      ],
                                    );
                                  }
                                } else {
                                  return const Center(
                                    child: const CircularProgressIndicator(),
                                  );
                                }
                              }),
                            ])
                          // Seller Payment & Return
                          : Stack(children: [
                              Obx(() {
                                if (OrderController.payReturnStatus ==
                                    States.SUCCESS_STATE) {
                                  if (OrderController
                                          .payReturn.data!.totalShippedOrder ==
                                      0) {
                                    return const NoOrder();
                                  } else {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              right: 10,
                                              left: 10,
                                              bottom: 10),
                                          child: Row(
                                            children: [
                                              MainLabelText(
                                                  titleString:
                                                      'Total Delivered Orders : ${OrderController.payReturn.data!.totalShippedOrder}')
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: ListView.builder(
                                          itemCount: OrderController.payReturn
                                              .data!.newOrders!.length,
                                          itemBuilder: (context, index) =>
                                              PrimaryCard(
                                            payReturn: OrderController.payReturn
                                                .data!.newOrders![index],
                                            buttonText: 'Assign rider',
                                            delete: false,
                                            singleButton: true,
                                            type: "khata",
                                            ordertype:
                                                // OrderController
                                                //                 .payReturn
                                                //                 .data!
                                                //                 .newOrders![index]
                                                //                 .returnItem ==
                                                //             null ||
                                                OrderController
                                                            .payReturn
                                                            .data!
                                                            .newOrders![index]
                                                            .returnItem ==
                                                        0
                                                    ? ''
                                                    : 'Payment',
                                          ),
                                        )),
                                      ],
                                    );
                                  }
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                            ])),
        ),
      ),
    );
  }
}

class PendingOrders extends StatelessWidget {
  const PendingOrders({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        PendingOrd(
          floating: false,
          icon: Icons.share,
          type: "new order",
        ),
        PendingOrd(
          floating: false,
          icon: Icons.delivery_dining,
          type: "shipped",
        ),
        PendingOrd(
          floating: false,
          type: "pend",
        ),
        PendingOrd(
          floating: false,
          type: "completed",
        ),
      ],
    );
  }
}
