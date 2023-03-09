import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/orders/orderlist_controller.dart';
import 'package:seller_app/models/orders/order_list_model.dart';
import 'package:seller_app/screens/orders%20screen/crp_order.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
import 'package:seller_app/widgets/food%20boss%20card/primary_card.dart';
import 'package:seller_app/widgets/no_orders.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class PendingOrd extends StatelessWidget {
  final String type;
  final bool floating;
  final OrderListModel model;
  final IconData? icon;
  final int status;
  const PendingOrd(
      {Key? key,
      required this.type,
      required this.floating,
      this.icon,
      required this.model,
      required this.status})
      : super(key: key);

//   @override
//   State<PendingOrd> createState() => _PendingOrdState();
// }

// class _PendingOrdState extends State<PendingOrd> {

  // List<String> deliveryBoyList = [
  //   'All',
  //   'Karan Gadani',
  //   'Jay Soni',
  // ];
  // List<String> deliveryBoyListCrp = [
  //   'All',
  //   'Karan Gadani',
  //   'Jay Soni',
  // ];
  // List<String> paymentList = ['All', 'Payment Completed', 'Payment Remaining'];
  // String deliveryBoyDropdownValue = 'All';
  // String deliveryBoyDropdownValueCrp = 'All';

  // String paymentListDropdownValue = 'All';
  @override
  Widget build(BuildContext context) {
    OrderListController ctrl = Get.find<OrderListController>();
    return Scaffold(
      floatingActionButton: floating
          ? FloatingActionButton(
              onPressed: () {
                if (type == "Packed") {
                  // ctrl.assignRider();
                  if (ctrl.selected.isNotEmpty) {
                    Get.toNamed('/assign-delivery');
                  } else {
                    CustomSnackbar.errorSnackbar2('Please select any order');
                  }
                }

                if (type == "Pending") {
                  print(ctrl.selectedPending.value.length);
                  if (ctrl.selectedPending.isNotEmpty) {
                    Get.toNamed('/new_order_pdf',
                        arguments: ctrl.selectedPending.value);
                    ctrl.selectedPending.value = [];
                  } else {
                    CustomSnackbar.errorSnackbar2('Please select any order');
                  }
                }
              },
              child: Icon(
                icon!,
                color: ThemeConfig.MAIN_TEXT_COLOR,
              ),
              backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
            )
          : null,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 550.00),
          child: type == "Pending"
              ? (ctrl.ordersAll[status] != null &&
                      ctrl.ordersAll[status]!.data != null &&
                      ctrl.ordersAll[status]!.data!.isNotEmpty)
                  ? Obx(
                      () => RefreshIndicator(
                        onRefresh: () async {
                          await ctrl.getStatus();
                        },
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: ctrl.ordersAll[status] != null
                              ? ctrl.ordersAll[status]!.data != null
                                  ? ctrl.ordersAll[status]!.data!.length
                                  : 0
                              : 0,
                          itemBuilder: (context, index) => PrimaryCard(
                            buttonText: 'Pack',
                            share: true,
                            delete: true,
                            op: () {
                              ctrl.changeStatus(
                                  ord_id:
                                      ctrl.ordersAll[status]!.data![index].id!,
                                  st_id: 3,
                                  fcmToken: ctrl.ordersAll[status]!.data![index]
                                      .customer!.fcmToken!);
                            },
                            id: ctrl.ordersAll[status]!.data![index].id,
                            singleButton: false,
                            time: ctrl.ordersAll[status]!.data![index].time,
                            date: ctrl.ordersAll[status]!.data![index].date,
                            price: ctrl.ordersAll[status]!.data![index].amount,
                            items: ctrl.ordersAll[status]!.data![index].items,
                            type: ctrl.ordersAll[status]!.data![index].type
                                .toString(),
                            ordertype:
                                ctrl.ordersAll[status]!.data![index].status,
                            bagno: ctrl.ordersAll[status]!.data![index].bagNo,
                          ),
                        ),
                      ),
                    )
                  : NoOrders(
                      descString:
                          "Please wait until your customer place an order",
                      refresh: () async {
                        await ctrl.getStatus();
                      },
                    )
              : type == "Packed"
                  ? Obx(() => (ctrl.ordersAll[status] != null &&
                          ctrl.ordersAll[status]!.data != null &&
                          ctrl.ordersAll[status]!.data!.isNotEmpty)
                      ? RefreshIndicator(
                          onRefresh: () async {
                            await ctrl.getStatus();
                          },
                          child: ListView.builder(
                            itemCount:
                                model.data != null ? model.data!.length : 0,
                            itemBuilder: (context, index) => PrimaryCard(
                              index: index,
                              buttonText: 'Assign rider',
                              delete: false,
                              singleButton: false,
                              op: () {
                                if (ctrl.selected
                                        .contains(model.data![index].id) ==
                                    false) {
                                  printInfo(info: 'called');
                                  ctrl.selected.add(
                                      model.data![index].id != null
                                          ? model.data![index].id!
                                          : 0);
                                }
                                printInfo(
                                    info: 'called ${ctrl.selected.length}');
                                Get.toNamed('/assign-delivery');
                              },
                              time: model.data![index].time,
                              date: model.data![index].date,
                              price: model.data![index].amount,
                              items: model.data![index].items,
                              type: model.data![index].type.toString(),
                              ordertype: model.data![index].status,
                              id: model.data![index].id,
                              bagno: model.data![index].bagNo,
                            ),
                          ),
                        )
                      : NoOrders(
                          descString:
                              "Please wait until your customer place an order",
                          refresh: () async {
                            await ctrl.getStatus();
                          },
                        ))
                  : type == "Shipped "
                      ? Obx(
                          () => (ctrl.ordersAll[status] != null &&
                                  ctrl.ordersAll[status]!.data != null &&
                                  ctrl.ordersAll[status]!.data!.isNotEmpty)
                              ? RefreshIndicator(
                                  onRefresh: () async {
                                    await ctrl.getStatus();
                                  },
                                  child: ListView.builder(
                                    itemCount: model.data != null
                                        ? model.data!.length
                                        : 0,
                                    itemBuilder: (context, index) =>
                                        PrimaryCard(
                                      op: () {
                                        print(model.data![index].status);
                                      },
                                      buttonText: 'Move to ship',
                                      delete: false,
                                      id: model.data![index].id,
                                      singleButton: true,
                                      time: model.data![index].time,
                                      date: model.data![index].date,
                                      price: model.data![index].amount,
                                      items: model.data![index].items,
                                      type: model.data![index].type.toString(),
                                      ordertype: model.data![index].status,
                                      bagno: model.data![index].bagNo,
                                    ),
                                  ),
                                )
                              : NoOrders(
                                  descString:
                                      "Please wait until your customer place an order",
                                  refresh: () async {
                                    await ctrl.getStatus();
                                  },
                                ),
                        )
                      : type == "Completed "
                          ? Column(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => (ctrl.completed.value.data != null)
                                        ? (ctrl.completed.value.data!
                                                        .progressOrders !=
                                                    null &&
                                                ctrl.completed.value.data!
                                                    .progressOrders!.isNotEmpty)
                                            ? RefreshIndicator(
                                                onRefresh: () async {
                                                  await ctrl.getStatus();
                                                },
                                                child: ListView.builder(
                                                  itemCount: ctrl
                                                      .completed
                                                      .value
                                                      .data!
                                                      .progressOrders!
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          PrimaryCard(
                                                    buttonText: 'Collect',
                                                    delete: false,
                                                    singleButton: true,
                                                    id: ctrl
                                                        .completed
                                                        .value
                                                        .data!
                                                        .progressOrders![index]
                                                        .orderId,
                                                    time: ctrl
                                                        .completed
                                                        .value
                                                        .data!
                                                        .progressOrders![index]
                                                        .time,
                                                    date: ctrl
                                                        .completed
                                                        .value
                                                        .data!
                                                        .progressOrders![index]
                                                        .date,
                                                    price: ctrl
                                                        .completed
                                                        .value
                                                        .data!
                                                        .progressOrders![index]
                                                        .amountToCollect!
                                                        .toDouble(),
                                                    bagno: '-',
                                                    items: ctrl
                                                        .completed
                                                        .value
                                                        .data!
                                                        .progressOrders![index]
                                                        .totalItems,
                                                    type: ctrl
                                                        .completed
                                                        .value
                                                        .data!
                                                        .progressOrders![index]
                                                        .paymentMethod
                                                        .toString(),
                                                    ordertype: ctrl
                                                        .completed
                                                        .value
                                                        .data!
                                                        .progressOrders![index]
                                                        .type,
                                                  ),
                                                ),
                                              )
                                            : NoOrders(
                                                descString:
                                                    "Please wait until your customer place an order",
                                                refresh: () async {
                                                  await ctrl.getStatus();
                                                },
                                              )
                                        : NoOrders(
                                            descString:
                                                "Please wait until your customer place an order",
                                            refresh: () async {
                                              await ctrl.getStatus();
                                            },
                                          ),
                                  ),
                                ),
                              ],
                            )
                          : type == "Cancelled "
                              ? Column(
                                  children: [
                                    Expanded(
                                      child: Obx(
                                        () => (ctrl.ordersAll[status] != null &&
                                                ctrl.ordersAll[status]!.data !=
                                                    null &&
                                                ctrl.ordersAll[status]!.data!
                                                    .isNotEmpty)
                                            ? RefreshIndicator(
                                                onRefresh: () async {
                                                  await ctrl.getStatus();
                                                },
                                                child: ListView.builder(
                                                  itemCount: model.data != null
                                                      ? model.data!.length
                                                      : 0,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          PrimaryCard(
                                                    buttonText: 'Details',
                                                    delete: false,
                                                    singleButton: true,
                                                    id: model.data![index].id,
                                                    time:
                                                        model.data![index].time,
                                                    date:
                                                        model.data![index].date,
                                                    price: model
                                                        .data![index].amount,
                                                    items: model
                                                        .data![index].items,
                                                    bagno: model
                                                        .data![index].bagNo,
                                                    type: model
                                                        .data![index].type
                                                        .toString(),
                                                    ordertype: model
                                                        .data![index].status,
                                                  ),
                                                ),
                                              )
                                            : NoOrders(
                                                descString:
                                                    "Please wait until your customer place an order",
                                                refresh: () async {
                                                  await ctrl.getStatus();
                                                },
                                              ),
                                      ),
                                    ),
                                  ],
                                )
                              : type == "CRP Orders"
                                  ? Stack(
                                      children: [
                                        Obx(
                                          () =>
                                              (ctrl.crp.value.data != null &&
                                                      ctrl.crp.value.data!
                                                              .newOrders !=
                                                          null &&
                                                      ctrl
                                                          .crp
                                                          .value
                                                          .data!
                                                          .newOrders!
                                                          .isNotEmpty)
                                                  ? RefreshIndicator(
                                                      onRefresh: () async {
                                                        await ctrl.getStatus();
                                                      },
                                                      child: ListView.builder(
                                                          itemCount: (ctrl
                                                                      .crp
                                                                      .value
                                                                      .data !=
                                                                  null)
                                                              ? ctrl
                                                                          .crp
                                                                          .value
                                                                          .data!
                                                                          .newOrders !=
                                                                      null
                                                                  ? ctrl
                                                                      .crp
                                                                      .value
                                                                      .data!
                                                                      .newOrders!
                                                                      .length
                                                                  : 0
                                                              : 0,
                                                          itemBuilder:
                                                              (context,
                                                                      index) =>
                                                                  CRPOrder(
                                                                    order: ctrl
                                                                        .crp
                                                                        .value
                                                                        .data!
                                                                        .newOrders![index],
                                                                  )),
                                                    )
                                                  : NoOrders(
                                                      descString:
                                                          "Please wait until your customer place an order",
                                                      refresh: () async {
                                                        await ctrl.getStatus();
                                                      },
                                                    ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(width: 0),
        ),
      ),
    );
  }
}

