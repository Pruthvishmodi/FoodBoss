import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/config/theme_config.dart';
import 'package:rider_app/models/order/completed_order_model.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:rider_app/widgets/product_list.dart';
import 'package:rider_app/widgets/text_widgets/heading_widget.dart';
import 'package:rider_app/widgets/text_widgets/title_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CompletedDeliveredCard extends StatelessWidget {
  final ProgressOrders? completeOrders;
  const CompletedDeliveredCard({Key? key, this.completeOrders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    openBottomSheet() {
      // print(completeOrders!.items!.length);
      // list = controllerGet.selectedItemList;
      Get.bottomSheet(Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: ThemeConfig.WHITE_COLOR,
        ),
        padding: const EdgeInsets.only(bottom: 3, left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    HeadingText(
                      titleString: "Completed",
                    ),
                  ],
                )),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: completeOrders!.items!.length,
                // itemCount: 3,

                itemBuilder: (BuildContext context, int index) {
                  var order = completeOrders!.items![index];
                  return ProductList(
                    img: order.media![0].url!,
                    name: "${order.name!.split('-')[1]}",
                    name1: "${order.name!.split('-')[0]}",
                    weight: '${order.weight!}',
                    price: '${order.price!}',
                    mass: '${order.quantity}',
                    unit: '${order.unit}',
                  );
                },
              ),
            ),
          ],
        ),
      ));
    }

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
                  children: const [
                    TitleText(titleString: "Completed"),
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
                      Desc(descString: completeOrders!.date ?? '222'),
                      const SizedBox(width: 5),
                      Desc(descString: completeOrders!.time ?? '123'),
                    ],
                  ),
                  Desc(
                      descString:
                          "Order ID: ${completeOrders!.orderId ?? "52"}"),
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainLabelText(
                                titleString: completeOrders!
                                        .customerDetails!.customerName ??
                                    '854'),
                            const SizedBox(height: 5),
                            // LabelText(titleString: "8549635248"),
                            GestureDetector(
                                onTap: () => launch(
                                    "tel://${completeOrders!.customerDetails!.customerNumber!}"),
                                child: Desc(
                                  descString: completeOrders!
                                          .customerDetails!.customerNumber ??
                                      '859',
                                  isSec: true,
                                )),

                            const SizedBox(height: 5),

                            Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * .5),
                              child: Text(
                                completeOrders!
                                        .customerDetails!.customerAddress ??
                                    "No Address",
                                maxLines: 3,
                                style: TextStyle(
                                  // decoration: TextDecoration.lineThrough,
                                  color: ThemeConfig.MAIN_TEXT_COLOR,
                                  fontSize: (ThemeConfig.LABEL_SIZE / 720.00) *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height >
                                          ThemeConfig.LABEL_SIZE
                                      ? (ThemeConfig.LABEL_SIZE / 720.00) *
                                          MediaQuery.of(context).size.height
                                      : ThemeConfig.LABEL_SIZE,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),

                            // LabelText(titleString: "Total Orders 12"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(
                            descString:
                                "Payment Type: ${completeOrders!.paymentMethod ?? "sdf"}"),
                        Desc(
                            descString:
                                "Total Items: ${completeOrders!.totalItems ?? "sdfg"}"),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(
                            descString:
                                "Amount Collected: \u{20B9} ${completeOrders!.amountToCollect ?? "45"}"),
                        GestureDetector(
                          onTap: () {
                            openBottomSheet();
                          },
                          child: Text(
                            'View All Items',
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
        ],
      ),
    );
  }
}

class CompletedReturned extends StatelessWidget {
  final ProgressOrders? completeOrders;

  const CompletedReturned({Key? key, this.completeOrders}) : super(key: key);

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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [TitleText(titleString: 'Returned')],
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
                      Desc(descString: completeOrders!.date!),
                      Desc(descString: "  ${completeOrders!.time!}"),
                    ],
                  ),
                  Desc(descString: "Order ID: ${completeOrders!.orderId!}"),
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainLabelText(
                                titleString: completeOrders!
                                    .customerDetails!.customerName!),
                            const SizedBox(height: 5),
                            // LabelText(titleString: "8549635248"),
                            GestureDetector(
                                onTap: () => launch("tel://8401150443"),
                                child: Desc(
                                    descString: completeOrders!
                                        .customerDetails!.customerNumber!)),

                            const SizedBox(height: 5),

                            Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * .5),
                              child: Text(
                                '${completeOrders!.customerDetails!.customerAddress ?? 'No Address'}',
                                maxLines: 3,
                                style: TextStyle(
                                  // decoration: TextDecoration.lineThrough,
                                  color: ThemeConfig.MAIN_TEXT_COLOR,
                                  fontSize: (ThemeConfig.LABEL_SIZE / 720.00) *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height >
                                          ThemeConfig.LABEL_SIZE
                                      ? (ThemeConfig.LABEL_SIZE / 720.00) *
                                          MediaQuery.of(context).size.height
                                      : ThemeConfig.LABEL_SIZE,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),

                            // LabelText(titleString: "Total Orders 12"),
                          ],
                        ),
                        // ordertype == "Returned"
                        //     ? Container()
                        //     : SizedBox(
                        //         height: 100,
                        //         width: 100,
                        //         child: Image.asset(
                        //             'assets/images/map.png')),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(
                            descString:
                                "Payment Method: ${completeOrders!.paymentMethod!}"),
                        Desc(
                            descString:
                                "Amount Collected: \u{20B9}${completeOrders!.amountToCollect!}"),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Desc(
                            descString:
                                "Total Items: ${completeOrders!.totalItems!}"),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View All Items',
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
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Desc(descString: 'Returned Items: 44'),
                      ],
                    ),
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
        ],
      ),
    );
  }
}
