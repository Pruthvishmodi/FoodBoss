import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:seller_app/controller/order_controller/order_controller.dart';

class NewOrdersPdfPreview extends StatelessWidget {
  NewOrdersPdfPreview({
    Key? key,
  }) : super(key: key);
  var args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print(args);
    OrderController orderController = Get.find<OrderController>();
    // List<int> list = args.toString().split().length;
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => args.length > 1
            ? orderController.buildPdfss(args)
            : orderController.buildPdf(args[0]),
      ),
    );
  }
}
