import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:seller_app/infrastructure/orders/order_services.dart';
import 'package:seller_app/models/orders/cancelled_order_model.dart';
import 'package:seller_app/models/orders/completed_order_model.dart';
import 'package:seller_app/models/orders/order_list_model.dart' as ol;
import 'package:seller_app/models/orders/packed_order_model.dart';
import 'package:seller_app/models/orders/shipped_order_model.dart';
import 'package:seller_app/utils/states.dart';
import 'package:shared_widgets/Config/theme_config.dart';
// import 'package:xml/xml.dart' as xml;

class OrderController extends GetxController {
  var _data = ol.OrderListModel().obs;
  var _state = States.INITIAL_STATE.obs;

  String get status => _state.value;

  ol.OrderListModel get data => _data.value;

  // Future<void> getOrderList() async {
  //   _state.value = States.LOADING_STATE;
  //   try {
  //     OrderModel? response = await OrderCall.getOrder();
  //     if (response == null) {
  //       _state.value = States.ERROR_STATE;
  //       CustomSnackbar.errorSnackbar2('Something went wrong while loading order');
  //     } else {
  //       _data.value = response;
  //       _state.value = States.SUCCESS_STATE;
  //     }
  //   } catch (e) {
  //     printInfo(info:'$e errrorhere');
  //     CustomSnackbar.errorSnackbar2("Something went wrong");
  //     _state.value = States.ERROR_STATE;
  //   }
  // }
  var _packedData = PackedOrderModel().obs;
  var _packedState = States.INITIAL_STATE.obs;

  String get packedStatus => _packedState.value;
  PackedOrderModel get packedData => _packedData.value;

  var _shippedData = ShippedOrderModel().obs;
  var _shippedState = States.INITIAL_STATE.obs;
  String get shippedStatus => _shippedState.value;
  ShippedOrderModel get shippedData => _shippedData.value;

  var _completedData = CompletedOrderModel().obs;
  var _completedState = States.INITIAL_STATE.obs;
  String get completedStatus => _completedState.value;
  CompletedOrderModel get completedData => _completedData.value;

  var _cancelledData = CancelledOrderModel().obs;
  var _cancelledState = States.INITIAL_STATE.obs;
  String get cancelledStatus => _cancelledState.value;
  CancelledOrderModel get cancelledData => _cancelledData.value;

  Future<void> getOrderDetailsByStatus(int status) async {
    print('called');
    _state.value = States.LOADING_STATE;
    try {
      var response = await OrderServices.getOrderByStatussss(status);
      print('aaaa $response');
      if (response == null) {
        _state.value = States.ERROR_STATE;
        // Get.snackbar('Error', 'Something went wrong Plan history');
      } else {
        // var raw = xml.parse(response.data!.privacyText!);
        // var priivcy = raw.findAllElements('#text');
        // print(priivcy);
        if (status == 1) {
          _data.value = ol.OrderListModel.fromJson(response);
          _state.value = States.SUCCESS_STATE;
          print('aaasasas $response');
        } else {
          if (status == 3) {
            _packedData.value = PackedOrderModel.fromJson(response);
            _packedState.value = States.SUCCESS_STATE;
            print('packed $response');
          } else {
            if (status == 4) {
              _shippedData.value = ShippedOrderModel.fromJson(response);
              _shippedState.value = States.SUCCESS_STATE;
              print('shipped $response');
            } else {
              if (status == 5) {
                _completedData.value = CompletedOrderModel.fromJson(response);
                _completedState.value = States.SUCCESS_STATE;
                print('completed $response');
              } else {
                if (status == 6) {
                  _cancelledData.value = CancelledOrderModel.fromJson(response);
                  _cancelledState.value = States.SUCCESS_STATE;
                  print('cancelled $response');
                }
              }
            }
          }
        }
      }
    } catch (e) {
      print(' here haha$e');
      // Get.snackbar("Opps", "D");
      _state.value = States.ERROR_STATE;
    }
  }

