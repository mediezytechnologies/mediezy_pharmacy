class NewOrderSubmitModel {
  bool? status;
  List<String>? image;
  String? message;

  NewOrderSubmitModel({this.status, this.image, this.message});

  NewOrderSubmitModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    image = json['image'].cast<String>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['image'] = this.image;
    data['message'] = this.message;
    return data;
  }
}
