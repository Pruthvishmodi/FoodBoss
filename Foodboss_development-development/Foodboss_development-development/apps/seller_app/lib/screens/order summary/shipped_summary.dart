import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/order_controller/order_controller.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:seller_app/widgets/food%20boss%20card/list_card.dart';
import 'package:seller_app/widgets/product%20list/product_list.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:url_launcher/url_launcher.dart';

class ShippedSummary extends StatefulWidget {
  final String? type;
  final String? id;
  final String? status;
  final VoidCallback? op;

  const ShippedSummary({Key? key, this.type, this.id, this.status, this.op})
      : super(key: key);

  @override
  State<ShippedSummary> createState() => _ShippedSummaryState();
}

class _ShippedSummaryState extends State<ShippedSummary> {
  var _value;
  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.find<OrderController>();

    GlobalKey _toolTipKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeConfig.WHITE_COLOR,
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        elevation: 0,
        title: const Text("Order Summary"),
      ),
      body: Obx(() {
        if (controller.shippedStatus == States.SUCCESS_STATE) {
          print('aa ${widget.id}');
          var order = controller.shippedData.data!.firstWhere((element) {
            print(element.id.toString());
            return element.id.toString() == widget.id;
          });
          return Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: SafeArea(
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 550),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Order Status: "),
                                    Text(
                                      widget.type!,
                                      style: const TextStyle(
                                          color: ThemeConfig.DISTRUCTIVE_COLOR),
                                    ),
                                  ],
                                ),

                                // FoodBossButtons(
                                //     width: 40,
                                //     height: 40,
                                //     text: "",
                                //     isIcon: true,
                                //     icon: Icons.more_vert,
                                //     color: Colors.grey.shade50,
                                //     bradius: 40,
                                //     textcolor: Colors.black,
                                //     fsize: ThemeConfig.TITLE_SIZE,
                                //     op: () {},
                                //     type: 'filled',
                                //     bwidth: 0)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: const [
                                                  MainLabelText(
                                                      titleString: "Order #"),
                                                ],
                                              ),
                                            ],
                                          ),
                                          MainLabelText(
                                              titleString: '${order.id}'),
                                          const SizedBox(
                                            width: 0,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              final dynamic _toolTip =
                                                  _toolTipKey.currentState;
                                              _toolTip.ensureTooltipVisible();
                                            },
                                            child: Tooltip(
                                              key: _toolTipKey,
                                              message: 'Copied to Clipboard',
                                              // showDuration: Duration(seconds: 1),
                                              // waitDuration: Duration(seconds: 1),
                                              // triggerMode: TooltipTriggerMode.tap,
                                              child: GestureDetector(
                                                child: IconButton(
                                                  splashRadius: 20,
                                                  icon: const Icon(
                                                    Icons.copy,
                                                    size: 16,
                                                    color: ThemeConfig
                                                        .SECONDARY_TEXT_COLOR,
                                                  ),
                                                  onPressed: () {
                                                    /* your code */ Clipboard
                                                        .setData(ClipboardData(
                                                            text:
                                                                "${order.id}"));
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      // const SizedBox(height: 10.00),
                                      // const Desc(
                                      //   descString: '15:30',
                                      // ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      MainLabelText(
                                          titleString:
                                              "\u{20B9} ${order.amount}"),
                                      // SizedBox(height: 10.00),
                                      // Desc(descString: "14 items"),
                                    ],
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LabelText(
                                    titleString: "Bag no. ${order.bagNo}"),
                                LabelText(titleString: '${order.items} Items')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Desc(
                                  descString: '${order.time}',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          ItemListCard(
                              borderRadius: 20,
                              padding: const EdgeInsets.all(20),
                              cardColor: Colors.white,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.separated(
                                separatorBuilder: (context, index) => Divider(),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: order.productList!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var product = order.productList![index];
                                  return ProductList(
                                      ordertype: widget.type!,
                                      img: product.image!,
                                      name: product.name!,
                                      productType: product.type,
                                      unit: product.unit!,
                                      weight: product.weight.toString(),
                                      price: product.price.toString(),
                                      qty: product.quantity.toString());
                                },
                              ),
                              op: () {},
                              margin: const EdgeInsets.all(8)),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: const [
                                Expanded(
                                    child: MainLabelText(
                                        titleString: "Customer comments")),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Expanded(
                                    child: order.comments == ""
                                        ? Desc(descString: "No Comments")
                                        : Desc(
                                            descString: "${order.comments}")),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Sub Total: ",
                                  style: TextStyle(
                                      color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                      fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 1.00),
                                ),
                                Text(
                                  "\u{20B9}${order.subTotal}",
                                  style: TextStyle(
                                      color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                      fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 1.00),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Delivery Charges:",
                                  style: TextStyle(
                                      color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                      fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 1.00),
                                ),
                                Text(
                                  order.deliveryCharges == 0
                                      ? 'Free'
                                      : "\u{20B9}${order.deliveryCharges}",
                                  style: TextStyle(
                                      color: ThemeConfig.SECONDARY_TEXT_COLOR,
                                      fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 1.00),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Order Total:",
                                  style: TextStyle(
                                      color: ThemeConfig.MAIN_TEXT_COLOR,
                                      fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.00),
                                ),
                                Text(
                                  "\u{20B9}${order.amount}",
                                  style: TextStyle(
                                      color: ThemeConfig.MAIN_TEXT_COLOR,
                                      fontSize: ThemeConfig.HEADING_SIZE,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.00),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(children: [
                              Row(
                                children: const [
                                  Expanded(
                                      child: MainLabelText(
                                          titleString: "Customers Details")),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: const BoxDecoration(
                                      color: ThemeConfig.FORM_COLOR,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      order.customer!.name!
                                          .split('')[0]
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 50,
                                          color: ThemeConfig.PRIMARY_COLOR),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          LabelText(
                                              titleString:
                                                  "${order.customer!.name}"),
                                          SizedBox(height: 10),
                                          GestureDetector(
                                            onTap: () => launch(
                                                "tel://${order.customer!.phone}"),
                                            child: Desc(
                                                descString:
                                                    "+91${order.customer!.phone}",
                                                isWhite: true,
                                                isSec: true),
                                          ),
                                          SizedBox(height: 5),
                                          Desc(
                                              descString:
                                                  " ${order.customer!.address ?? " B701, Sarthak heavens, near Raysan petrol pump , Gandhinagar"}"),
                                        ]),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(children: [
                              Row(
                                children: const [
                                  Expanded(
                                      child: MainLabelText(
                                          titleString: "Delivery Boy Details")),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      foregroundImage: NetworkImage(
                                          '${order.driver!.image}'),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            LabelText(
                                                titleString:
                                                    "${order.driver!.name}"),
                                            SizedBox(height: 10),
                                            GestureDetector(
                                              onTap: () => launch(
                                                  "tel://${order.driver!.phone}"),
                                              child: Desc(
                                                  descString:
                                                      "+91${order.driver!.phone}",
                                                  isWhite: true,
                                                  isSec: true),
                                            ),
                                            const SizedBox(height: 5),
                                            const Desc(
                                                descString:
                                                    "Vehicle Number: DL 5S TC 0657"),
                                          ]),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
        ),
        title: Text('Confirm Deletion'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Choose reason for cancelling order'),
              SizedBox(height: 10),
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
                items: ['stock unavailable']
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
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Confirm'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