  Future<Uint8List> buildPdf(int id) async {
    await getOrderDetailsByStatus(1);
    var order = _data.value.data!.firstWhere((element) => element.id == id);
    final pdf = pw.Document();
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Wrap(
            children: [
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          children: [
                            pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Row(
                                  children: [
                                    pw.Text("Order #",
                                        style: pw.TextStyle(
                                            fontSize: 25,
                                            fontWeight: pw.FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                            pw.Text('${order.id}',
                                style: pw.TextStyle(
                                    fontSize: 25,
                                    fontWeight: pw.FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),

                    pw.Text("Bag no. ${order.bagNo}",
                        style: pw.TextStyle(
                            fontSize: 25, fontWeight: pw.FontWeight.bold)),
                    // pw.Column(
                    //   mainAxisAlignment: pw.MainAxisAlignment.start,
                    //   crossAxisAlignment: pw.CrossAxisAlignment.end,
                    //   children: [
                    //     pw.Text("Rs ${order.amount}"),
                    //   ],
                    // ),
                  ]),
              pw.SizedBox(
                height: 10,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Order Time ${order.time}',
                  ),
                  pw.Text('Total Items ${order.items}')
                ],
              ),
              pw.SizedBox(
                height: 30,
              ),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      flex: 4,
                      child: pw.Text(
                        'Product Name',
                        style: pw.TextStyle(
                            fontSize: 15, fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                        children: [
                          pw.Text(
                            "Weight",
                            style: pw.TextStyle(
                                fontSize: 15, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.Text(
                            'Quantity',
                            style: pw.TextStyle(
                                fontSize: 15, fontWeight: pw.FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                            child: pw.Text(
                          'Price',
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold),
                        ))),
                  ]),
              pw.SizedBox(
                height: 10,
              ),
              pw.ListView.separated(
                separatorBuilder: (context, index) =>
                    pw.Divider(thickness: 0.1),
                itemCount: order.productList!.length,
                itemBuilder: (context, int index) {
                  var product = order.productList![index];
                  return pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Expanded(
                          flex: 4,
                          child: pw.Text(
                            product.name!,
                            style: const pw.TextStyle(fontSize: 15),
                          ),
                        ),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                            children: [
                              pw.Text(
                                "${product.weight!} ${product.unit}",
                                style: const pw.TextStyle(fontSize: 15),
                              ),
                              pw.Text(
                                'x${product.quantity}',
                                style: const pw.TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Container(
                                child: pw.Text(
                              product.price!.toString(),
                              textAlign: pw.TextAlign.right,
                              style: const pw.TextStyle(fontSize: 15),
                            ))),
                      ]);
                },
              ),
              pw.Divider(thickness: 0.5),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  pw.Text(
                    "Sub Total: ",
                    style: const pw.TextStyle(
                        fontSize: ThemeConfig.SUB_TITLE_SIZE,
                        letterSpacing: 1.00),
                  ),
                  pw.Text(
                    "Rs${order.subTotal}",
                    style: const pw.TextStyle(
                        fontSize: ThemeConfig.SUB_TITLE_SIZE,
                        letterSpacing: 1.00),
                  ),
                ],
              ),
              pw.SizedBox(
                height: 5,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  pw.Text(
                    "Delivery Charges:",
                    style: const pw.TextStyle(
                        fontSize: ThemeConfig.SUB_TITLE_SIZE,
                        letterSpacing: 1.00),
                  ),
                  pw.Text(
                    order.deliveryCharges == 0
                        ? 'Free'
                        : "Rs ${order.deliveryCharges}",
                    style: const pw.TextStyle(
                        fontSize: ThemeConfig.SUB_TITLE_SIZE,
                        letterSpacing: 1.00),
                  ),
                ],
              ),
              pw.SizedBox(
                height: 5,
              ),
              pw.Divider(),
              pw.SizedBox(
                height: 10,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  pw.Text(
                    "Order Total:",
                    style: pw.TextStyle(
                        fontSize: 20, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    "Rs ${order.amount}",
                    style: pw.TextStyle(
                        fontSize: 20, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Container(
                decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                  width: 0.1,
                )),
                padding: pw.EdgeInsets.all(10),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        children: [
                          pw.Expanded(
                              child: pw.Text(
                            "Customers Details",
                            style: pw.TextStyle(
                                fontSize: 15, fontWeight: pw.FontWeight.bold),
                          )),
                        ],
                      ),
                      pw.SizedBox(
                        height: 10,
                      ),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          // pw.CircleAvatar(
                          //   radius: 40,
                          //   foregroundImage: NetworkImage(
                          //       '${order.customer!.image}'),
                          // ),
                          // const SizedBox(
                          //   width: 40,
                          // ),
                          pw.Expanded(
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text("Name: ${order.customer!.name}"),
                                  pw.Text(
                                      "Contact number: +91-${order.customer!.phone}"),
                                  pw.Text(
                                      "Address: ${order.customer!.address == null || order.customer!.address == '' ? "Not provided" : order.customer!.address}"),
                                ]),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "Customer comments",
                        style: pw.TextStyle(
                            fontSize: 15, fontWeight: pw.FontWeight.bold),
                      ),

                      pw.SizedBox(
                        height: 10,
                      ),
                      pw.Row(
                        children: [
                          order.comments == ""
                              ? pw.Text("No Comments")
                              : pw.Text("${order.comments}")
                        ],
                      ),

                      // pw.SizedBox(
                      //   height: 50,
                      // ),
                    ]),
              ),
            ],
          ),
        ];
      },
    ));

    // File file = File(pdf.document.save().);
    return await pdf.save();
  }

  Future<Uint8List> buildPdfss(List ids) async {
    await getOrderDetailsByStatus(1);
    List<ol.Data> orders = [];
    ids.forEach((ele) {
      var order = _data.value.data!.firstWhere((element) => element.id == ele);
      orders.add(order);
    });
    final pdf = pw.Document();

    orders.forEach((order) {
      pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Column(
              children: [
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Row(
                            children: [
                              pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Row(
                                    children: [
                                      pw.Text("Order #",
                                          style: pw.TextStyle(
                                              fontSize: 25,
                                              fontWeight: pw.FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                              pw.Text('${order.id}',
                                  style: pw.TextStyle(
                                      fontSize: 25,
                                      fontWeight: pw.FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),

                      pw.Text("Bag no. ${order.bagNo}",
                          style: pw.TextStyle(
                              fontSize: 25, fontWeight: pw.FontWeight.bold)),
                      // pw.Column(
                      //   mainAxisAlignment: pw.MainAxisAlignment.start,
                      //   crossAxisAlignment: pw.CrossAxisAlignment.end,
                      //   children: [
                      //     pw.Text("Rs ${order.amount}"),
                      //   ],
                      // ),
                    ]),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Order Time ${order.time}',
                    ),
                    pw.Text('Total Items ${order.items}')
                  ],
                ),
                pw.SizedBox(
                  height: 30,
                ),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          'Product Name',
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                          children: [
                            pw.Text(
                              "Weight",
                              style: pw.TextStyle(
                                  fontSize: 15, fontWeight: pw.FontWeight.bold),
                            ),
                            pw.Text(
                              'Quantity',
                              style: pw.TextStyle(
                                  fontSize: 15, fontWeight: pw.FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      pw.Expanded(
                          flex: 1,
                          child: pw.Container(
                              child: pw.Text(
                            'Price',
                            textAlign: pw.TextAlign.right,
                            style: pw.TextStyle(
                                fontSize: 15, fontWeight: pw.FontWeight.bold),
                          ))),
                    ]),
                pw.SizedBox(
                  height: 10,
                ),
                // var product = order.productList![index];
                // pw.ListView.separated(
                //   separatorBuilder: (context, index) =>
                //       pw.Divider(thickness: 0.1),
                //   itemCount: order.productList!.length,
                //   itemBuilder: (context, int index) {
                //     return ;
                //   },
                // ),

                pw.Column(
                  children: order.productList!
                      .map((product) => pw.Column(children: [
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Expanded(
                                    flex: 4,
                                    child: pw.Text(
                                      product.name!,
                                      style: const pw.TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  pw.Expanded(
                                    flex: 2,
                                    child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceAround,
                                      children: [
                                        pw.Text(
                                          "${product.weight!} ${product.unit}",
                                          style:
                                              const pw.TextStyle(fontSize: 15),
                                        ),
                                        pw.Text(
                                          'x${product.quantity}',
                                          style:
                                              const pw.TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  pw.Expanded(
                                      flex: 1,
                                      child: pw.Container(
                                          child: pw.Text(
                                        product.price!.toString(),
                                        textAlign: pw.TextAlign.right,
                                        style: const pw.TextStyle(fontSize: 15),
                                      ))),
                                ]),
                            pw.SizedBox(
                              height: 3,
                            ),
                            pw.Divider(thickness: .1)
                          ]))
                      .toList(),
                ),
                // pw.Divider(thickness: 0.5),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    pw.Text(
                      "Sub Total: ",
                      style: const pw.TextStyle(
                          fontSize: ThemeConfig.SUB_TITLE_SIZE,
                          letterSpacing: 1.00),
                    ),
                    pw.Text(
                      "Rs${order.subTotal}",
                      style: const pw.TextStyle(
                          fontSize: ThemeConfig.SUB_TITLE_SIZE,
                          letterSpacing: 1.00),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 5,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    pw.Text(
                      "Delivery Charges:",
                      style: const pw.TextStyle(
                          fontSize: ThemeConfig.SUB_TITLE_SIZE,
                          letterSpacing: 1.00),
                    ),
                    pw.Text(
                      order.deliveryCharges == 0
                          ? 'Free'
                          : "Rs ${order.deliveryCharges}",
                      style: const pw.TextStyle(
                          fontSize: ThemeConfig.SUB_TITLE_SIZE,
                          letterSpacing: 1.00),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 5,
                ),
                pw.Divider(),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    pw.Text(
                      "Order Total:",
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      "Rs ${order.amount}",
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                    width: 0.1,
                  )),
                  padding: pw.EdgeInsets.all(10),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          children: [
                            pw.Expanded(
                                child: pw.Text(
                              "Customers Details",
                              style: pw.TextStyle(
                                  fontSize: 15, fontWeight: pw.FontWeight.bold),
                            )),
                          ],
                        ),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            // pw.CircleAvatar(
                            //   radius: 40,
                            //   foregroundImage: NetworkImage(
                            //       '${order.customer!.image}'),
                            // ),
                            // const SizedBox(
                            //   width: 40,
                            // ),
                            pw.Expanded(
                              child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text("Name: ${order.customer!.name}"),
                                    pw.Text(
                                        "Contact number: +91-${order.customer!.phone}"),
                                    pw.Text(
                                        "Address: ${order.customer!.address == null || order.customer!.address == '' ? "Not provided" : order.customer!.address}"),
                                  ]),
                            )
                          ],
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          "Customer comments",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold),
                        ),

                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                          children: [
                            order.comments == ""
                                ? pw.Text("No Comments")
                                : pw.Text("${order.comments}")
                          ],
                        ),

                        // pw.SizedBox(
                        //   height: 50,
                        // ),
                      ]),
                ),
              ],
            ),
          ];
        },
      ));
    });

    // File file = File(pdf.document.save().);
    return await pdf.save();
  }

  @override
  void onInit() {
    // getOrderList();
    // getOrderDetailsByStatus();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
