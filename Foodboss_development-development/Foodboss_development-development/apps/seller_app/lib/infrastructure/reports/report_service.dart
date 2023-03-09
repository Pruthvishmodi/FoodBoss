import 'package:seller_app/models/reports/report_details.dart';
import 'package:seller_app/models/reports/report_list.dart';
import 'package:seller_app/utils/requests.dart';
import 'package:seller_app/utils/urls.dart';

class ReportService {
  static Future<ReportList> getReportList() async {
    var response = await Request.getData(Urls.MYREPORTS, true);
    print('aasasa ${response}');
    if (response.statusCode == 200) {
      return ReportList.fromJson(response.data);
    } else {
      return ReportList();
    }
  }

  static Future<ReportDetail> getReportDetails(
      String startDate, String endDate) async {
    var response = await Request.getData(
        Urls.MYREPORTLIST(startDate, endDate),
        // {"start_date": startDate, "end_date": endDate},
        true);
    print(response);
    if (response.statusCode == 200) {
      return ReportDetail.fromJson(response.data);
    } else {
      return ReportDetail();
    }
  }
}
