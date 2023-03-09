class ReportDetail {
  bool? success;
  ReportDetailsData? data;

  ReportDetail({this.success = false, this.data});

  ReportDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? ReportDetailsData.fromJson(json['data'])
        : ReportDetailsData();
  }
}

class ReportDetailsData {
  int? orders;
  int? totalReturnedItems;
  int? totalAmount;
  int? totalDeliveredItems;
  Cod? cod = Cod();
  Khata? khata = Khata();
  Pod? pod = Pod();

  ReportDetailsData(
      {this.orders = 0,
      this.totalAmount = 0,
      this.totalReturnedItems = 0,
      this.totalDeliveredItems = 0,
      this.cod,
      this.khata,
      this.pod});

  ReportDetailsData.fromJson(Map<String, dynamic> json) {
    print(json['orders']);
    orders = json['orders'];
    totalAmount = json['total_amount'] ?? 0;
    totalReturnedItems = json['total_returned_items'] ?? 0;
    totalDeliveredItems = json['total_delivered_items'] ?? 0;
    cod = json['cod'] != null ? Cod.fromJson(json['cod']) : Cod();
    khata = json['khata'] != null ? Khata.fromJson(json['khata']) : Khata();
    pod = json['pod'] != null ? Pod.fromJson(json['pod']) : Pod();
  }
}

class Cod {
  int? totalCodOrders;
  int? totalCodReturned;
  int? totalCodDelivered;
  int? totalCodAmount;

  Cod(
      {this.totalCodOrders = 0,
      this.totalCodReturned = 0,
      this.totalCodDelivered = 0,
      this.totalCodAmount = 0});

  Cod.fromJson(Map<String, dynamic> json) {
    totalCodOrders = json['total_cod_orders'] ?? 0;
    totalCodReturned = json['total_cod_returned'] ?? 0;
    totalCodDelivered = json['total_cod_delivered'] ?? 0;
    totalCodAmount = json['total_cod_amount'] ?? 0;
  }
}

class Khata {
  int? totalKhataOrders;
  int? totalKhataReturned;
  int? totalKhataDelivered;
  int? totalKhataAmount;

  Khata(
      {this.totalKhataOrders = 0,
      this.totalKhataReturned = 0,
      this.totalKhataDelivered = 0,
      this.totalKhataAmount = 0});

  Khata.fromJson(Map<String, dynamic> json) {
    totalKhataOrders = json['total_khata_orders'] ?? 0;
    totalKhataReturned = json['total_khata_returned'] ?? 0;
    totalKhataDelivered = json['total_khata_delivered'] ?? 0;
    totalKhataAmount = json['total_khata_amount'] ?? 0;
  }
}

class Pod {
  int? totalPodOrders;
  int? totalPodReturned;
  int? totalPodDelivered;
  int? totalPodAmount;

  Pod(
      {this.totalPodOrders = 0,
      this.totalPodReturned = 0,
      this.totalPodDelivered = 0,
      this.totalPodAmount = 0});

  Pod.fromJson(Map<String, dynamic> json) {
    totalPodOrders = json['total_pod_orders'] ?? 0;
    totalPodReturned = json['total_pod_returned'] ?? 0;
    totalPodDelivered = json['total_pod_delivered'] ?? 0;
    totalPodAmount = json['total_pod_amount'] ?? 0;
  }
}
