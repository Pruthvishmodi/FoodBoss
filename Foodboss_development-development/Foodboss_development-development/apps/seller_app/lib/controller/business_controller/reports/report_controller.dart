import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:seller_app/infrastructure/reports/report_service.dart';
import 'package:seller_app/models/reports/report_details.dart';
import 'package:seller_app/models/reports/report_list.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:pdf/widgets.dart' as pw;

class ReportController extends GetxController {
  Rx<String> reportListStates = States.INITIAL_STATE.obs;
  Rx<ReportList> listReport = ReportList().obs;
  Rx<String> reportDetailsStates = States.INITIAL_STATE.obs;
  Rx<ReportDetail> reportDetails = ReportDetail().obs;

  var startDate = 'From'.obs;
  var endDate = 'To'.obs;

  get getStartDate => startDate.value;
  get getEndDate => endDate.value;

  setDate(BuildContext c, int i) async {
    final date = await showDatePicker(
        context: c,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020, 1, 1),
        lastDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        builder: (c, Widget? child) {
          return Theme(
              data: ThemeData(
                  // primaryColor: ThemeConfig.PRIMARY_COLOR,
                  ),
              child: child ?? Container());
        });

    if (date != null) {
      if (i == 0) {
        startDate.value =
            "${date.year.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString()}";
      } else {
        endDate.value =
            "${date.year.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString()}";
      }
    }
  }

  getReportList() async {
    reportListStates.value = States.LOADING_STATE;
    try {
      ReportList response = await ReportService.getReportList();
      if (response.success == false) {
        reportListStates.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar2(
            'Something went wrong while loading Report List');
      } else {
        if (response.success == false) {
          reportListStates.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
        } else {
          listReport.value = response;
          print('${response}');
          reportListStates.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      printInfo(info: '$e errorin st');
      CustomSnackbar.errorSnackbar2('Serveer error');
      reportListStates.value = States.ERROR_STATE;
    }
  }

  getReportDetails(String start, String end) async {
    reportDetailsStates.value = States.LOADING_STATE;
    try {
      ReportDetail response = await ReportService.getReportDetails(start, end);
      if (response.success == false) {
        reportDetailsStates.value = States.ERROR_STATE;
        CustomSnackbar.errorSnackbar2(
            'Something went wrong while loading Report List');
      } else {
        if (response.success == false) {
          reportDetailsStates.value = States.ERROR_STATE;
          CustomSnackbar.errorSnackbar();
        } else {
          // print(response.data!.toJson().toString());
          reportDetails.value = response;
          reportDetailsStates.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      printInfo(info: '$e errorin st');
      CustomSnackbar.errorSnackbar2('Server error');
      reportDetailsStates.value = States.ERROR_STATE;
    }
  }

  share(String start, String end) async {
    await getReportDetails(start, end);
    Get.toNamed('/report-pdf-preview');
  }

  Future<Uint8List> buildPdf() async {
    var report = reportDetails.value.data;
    final pdf = pw.Document();
    pdf.addPage(pw.MultiPage(
      maxPages: 1,
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("${report!.orders} Orders",
                      style: pw.TextStyle(
                          fontSize: 25, fontWeight: pw.FontWeight.bold)),
                  pw.Text('Rs ${report.totalAmount}',
                      style: pw.TextStyle(
                          fontSize: 25, fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Text(
                '${report.totalDeliveredItems} items delivered',
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Text(
                '${report.totalReturnedItems} items returned',
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Divider(),
              pw.SizedBox(
                height: 20,
              ),
              pw.Container(
                  padding: const pw.EdgeInsets.all(10),
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                    width: 0.5,
                  )),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text("COD",
                                  style: pw.TextStyle(
                                      fontSize: 25,
                                      fontWeight: pw.FontWeight.bold)),
                              pw.Text("${report.cod!.totalCodOrders} Orders",
                                  style: pw.TextStyle(
                                      fontSize: 25,
                                      fontWeight: pw.FontWeight.bold)),
                            ]),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text("Delivered",
                                  style: const pw.TextStyle(
                                    fontSize: 15,
                                  )),
                              pw.Text("${report.cod!.totalCodDelivered} items",
                                  style: const pw.TextStyle(fontSize: 15)),
                            ]),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text("Returned",
                                  style: const pw.TextStyle(
                                    fontSize: 15,
                                  )),
                              pw.Text("${report.cod!.totalCodReturned} items",
                                  style: const pw.TextStyle(fontSize: 15)),
                            ]),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Divider(thickness: 0.3),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Text(
                            "Rs ${report.cod!.totalCodAmount} revenue in total",
                            style: const pw.TextStyle(
                              fontSize: 15,
                            )),
                      ])),
              pw.SizedBox(
                height: 20,
              ),
              pw.Container(
                  padding: const pw.EdgeInsets.all(10),
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                    width: 0.5,
                  )),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text("POD",
                                  style: pw.TextStyle(
                                      fontSize: 25,
                                      fontWeight: pw.FontWeight.bold)),
                              pw.Text("${report.pod!.totalPodOrders} Orders",
                                  style: pw.TextStyle(
                                      fontSize: 25,
                                      fontWeight: pw.FontWeight.bold)),
                            ]),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text("Delivered",
                                  style: const pw.TextStyle(
                                    fontSize: 15,
                                  )),
                              pw.Text("${report.pod!.totalPodDelivered} items",
                                  style: const pw.TextStyle(fontSize: 15)),
                            ]),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text("Returned",
                                  style: const pw.TextStyle(
                                    fontSize: 15,
                                  )),
                              pw.Text("${report.pod!.totalPodReturned} items",
                                  style: const pw.TextStyle(fontSize: 15)),
                            ]),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Divider(thickness: 0.3),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Text(
                            "Rs ${report.pod!.totalPodAmount} revenue in total",
                            style: const pw.TextStyle(
                              fontSize: 15,
                            )),
                      ])),
              pw.SizedBox(
                height: 20,
              ),
              pw.Container(
                  padding: const pw.EdgeInsets.all(10),
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                    width: 0.5,
                  )),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text("Khata",
                                  style: pw.TextStyle(
                                      fontSize: 25,
                                      fontWeight: pw.FontWeight.bold)),
                              pw.Text("${report.khata!.totalKhataOrders} Orders",
                                  style: pw.TextStyle(
                                      fontSize: 25,
                                      fontWeight: pw.FontWeight.bold)),
                            ]),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text("Delivered",
                                  style: const pw.TextStyle(
                                    fontSize: 15,
                                  )),
                              pw.Text("${report.khata!.totalKhataDelivered} items",
                                  style: const pw.TextStyle(fontSize: 15)),
                            ]),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text("Returned",
                                  style: const pw.TextStyle(
                                    fontSize: 15,
                                  )),
                              pw.Text("${report.khata!.totalKhataReturned} items",
                                  style: const pw.TextStyle(fontSize: 15)),
                            ]),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Divider(thickness: 0.3),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Text(
                            "Rs ${report.khata!.totalKhataAmount} revenue in total",
                            style: const pw.TextStyle(
                              fontSize: 15,
                            )),
                      ])),
            ],
          ),
        ];
      },
    ));

    // File file = File(pdf.document.save().);
    return await pdf.save();
  }

  @override
  void onInit() {
    getReportList();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
