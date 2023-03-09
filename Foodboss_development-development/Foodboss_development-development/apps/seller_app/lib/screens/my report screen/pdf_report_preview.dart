import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:seller_app/controller/business_controller/reports/report_controller.dart';

class PdfReportPreview extends StatelessWidget {
  const PdfReportPreview({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportController reportController =  Get.find<ReportController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => reportController.buildPdf(),
      ),
    );
  }
}