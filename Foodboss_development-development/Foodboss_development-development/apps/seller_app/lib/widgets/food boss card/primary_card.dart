import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/orders/orderlist_controller.dart';
import 'package:seller_app/controller/order_controller/order_controller.dart';
import 'package:seller_app/screens/order%20summary/cancelled_summary.dart';
import 'package:seller_app/screens/order%20summary/completed_summary.dart';
import 'package:seller_app/screens/order%20summary/packed_summary.dart';
import 'package:seller_app/screens/order%20summary/pending_summay.dart';
import 'package:seller_app/screens/order%20summary/shipped_summary.dart';
import 'package:seller_app/screens/orders%20screen/packed_card_controller.dart';
// import 'package:seller_app/shimmers/card_shimmer.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/main_label.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/distructive_text.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class PrimaryCard extends StatelessWidget {
  final String? ordertype;
  final String buttonText;
  final String? date;
  final String? bagno;
  final String? time;
  final String type;
  final int? index;
  final String? status;
  final int? id;
  final int? items;
  final double? price;
  final VoidCallback? op;
  final bool? share;
  final bool delete;
  final bool singleButton;
  const PrimaryCard({
    Key? key,
    required this.buttonText,
    required this.delete,
    required this.singleButton,
    required this.type,
    this.ordertype,
    this.share = false,
    this.index,
    this.date = '',
    this.time = '',
    this.items,
    this.price = 0,
    this.bagno = '',
    this.op,
    this.status = '',
    this.id = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderController orderController =
        Get.put(OrderController(), permanent: false);

    var controller = Get.put(PackedListController(), permanent: false);
    OrderListController ctrl = Get.find<OrderListController>();
    return GestureDetector(
      onTap: ordertype == 'Packed'
          ? () {
              print('helow');
              // controller.addIndex(index!);
            }
          : ordertype == 'Pending'
              ? () {
                  print('obj');
                  if (ctrl.selectedPending.value.contains(id)) {
                    ctrl.selectedPending.remove(id);
                  } else {
                    ctrl.selectedPending.add(id);
                  }
                }
              : () {},
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.00),
            border: Border.all(
                width: ctrl.selectedPending.contains(id) ? 0.5 : 0,
                color: ctrl.selectedPending.contains(id)
                    ? Colors.green
                    : Colors.transparent),
            color: ThemeConfig.WHITE_COLOR,
          ),
          margin: const EdgeInsets.all(20.00),
          padding: const EdgeInsets.all(20.00),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelText(titleString: "Bag no. ${bagno}"),
                        Desc(descString: "${date}"),
                        Desc(descString: "${time}"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DistructiveText(titleString: type),
                        ordertype == 'Packed'
                            ? Obx(
                                () => Visibility(
                                  visible: true,
                                  child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      side: const BorderSide(
                                          color: ThemeConfig.PRIMARY_COLOR,
                                          width: 0.5),
                                      activeColor: ThemeConfig.PRIMARY_COLOR,
                                      value: ctrl.selected.contains(id),
                                      onChanged: (Value) {
                                        // controller.addIndex(widget.index);
                                        if (id != null) {
                                          ctrl.selected.contains(id)
                                              ? ctrl.selected.remove(id)
                                              : ctrl.selected.add(id!);
                                        }
                                      }),
                                ),
                              )
                            : Container(),
                        share!
                            ? const SizedBox(width: 10)
                            : const SizedBox(
                                width: 0,
                              ),
                        share!
                            ? GestureDetector(
                                onTap: () {
                                  // _showMyDialog(context, ctrl, id!);
                                  // generatePdf();
                                  Get.toNamed('/new_order_pdf',
                                      arguments: [id!]);
                                  // orderController.buildPdf(id!);
                                },
                                child: const Icon(
                                  Icons.share,
                                  color: ThemeConfig.SUCCESS_COLOR,
                                ),
                              )
                            : const SizedBox(width: 0),
                        delete
                            ? const SizedBox(width: 10)
                            : const SizedBox(
                                width: 0,
                              ),
                        delete
                            ? GestureDetector(
                                onTap: () {
                                  _showMyDialog(context, ctrl, id!);
                                },
                                child: const Icon(
                                  Icons.delete_outline_rounded,
                                  color: ThemeConfig.ERROR_COLOR,
                                ),
                              )
                            : const SizedBox(width: 0),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    // width: 20,
                    // height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.00),
                      color: ThemeConfig.FORM_COLOR,
                    ),

                    padding: const EdgeInsets.all(10),
                    child: const MainLabelText(
                      titleString: "\u{20B9}",
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Desc(descString: "${items} items"),
                        MainLabelText(titleString: "\u{20B9} ${price}"),
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
                    flex: 1,
                    child: PrimaryButton(
                      text: "Details",
                      op: () async {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => OrderSummary(
                        //               type: ordertype!,
                        //             )));
                        if (ordertype == "Pending") {
                          orderController.getOrderDetailsByStatus(1);

                          Get.to(PendingSummary(
                            type: ordertype!,
                            id: id.toString(),
                            op: () {
                              op!();
                            },
                          ));
                        } else {
                          if (ordertype == "Packed") {
                            orderController.getOrderDetailsByStatus(3);

                            Get.to(PackedSummary(
                              type: ordertype!,
                              id: id.toString(),
                              op: () {
                                op!();
                              },
                            ));
                          } else {
                            if (ordertype == "Shipped ") {
                              print('asdf ${id}');
                              orderController.getOrderDetailsByStatus(4);
                              Get.to(ShippedSummary(
                                type: ordertype!,
                                id: id.toString(),
                                op: () {
                                  op!();
                                },
                              ));
                            } else {
                              if (ordertype == "Completed") {
                                print('asdf ${ordertype}');
                                await orderController
                                    .getOrderDetailsByStatus(5);
                                Get.to(CompletedSummary(
                                  type: ordertype!,
                                  id: id.toString(),
                                ));
                              } else {
                                if (ordertype == "Cancelled ") {
                                  print('asdf ${id}');
                                  orderController.getOrderDetailsByStatus(6);
                                  Get.to(CancelledSummary(
                                    type: ordertype!,
                                    id: id.toString(),
                                  ));
                                }
                              }
                            }
                          }
                        }

                        print('asd $ordertype');
                        print('asd $id');
                      },
                      type: "outlined",
                    ),
                  ),
                  !singleButton
                      ? const SizedBox(
                          width: 20,
                        )
                      : const SizedBox(
                          width: 0,
                        ),
                  !singleButton
                      ? Expanded(
                          flex: 1,
                          child: buttonText == 'Assign rider'
                              ? PrimaryButton(
                                  text: buttonText,
                                  op: () {
                                    op!();
                                  },
                                  type: "filled",
                                )
                              : PrimaryButton(
                                  text: buttonText,
                                  op: () {
                                    buttonText == 'Pack'
                                        ? op != null
                                            ? op!()
                                            : () {}
                                        : buttonText == 'Assign rider'
                                            ? op != null
                                                ? op!()
                                                : () {}
                                            : () {};
                                  },
                                  type: "filled",
                                ),
                        )
                      : const SizedBox(
                          width: 0,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(
    BuildContext context, OrderListController ctrl, int ord_id) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Obx(() => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
            ),
            title: const Text('Confirm Deletion'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const Text('Choose reason for cancelling order'),
                  const SizedBox(height: 10),
                  DropdownButton(
                    isExpanded: true,
                    borderRadius:
                        BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                    underline: Container(
                      height: 0,
                    ),
                    value: ctrl.ord_reason.value,
                    elevation: 3,
                    style: const TextStyle(
                      color: ThemeConfig.PRIMARY_COLOR,
                    ),
                    items: ctrl.reasons.value
                        .map((String value) => DropdownMenuItem(
                            value: value,
                            child: SubText(
                              text: value,
                              color: ThemeConfig.MAIN_TEXT_COLOR,
                              size: ThemeConfig.NOTIFICATION_SIZE,
                            )))
                        .toList(),
                    onChanged: (String? value) {
                      ctrl.ord_reason.value = value ?? 'stock unavailable';
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Confirm'),
                onPressed: () {
                  ctrl.ord_reason.value = ctrl.reasons.value.first;
                  ctrl.cancelOder(
                    ord_id: ord_id,
                    st_id: 6,
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
    },
  );
}
