class KhataUserDetailModel {
  bool? success;
  Data? data;

  KhataUserDetailModel({this.success, this.data});

  KhataUserDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? customerId;
  String? customerName;
  String? customerNumber;
  String? address;
  String? totalKhataAmount;
  String? totalPendingAmount;
  String? lastPaidAmount;
  String? lastPaidDate;
  List<PreviousPayments>? previousPayments;

  Data(
      {this.customerId,
      this.customerName,
      this.customerNumber,
      this.address,
      this.totalKhataAmount,
      this.totalPendingAmount,
      this.lastPaidAmount,
      this.lastPaidDate,
      this.previousPayments});

  Data.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerNumber = json['customer_number'];
    address = json['address'];
    totalKhataAmount = json['total_khata_amount'];
    totalPendingAmount = json['total_pending_amount'];
    lastPaidAmount = json['last_paid_amount'];
    lastPaidDate = json['last_paid_date'];
    if (json['previous_payments'] != null) {
      previousPayments = <PreviousPayments>[];
      json['previous_payments'].forEach((v) {
        previousPayments!.add(new PreviousPayments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['customer_number'] = this.customerNumber;
    data['address'] = this.address;
    data['total_khata_amount'] = this.totalKhataAmount;
    data['total_pending_amount'] = this.totalPendingAmount;
    data['last_paid_amount'] = this.lastPaidAmount;
    data['last_paid_date'] = this.lastPaidDate;
    if (this.previousPayments != null) {
      data['previous_payments'] =
          this.previousPayments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreviousPayments {
  String? amount;
  String? date;

  PreviousPayments({this.amount, this.date});

  PreviousPayments.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['date'] = this.date;
    return data;
  }
}
