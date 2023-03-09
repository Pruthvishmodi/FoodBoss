import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/config/theme_config.dart';
// import 'package:rider_app/config/theme_config.dart';
import 'package:rider_app/controller/UI%20controller/OrderController/new_order_controller.dart';
import 'package:rider_app/models/order/new_order_model.dart';
import 'package:rider_app/screens/Store_order/Individual_store_screen.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:url_launcher/url_launcher.dart';

class PendingCardd extends StatelessWidget {
  final NewOrdersStore? newOrders;
  PendingCardd({Key? key, this.newOrders}) : super(key: key);
  NewOrderController controller = Get.find<NewOrderController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.00),
        color: ThemeConfig.WHITE_COLOR,
      ),
      margin: const EdgeInsets.all(20.00),
      padding: const EdgeInsets.all(20.00),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.3,
              //   constraints: BoxConstraints(
              //       maxWidth: MediaQuery.of(context).size.width * .3),
              Expanded(
                child: MainLabelText(
                    // isDot: true,
                    // align: TextAlign.left,
                    isAlign: true,
                    titleString: '${newOrders!.shopName!}'),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // DistructiveText(titleString: type),
                    // const Desc(descString: "20 JAN "),
                    // const Desc(descString: "  02:45 AM"),
                    GestureDetector(
                        onTap: () => launch(
                            "tel://${newOrders!.shopPhoneNumber.toString()}"),
                        child: Desc(
                          descString: newOrders!.shopPhoneNumber.toString(),
                          isSec: true,
                        )),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 5),
                  // LabelText(titleString: "8549635248"),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * .7),
                    child: Text(
                      newOrders!.address!,
                      maxLines: 3,
                      style: TextStyle(
                        // decoration: TextDecoration.lineThrough,
                        color: ThemeConfig.MAIN_TEXT_COLOR,
                        fontSize: (ThemeConfig.LABEL_SIZE / 720.00) *
                                    MediaQuery.of(context).size.height >
                                ThemeConfig.LABEL_SIZE
                            ? (ThemeConfig.LABEL_SIZE / 720.00) *
                                MediaQuery.of(context).size.height
                            : ThemeConfig.LABEL_SIZE,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  Desc(descString: "Total Orders: ${newOrders!.totalOrders!}"),
                  const SizedBox(height: 5),

                  // LabelText(titleString: "Total Orders 12"),
                ],
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
                    text: "View All Orders",
                    op: () {
                      var shopname = newOrders!.shopName;
                      var shopId = newOrders!.shopId;
                      print('aaa $shopname   ${newOrders!.shopName!}');
                      print('fhj $shopId   ${newOrders!.shopId!}');
                      controller.getNewOrderbyStoreData(newOrders!.shopId!);
                      Get.to(() => IndividualNewOrders(),
                          arguments: [shopname, shopId]);

                      // codeSheet();
                    },
                    type: "filled",
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
