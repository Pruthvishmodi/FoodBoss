import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/orders/orderlist_controller.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:seller_app/widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class ProductList extends StatelessWidget {
  final String ordertype;
  final String img;
  final String name;
  final String unit;
  final String weight;
  final String? productType;
  final String price;
  final String? prId;
  final String qty;

  final String? orderId;

  final bool? isCancelled;
  final bool? isreturned;

  final bool isCheck = false;
  const ProductList(
      {Key? key,
      required this.ordertype,
      this.isCancelled,
      this.isreturned,
      required this.img,
      required this.name,
      required this.unit,
      required this.weight,
      required this.price,
      this.prId,
      this.orderId,
      required this.qty,
      this.productType = 'success'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderListController ctrl = Get.find<OrderListController>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Row(children: [
                  // ordertype == 'Pending'
                  //     ? Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 5),
                  //       child: Checkbox(
                  //           side: MaterialStateBorderSide.resolveWith(
                  //             (states) => const BorderSide(
                  //                 width: 1.0, color: ThemeConfig.PRIMARY_COLOR),
                  //           ),
                  //           shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(10)),
                  //           splashRadius: 10,
                  //           checkColor: Colors.white,
                  //           focusColor: ThemeConfig.PRIMARY_COLOR,
                  //           activeColor: ThemeConfig.PRIMARY_COLOR,
                  //           onChanged: (bool? value) {
                  //             isCheck == value;
                  //           },
                  //           value: isCheck,
                  //         ),
                  //     )
                  //     : Container(),

                  // const SizedBox(
                  //   width: 10,
                  // ),
                  Container(
                      height: 80, width: 80, child: Image.network('$img')),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * .4),
                            child: LabelText(
                                titleString: '${qty} x ${name.split('-')[1]}')),
                        Desc(descString: '$weight $unit')
                        // const Text(
                        //   "TATA Sev ",
                        //   style: TextStyle(
                        //       color: ThemeConfig.MAIN_TEXT_COLOR,
                        //       fontSize: ThemeConfig.SUB_TITLE_SIZE,
                        //       fontWeight: FontWeight.bold,
                        //       letterSpacing: 1.00),
                        // ),
                        // const Text(
                        //   "1 kg ",
                        //   style: TextStyle(
                        //       color: ThemeConfig.SECONDARY_TEXT_COLOR,
                        //       fontSize: ThemeConfig.SUB_TITLE_SIZE,
                        //       fontWeight: FontWeight.normal,
                        //       letterSpacing: 1.00),
                        // ),
                      ],
                    ),
                  ),
                ]),
              ),
              productType == 'cancel'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\u{20B9} ${price} ",
                          style: const TextStyle(
                              color: ThemeConfig.ERROR_COLOR,
                              fontSize: ThemeConfig.SUB_TITLE_SIZE,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.00),
                        ),
                        const Desc(descString: 'Cancelled')

                        // Text(
                        //   "Cancelled",
                        //   style: TextStyle(
                        //       color: ThemeConfig.PRIMARY_COLOR,
                        //       fontSize: ThemeConfig.SUB_TITLE_SIZE,
                        //       fontWeight: FontWeight.bold,
                        //       letterSpacing: 1.00),
                        // ),
                      ],
                    )
                  : productType == 'return'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\u{20B9} ${price}",
                              style: const TextStyle(
                                  color: ThemeConfig.ERROR_COLOR,
                                  fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.00),
                            ),
                            const Desc(descString: 'Returned')
                            // Text(
                            //   "Returned",
                            //   style: TextStyle(
                            //       color: ThemeConfig.PRIMARY_COLOR,
                            //       fontSize: ThemeConfig.SUB_TITLE_SIZE,
                            //       fontWeight: FontWeight.bold,
                            //       letterSpacing: 1.00),
                            // ),
                          ],
                        )
                      : Column(
                          children: [
                            Text(
                              "\u{20B9} ${price} ",
                              style: const TextStyle(
                                  color: ThemeConfig.PRIMARY_COLOR,
                                  fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.00),
                            ),
                          ],
                        ),
              const SizedBox(
                width: 10,
              ),
              productType != 'return' && productType != 'cancel'
                  ? ordertype == 'Pending'
                      ? GestureDetector(
                          onTap: () {
                            print("dialogue e wjwfjwqf f wwfnwfnfw");
                            _showMyDialog(context, ctrl, int.parse(orderId!),
                                int.parse(prId!));
                          },
                          child: const Icon(
                            Icons.cancel_outlined,
                            color: ThemeConfig.SECONDARY_TEXT_COLOR,
                          ),
                        )
                      : Container()
                  : SizedBox()
              // SizedBox(width: 5,),
            ],
          ),
        ),
        // const Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Divider(),
        // ),
      ],
    );
  }
}

Future<void> _showMyDialog(BuildContext context, OrderListController ctrl,
    int ord_id, int pr_id) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
        ),
        title: const Text('Confirm Deletion'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Text('Choose reason for cancelling order'),
              const SizedBox(height: 10),
              Obx(
                () => DropdownButton(
                  isExpanded: true,
                  borderRadius:
                      BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                  underline: Container(
                    height: 0,
                  ),
                  value: ctrl.pd_reason.value,
                  elevation: 3,
                  style: const TextStyle(
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  items: [
                    'stock unavailable',
                    'User is fake',
                    'Distance is far',
                    'Other'
                  ]
                      .map((String value) => DropdownMenuItem(
                          value: value,
                          child: SubText(
                            text: value,
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            size: ThemeConfig.NOTIFICATION_SIZE,
                          )))
                      .toList(),
                  onChanged: (String? values) {
                    ctrl.pd_reason.value = values!;
                  },
                ),
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
              print("object mc");
              ctrl.cancelProductOder(
                ord_id,
                2,
                pr_id,
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
