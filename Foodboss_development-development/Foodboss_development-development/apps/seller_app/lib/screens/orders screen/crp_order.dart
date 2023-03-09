import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/orders/orderlist_controller.dart';
import 'package:seller_app/models/orders/order_crp_model.dart';
import 'package:seller_app/widgets/Heading.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/heading_widget.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:seller_app/widgets/text_widgets/title_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:url_launcher/url_launcher.dart';

class CRPOrder extends StatelessWidget {
  final NewOrders order;
  const CRPOrder({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderListController ctrl = Get.find<OrderListController>();
    Size size = MediaQuery.of(context).size;
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(
                        titleString:
                            order.returnItem! > 0 ? 'Pay & Return' : 'Pay')
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Desc(descString: order.deliveredDate.toString()),
                      Desc(descString: order.deliveredTime.toString()),
                    ],
                  ),
                  // Desc(
                  //     descString:
                  //         "Order ID: ${order.toString()}"),
                ],
              )),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainLabelText(titleString: order.driverName.toString()),
                        GestureDetector(
                            onTap: () => launch(
                                "tel://${order.driverNumber.toString()}"),
                            child: Desc(
                                descString:
                                    '+91-${order.driverNumber.toString()}')),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // LabelText(titleString: "8549635248"),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(
                            descString:
                                "Total Orders: ${order.totalOrder.toString()}"),
                        InkWell(
                          onTap: () {
                            if (order.returnItems != null &&
                                order.returnItems!.isNotEmpty) {
                              openProductBottomSheet(order.returnItems!, size);
                            }
                          },
                          child: Text(
                            'View All returned items: ${order.returnItem.toString()}',
                            maxLines: 3,
                            style: TextStyle(
                              // decoration: TextDecoration.lineThrough,
                              color: ThemeConfig.PRIMARY_COLOR,
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
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(
                            descString:
                                "Delivered Orders: ${order.deliveredOrder.toString()}"),
                        Desc(
                            descString:
                                "Returned Orders: ${order.returnedOrder.toString()}"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(descString: "Total Items: ${order.totalItems}"),
                        Desc(descString: "Returned Items: ${order.returnItem}"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelText(
                            titleString:
                                "Old Amount: \u{20B9}${order.amountCollectedOld.toString()}"),
                        LabelText(
                            titleString:
                                "New Amount: \u{20B9}${order.amountCollectedNew.toString()}"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    LabelText(
                        titleString:
                            "Final COD amount: \u{20B9}${order.finalAmount.toString()}"),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
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
                    text: "Collect",
                    op: () async {
                      await ctrl.generateCode(
                          driver_id:
                              order.driverId != null ? order.driverId! : 0);
                      openBottomSheet(code: ctrl.code.value);
                      // Get.to(const IndividualNewOrders());
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

openBottomSheet({String code = '0000'}) {
  Get.bottomSheet(
    Wrap(
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
                  children: [
                    ...code
                        .split('')
                        .map(
                          (e) => HeadingText(titleString: e),
                        )
                        .toList(),
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
                  op: () {
                    Get.back();
                  },
                  text: 'Done',
                  type: "filled",
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    isDismissible: false,
  );
}

openProductBottomSheet(List<ReturnItems> products, Size size) {
  Get.bottomSheet(
    Wrap(
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: size.height * 0.4),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: ThemeConfig.WHITE_COLOR,
          ),
          child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) => SizedBox(
                    child: Row(
                      children: [
                        Image(
                          image: NetworkImage((products[index].media != null &&
                                  products[index].hasMedia!)
                              ? products[index].media![0].url.toString()
                              : ThemeConfig.NOIMAGELINK),
                          width: 100,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelText(
                                titleString: products[index].name.toString()),
                            const SizedBox(
                              height: 5,
                            ),
                            Desc(
                                descString:
                                    '${products[index].quantity} x ${products[index].weight} ${products[index].unit}'),
                            const SizedBox(
                              height: 5,
                            ),
                            LabelText(
                                titleString:
                                    '\u{20B9}${products[index].discountPrice}'),
                          ],
                        )),
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
              itemCount: products.length),
        ),
      ],
    ),
  );
}
