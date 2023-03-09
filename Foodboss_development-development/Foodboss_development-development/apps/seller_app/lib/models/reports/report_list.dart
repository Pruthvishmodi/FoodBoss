class ReportList {
  bool? success;
  List<ReportData>? reportList;

  ReportList({this.success = false, this.reportList});

  ReportList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    reportList = <ReportData>[];
    if (json['data'] != null) {
      var data = <ReportData>[];
      json['data'].forEach((v) {
        data.add(ReportData.fromJson(v));
      });
      reportList = data;  
    }
  }
}

class ReportData {
  int? orders;
  String? month;
  String? year;
  String? startDate;
  String? endDate;
  int? amount;

  ReportData(
      {this.orders = 0,
      this.month = '',
      this.year = '',
      this.startDate = '',
      this.endDate = '',
      this.amount = 0});

  ReportData.fromJson(Map<String, dynamic> json) {
    orders = json['orders'] ?? 0;
    month = json['month'] ?? '';
    year = json['year'] ?? '';
    startDate = json['start_date'] ?? '';
    endDate = json['end_date'] ?? '';
    amount = json['amount'] ?? 0;
  }
}
