class LoginModel {
  bool? status;
  MedicalShop? medicalShop;
  String? token;
  String? role;
  String? message;

  LoginModel(
      {this.status, this.medicalShop, this.token, this.role, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    medicalShop = json['medical_shop'] != null
        ? new MedicalShop.fromJson(json['medical_shop'])
        : null;
    token = json['token'];
    role = json['role'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.medicalShop != null) {
      data['medical_shop'] = this.medicalShop!.toJson();
    }
    data['token'] = this.token;
    data['role'] = this.role;
    data['message'] = this.message;
    return data;
  }
}

class MedicalShop {
  int? id;
  String? firstname;
  String? mobileNo;
  String? email;
  String? userRole;
  String? image;

  MedicalShop(
      {this.id, this.firstname, this.mobileNo, this.email, this.userRole, this.image});

  MedicalShop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    userRole = json['user_role'];
        image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['user_role'] = this.userRole;
    data['image'] = this.image;
    return data;
  }
}
