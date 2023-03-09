import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:seller_app/infrastructure/khata_request_call.dart';
import 'package:seller_app/infrastructure/set_khata_call.dart';
import 'package:seller_app/models/get_my_users_khata_list_model.dart';
import 'package:seller_app/models/khata/khata_user_detail_model.dart';
import 'package:seller_app/models/khata/set_khata_limit_model.dart';
import 'package:seller_app/models/khata_request_model.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
// import 'package:xml/xml.dart' as xml;

class KhataController extends GetxController {
  var _data = KhataRequestModel().obs;
  var _state = States.INITIAL_STATE.obs;

  String get status => _state.value;

  KhataRequestModel get data => _data.value;

  Future<void> getKhataRequestList() async {
    print('called');
    _state.value = States.LOADING_STATE;
    try {
      KhataRequestModel response = await KhataRequestCall.getKhatalist();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        // Get.snackbar('Error', 'Something went wrong Plan history');
      } else {
        _data.value = response;
        _state.value = States.SUCCESS_STATE;
        print(response);
      }
    } catch (e) {
      print(e);
      // Get.snackbar("Opps", "D");
      _state.value = States.ERROR_STATE;
    }
  }

  var _requestStatus = States.INITIAL_STATE.obs;

  bool isSent = false;

  // var _shopId = ''.obs;
  var kataLimit = ''.obs;
  // var _type = ''.obs;

  // String get shopId => _shopId.value;

  // String get type => _type.value;

  Future<void> sendSetLimitRequest(
      String customerId, String khataAccept) async {
    SetKhataLimitModel request = SetKhataLimitModel(
        customerId: customerId,
        khataAccept: khataAccept,
        khataLimit: kataLimit.value);
    print(request.toJson().toString());
    _requestStatus.value = States.LOADING_STATE;
    try {
      isSent = await SetKhataCall.sendLimitAmount(request);
      if (isSent == false) {
        Get.snackbar('Error', 'Something went wrong');
      } else {
        Get.back();
        _requestStatus.value = States.SUCCESS_STATE;
        CustomSnackbar.SucessSnackbar('Khata User Added');
        getKhataRequestList();
        // Get.snackbar('Success', 'Accept Request Added');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Opps', 'Something went wrongrrr');
      _requestStatus.value = States.ERROR_STATE;
    }
  }

  // my user khata list
  var mykhataStatus = States.INITIAL_STATE.obs;

  var myKhatas = GetMyUserKhata().obs;

  double totalPendingAmount() {
    double total = 0;
    myKhatas.value.khatas!.forEach((element) {
      total = total + double.parse(element.totalUsedAmount!);
    });
    return total;
  }

  Future<void> getMyUsersKhata() async {
    print('called');
    mykhataStatus.value = States.LOADING_STATE;
    try {
      var response = await KhataRequestCall.getMyKhatalist();
      print(response);
      if (response == null) {
        mykhataStatus.value = States.ERROR_STATE;
        // Get.snackbar('Error', 'Something went wrong Plan history');
      } else {
        myKhatas.value = response;
        mykhataStatus.value = States.SUCCESS_STATE;
        print(response);
      }
    } catch (e) {
      print(e);
      // Get.snackbar("Opps", "D");
      mykhataStatus.value = States.ERROR_STATE;
    }
  }

  onChangeNewAmount(val, id) {
    myKhatas.value.khatas!.firstWhere((element) => element.id == id).newAmount =
        val;
    // myKhatas.refresh();
  }

  // quick edit khata

  Map<String, dynamic> quickEditJson(customerId, amount) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = customerId;
    data['amount'] = amount;
    return data;
  }

  Future<void> quickEditKhata(String customerId, String amount) async {
    var request = quickEditJson(customerId, amount);
    // print(request.toJson().toString());
    try {
      isSent = await SetKhataCall.quickEditKhata(request);
      if (isSent == false) {
        Get.snackbar('Error', 'Something went wrong');
      } else {
        // _requestStatus.value = States.SUCCESS_STATE;
        myKhatas.value.khatas!
            .firstWhere((element) => element.id.toString() == customerId)
            .newAmount = null;
        print(myKhatas.value.khatas!
            .firstWhere((element) => element.id.toString() == customerId)
            .newAmount);
        myKhatas.refresh();
        getMyUsersKhata();
        // Get.snackbar('Success', 'Accept Request Added');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Opps', 'Something went wrongrrr');
      // _requestStatus.value = States.ERROR_STATE;
    }
  }

  var userKhataDetails = KhataUserDetailModel().obs;
  var userKhataDetailsStatus = States.INITIAL_STATE.obs;
  Future<void> getKhataDetail(int userId) async {
    print('called');
    userKhataDetailsStatus.value = States.LOADING_STATE;
    try {
      var response = await KhataRequestCall.getKhataUserDetails(userId);
      print(response);
      if (response == null) {
        userKhataDetailsStatus.value = States.ERROR_STATE;
        // Get.snackbar('Error', 'Something went wrong Plan history');
      } else {
        userKhataDetails.value = response;
        userKhataDetailsStatus.value = States.SUCCESS_STATE;
        print(response);
      }
    } catch (e) {
      print(e);
      userKhataDetailsStatus.value = States.ERROR_STATE;
    }
  }

  Future<Uint8List> buildPdf() async {
    var user = userKhataDetails.value.data;
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
              pw.Center(
                child: pw.Column(
                  children: [
                    pw.Row(children: [
                      pw.Text(user!.customerName!,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold)),
                    ]),
                    pw.SizedBox(height: 10),
                    pw.Row(children: [
                      pw.Text("+91 ${user.customerNumber!}",
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.normal)),
                    ]),
                    pw.SizedBox(height: 5),
                    user.address == ''
                        ? pw.SizedBox()
                        : pw.Row(children: [
                            pw.Text(user.address!),
                          ]),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Divider(),
              pw.SizedBox(
                height: 10,
              ),
              // const MainLabelText(titleString: "KHATA PERIOD:-"),
              // const SizedBox(
              //   height: 3,
              // ),
              pw.Text("Khata Details",
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(
                height: 10,
              ),

              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(5.00),
                  //     color: ThemeConfig.FORM_COLOR,
                  //   ),
                  //   padding: const EdgeInsets.all(10),
                  //   child: const MainLabelText(
                  //     titleString: "\u{20B9}",
                  //   ),
                  // ),
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text("Pending",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(width: 5),
                      pw.Text("Rs ${user.totalPendingAmount}"),
                    ],
                  ),
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text("Total",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(width: 5),
                      pw.Text("Rs ${user.totalKhataAmount}"),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Divider(),
              pw.SizedBox(
                height: 10,
              ),

              user.previousPayments == null
                  ? pw.SizedBox()
                  : pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Previous Payments",
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.ListView.separated(
                          separatorBuilder: (context, index) => pw.Divider(
                            thickness: 0.0,
                          ),
                          itemCount: user.previousPayments!.length,
                          itemBuilder: (context, index) => pw.Container(
                            child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text(user.previousPayments![index].date!),
                                pw.Text(
                                    "${user.previousPayments![index].amount}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
    getKhataRequestList();
    getMyUsersKhata();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
