import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/UI%20controller/OrderController/new_order_controller.dart';
import 'package:rider_app/models/order/completed_order_model.dart';
import 'package:rider_app/models/order/new_order_model.dart';
import 'package:rider_app/models/order/pay_return_model.dart';
import 'package:rider_app/models/order/shipped_order_model.dart';
import 'package:rider_app/screens/Store_order/Individual_store_screen.dart';
import 'package:rider_app/widgets/food%20boss%20card/completed_cards.dart';
import 'package:rider_app/widgets/food%20boss%20card/packed_card.dart';
import 'package:rider_app/widgets/food%20boss%20card/pending_card.dart';
import 'package:rider_app/widgets/food%20boss%20card/seller_pay.dart';
import 'package:rider_app/widgets/text_widgets/title_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

import 'package:rider_app/widgets/SubText.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:rider_app/widgets/otp_form.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PrimaryCard extends StatelessWidget {
  final String? ordertype;
  final String buttonText;
  final String type;
  final bool delete;
  final bool singleButton;
  final NewOrdersStore? newOrders;
  final ShippedOrders? progressOrders;
  final ProgressOrders? completeOrders;
  final PayReturnOrders? payReturn;

  const PrimaryCard(
      {Key? key,
      required this.buttonText,
      required this.delete,
      required this.singleButton,
      required this.type,
      this.ordertype,
      this.newOrders,
      this.progressOrders,
      this.completeOrders,
      this.payReturn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewOrderController controller =
        Get.put(NewOrderController(), permanent: false);
    return ordertype == "Pending"
        ? PendingCardd(
            newOrders: newOrders, 
          )
        : ordertype == "Packed"
            ? ShippedCard(
                progressOrders: progressOrders,
              )
            // Completed Card- delivered
            : ordertype == "Completed"
                ? CompletedDeliveredCard(
                    completeOrders: completeOrders,
                  )
                //Completed Retuned
                : ordertype == 'Returned'
                    ? CompletedReturned(
                        completeOrders: completeOrders,
                      )
                    // Pay & return
                    : ordertype == "Payment"
                        ? SellerPay(
                            payReturn: payReturn,
                          )

                        // Pay card
                        : SellerPayReturn(
                            payReturn: payReturn,
                          );
  }
}

List<String> reasons = [
  'stock unavailable',
  'user is fake',
  'distance is far',
  'Other',
];

Future<void> _showMyDialog(BuildContext context) async {
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
              DropdownButton(
                isExpanded: true,
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                underline: Container(
                  height: 0,
                ),
                value: "stock unavailable",
                elevation: 3,
                style: const TextStyle(
                  color: ThemeConfig.PRIMARY_COLOR,
                ),
                items: reasons
                    .map((String value) => DropdownMenuItem(
                        value: value,
                        child: SubText(
                          text: value,
                          color: ThemeConfig.MAIN_TEXT_COLOR,
                          size: ThemeConfig.NOTIFICATION_SIZE,
                        )))
                    .toList(),
                onChanged: (Object? values) {},
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
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
