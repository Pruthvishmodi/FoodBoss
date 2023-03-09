import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:seller_app/controller/business_controller/reports/report_controller.dart';
import 'package:seller_app/controller/khata_controller.dart';

class KhataReportPdf extends StatelessWidget {
  const KhataReportPdf({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KhataController khataController =  Get.find<KhataController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => khataController.buildPdf(),
      ),
    );
  }
}