class PendingOrders extends StatelessWidget {
  const PendingOrders({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OrderListController ctrl = Get.find<OrderListController>();
    return Obx(
      () => TabBarView(
        children: ctrl.status.value.data != null
            ? ctrl.status.value.data!
                .map((e) => PendingOrd(
                      status: e.id != null ? e.id! : 0,
                      floating: [1, 3].contains(e.id),
                      icon: e.id == 3
                          ? Icons.delivery_dining_rounded
                          : Icons.share,
                      type: e.status.toString(),
                      model: ctrl.ordersAll[e.id!] != null
                          ? ctrl.ordersAll[e.id!]!
                          : OrderListModel(),
                    ))
                .toList()
            : <Widget>[],
        // [
        //   PendingOrd(
        //     floating: true,
        //     icon: Icons.share,
        //     type: "pending",
        //   ),
        //   PendingOrd(
        //     floating: true,
        //     icon: Icons.delivery_dining,
        //     type: "Packed",
        //   ),
        //   PendingOrd(
        //     floating: false,
        //     type: "ship",
        //   ),
        //   PendingOrd(
        //     floating: false,
        //     type: "completed",
        //   ),
        //   PendingOrd(
        //     floating: false,
        //     type: "cancelled",
        //   ),
        // ],
      ),
    );
  }
}
