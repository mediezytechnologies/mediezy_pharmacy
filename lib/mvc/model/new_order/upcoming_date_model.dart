class UpcomingDateModel {
  bool? status;
  List<Date>? date;
  String? message;

  UpcomingDateModel({this.status, this.date, this.message});

  UpcomingDateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Date'] != null) {
      date = <Date>[];
      json['Date'].forEach((v) {
        date!.add(new Date.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.date != null) {
      data['Date'] = this.date!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Date {
  String? date;
  String? formatDate;
  int? completedOrders;
  int? completedPrescriptions;

  Date(
      {this.date,
      this.formatDate,
      this.completedOrders,
      this.completedPrescriptions});

  Date.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    formatDate = json['format_date'];
    completedOrders = json['completed_orders'];
    completedPrescriptions = json['completed_prescriptions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['format_date'] = this.formatDate;
    data['completed_orders'] = this.completedOrders;
    data['completed_prescriptions'] = this.completedPrescriptions;
    return data;
  }
}
