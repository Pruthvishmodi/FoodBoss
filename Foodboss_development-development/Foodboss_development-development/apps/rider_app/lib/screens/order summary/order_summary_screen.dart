import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:rider_app/widgets/SubText.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/food%20boss%20button/food_boss_button.dart';
import 'package:rider_app/widgets/food%20boss%20card/list_card.dart';
import 'package:rider_app/widgets/food%20boss%20card/primary_card.dart';
import 'package:rider_app/widgets/product%20list/product_list.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderSummary extends StatefulWidget {
  final String? type;
  const OrderSummary({Key? key, this.type}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  var _value;
  @override
  Widget build(BuildContext context) {
    GlobalKey _toolTipKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeConfig.WHITE_COLOR,
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        elevation: 0,
        title: const Text("Order Summary"),
      ),
      body: Stack(
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
                            widget.type == 'Pending'
                                ? PopupMenuButton<int>(
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuItem<int>>[
                                          new PopupMenuItem<int>(
                                              value: 1,
                                              child:
                                                  new Text('Block customer')),
                                        ],
                                    onSelected: (int value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    })
                                : Container()
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      const MainLabelText(titleString: '12345'),
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
                                                    .setData(
                                                        const ClipboardData(
                                                            text: "12345"));
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
                                children: const [
                                  MainLabelText(titleString: "\u{20B9} 123456"),
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
                          children: const [
                            LabelText(titleString: "Bag no. 10"),
                            LabelText(titleString: '14 Items')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Desc(
                              descString: '15:30',
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
                          child: widget.type == 'Pending'
                              ? Column(
                                  children: [
                                    ProductList(
                                      ordertype: widget.type!,
                                    ),
                                    ProductList(
                                      ordertype: widget.type!,
                                    ),
                                    ProductList(
                                      ordertype: widget.type!,
                                    ),
                                  ],
                                )
                              : widget.type == 'Packed'
                                  ? Column(
                                      children: [
                                        ProductList(
                                          ordertype: widget.type!,
                                        ),
                                        ProductList(
                                          ordertype: widget.type!,
                                        ),
                                        ProductList(
                                          ordertype: widget.type!,
                                          isCancelled: true,
                                        ),
                                      ],
                                    )
                                  : widget.type == 'Shipped'
                                      ? Column(
                                          children: [
                                            ProductList(
                                              ordertype: widget.type!,
                                            ),
                                            ProductList(
                                              ordertype: widget.type!,
                                            ),
                                            ProductList(
                                              ordertype: widget.type!,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            ProductList(
                                              ordertype: widget.type!,
                                            ),
                                            ProductList(
                                              ordertype: widget.type!,
                                              isreturned: true,
                                            ),
                                            ProductList(
                                              ordertype: widget.type!,
                                              isCancelled: true,
                                            ),
                                          ],
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
                          children: const [
                            Expanded(
                                child: Desc(
                                    descString:
                                        "If something went wrong let us know")),
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
                            const Text(
                              "\u{20B9}15.43",
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
                            const Text(
                              "Free",
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
                            const Text(
                              "\u{20B9}847",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                foregroundImage:
                                    AssetImage('assets/images/profile_pic.jpg'),
                              ),
                              // Container(
                              //     width: 100.0,
                              //     height: 100.0,
                              //     decoration: const BoxDecoration(
                              //       borderRadius:
                              //           BorderRadius.all(Radius.circular(50.0)),
                              //       color: Colors.redAccent,
                              //     ),
                              //     child: const Image(
                              //       image: AssetImage('assets/images/intro-01.png'),
                              //     )),
                              const SizedBox(
                                width: 40,
                              ),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LabelText(titleString: "Jay Soni"),
                                      SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () => launch("tel://8780508717"),
                                        child:
                                            Desc(descString: "+91-8787878787"),
                                      ),
                                      SizedBox(height: 5),
                                      Desc(
                                          descString:
                                              "B701, Sarthak heavens, near Raysan petrol pump , Gandhinagar"),
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
                      widget.type == 'Shipped'
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(children: [
                                Row(
                                  children: const [
                                    Expanded(
                                        child: MainLabelText(
                                            titleString:
                                                "Delivery Boy Details")),
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
                                      const CircleAvatar(
                                        radius: 40,
                                        foregroundImage: AssetImage(
                                            'assets/images/profile_pic.jpg'),
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const LabelText(
                                                  titleString: "Jay Soni"),
                                              SizedBox(height: 10),
                                              GestureDetector(
                                                onTap: () =>
                                                    launch("tel://8780508717"),
                                                child: const Desc(
                                                    descString:
                                                        "+91-8787878787"),
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
                                const SizedBox(
                                  height: 50,
                                ),
                              ]),
                            )
                          : widget.type == 'Completed'
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(children: [
                                    Row(
                                      children: const [
                                        Expanded(
                                            child: MainLabelText(
                                                titleString:
                                                    "Delivery Boy Details")),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const CircleAvatar(
                                          radius: 40,
                                          foregroundImage: AssetImage(
                                              'assets/images/profile_pic.jpg'),
                                        ),
                                        // Container(
                                        //     width: 100.0,
                                        //     height: 100.0,
                                        //     decoration: const BoxDecoration(
                                        //       borderRadius:
                                        //           BorderRadius.all(Radius.circular(50.0)),
                                        //       color: Colors.redAccent,
                                        //     ),
                                        //     child: const Image(
                                        //       image: AssetImage('assets/images/intro-01.png'),
                                        //     )),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        Expanded(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                LabelText(
                                                    titleString: "Jay Soni"),
                                                SizedBox(height: 10),
                                                Desc(
                                                    descString:
                                                        "+91-8787878787"),
                                                SizedBox(height: 5),
                                                Desc(
                                                    descString:
                                                        "Vehicle Number: DL 5S TC 0657"),
                                              ]),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                  ]),
                                )
                              : const SizedBox(
                                  height: 00,
                                ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            child: widget.type == 'Shipped' ||
                    widget.type == 'Completed' ||
                    widget.type == 'Cancelled'
                ? Container()
                : Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 550),
                      width: MediaQuery.of(context).size.width,
                      child: widget.type == 'Packed'
                          ? Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: PrimaryButton(
                                      op: () {},
                                      text: "Assign Delivery Boy",
                                      type: "filled",
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: PrimaryButton(
                                    op: () {
                                      _showMyDialog(context);
                                    },
                                    text: widget.type == 'Pending'
                                        ? "Cancel"
                                        // : type == 'Completed'
                                        //     ? "Collect CRP"
                                        : "Pack Order",
                                    type: "filled",
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: PrimaryButton(
                                    op: () {},
                                    text: widget.type == 'Pending'
                                        ? "Pack"
                                        // : type == 'Completed'
                                        //     ? "Collect COD"
                                        : "Pack Order",
                                    type: "filled",
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                    ),
                  ),
          )
        ],
      ),
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
