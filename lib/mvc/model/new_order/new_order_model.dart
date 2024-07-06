class NewOrderModel {
  bool? status;
  List<MedicineOrder>? medicineOrder;
  String? message;

  NewOrderModel({this.status, this.medicineOrder, this.message});

  NewOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Medicine Order'] != null) {
      medicineOrder = <MedicineOrder>[];
      json['Medicine Order'].forEach((v) {
        medicineOrder!.add(new MedicineOrder.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.medicineOrder != null) {
      data['Medicine Order'] =
          this.medicineOrder!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class MedicineOrder {
  String? patientName;
  String? mediezyPatientId;
  int? patientId;
  int? userId;
  int? doctorId;
  int? tokenId;
  String? doctorName;
  String? userImage;
  String? gender;
  int? age;
  String? mobileNo;
  String? appoinmentforId;
  List<String>? prescriptionImage;
  String? date;
  String? tokenNumber;
  String? tokenTime;
  int? medicalshopUserId;
  List<Medicines>? medicines;

  MedicineOrder(
      {this.patientName,
      this.mediezyPatientId,
      this.patientId,
      this.userId,
      this.doctorId,
      this.tokenId,
      this.doctorName,
      this.userImage,
      this.gender,
      this.age,
      this.mobileNo,
      this.appoinmentforId,
      this.prescriptionImage,
      this.date,
      this.tokenNumber,
      this.tokenTime,
      this.medicalshopUserId,
      this.medicines});

  MedicineOrder.fromJson(Map<String, dynamic> json) {
    patientName = json['PatientName'];
    mediezyPatientId = json['mediezy_patient_id'];
    patientId = json['patient_id'];
    userId = json['User_id'];
    doctorId = json['doctor_id'];
    tokenId = json['token_id'];
    doctorName = json['doctor_name'];
    userImage = json['user_image'];
    gender = json['gender'];
    age = json['age'];
    mobileNo = json['MobileNo'];
    appoinmentforId = json['Appoinmentfor_id'];
    prescriptionImage = json['prescription_image'].cast<String>();
    date = json['date'];
    tokenNumber = json['TokenNumber'];
    tokenTime = json['TokenTime'];
    medicalshopUserId = json['medicalshop_userId'];
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(new Medicines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PatientName'] = this.patientName;
    data['mediezy_patient_id'] = this.mediezyPatientId;
    data['patient_id'] = this.patientId;
    data['User_id'] = this.userId;
    data['doctor_id'] = this.doctorId;
    data['token_id'] = this.tokenId;
    data['doctor_name'] = this.doctorName;
    data['user_image'] = this.userImage;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['MobileNo'] = this.mobileNo;
    data['Appoinmentfor_id'] = this.appoinmentforId;
    data['prescription_image'] = this.prescriptionImage;
    data['date'] = this.date;
    data['TokenNumber'] = this.tokenNumber;
    data['TokenTime'] = this.tokenTime;
    data['medicalshop_userId'] = this.medicalshopUserId;
    if (this.medicines != null) {
      data['medicines'] = this.medicines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicines {
  int? id;
  String? mediezyDoctorId;
  int? userId;
  int? docterId;
  int? patientId;
  int? medicalShopId;
  int? medicineId;
  String? medicineName;
  String? dosage;
  String? interval;
  String? timeSection;
  String? noOfDays;
  int? noon;
  int? night;
  String? createdAt;
  String? updatedAt;
  int? tokenId;
  int? morning;
  int? type;
  Null notes;
  Null illness;
  int? evening;
  int? tokenNumber;
  int? medicineType;

  Medicines(
      {this.id,
      this.mediezyDoctorId,
      this.userId,
      this.docterId,
      this.patientId,
      this.medicalShopId,
      this.medicineId,
      this.medicineName,
      this.dosage,
      this.interval,
      this.timeSection,
      this.noOfDays,
      this.noon,
      this.night,
      this.createdAt,
      this.updatedAt,
      this.tokenId,
      this.morning,
      this.type,
      this.notes,
      this.illness,
      this.evening,
      this.tokenNumber,
      this.medicineType});

  Medicines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediezyDoctorId = json['mediezy_doctor_id'];
    userId = json['user_id'];
    docterId = json['docter_id'];
    patientId = json['patient_id'];
    medicalShopId = json['medical_shop_id'];
    medicineId = json['medicine_id'];
    medicineName = json['medicineName'];
    dosage = json['Dosage'];
    interval = json['interval'];
    timeSection = json['time_section'];
    noOfDays = json['NoOfDays'];
    noon = json['Noon'];
    night = json['night'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tokenId = json['token_id'];
    morning = json['morning'];
    type = json['type'];
    notes = json['notes'];
    illness = json['illness'];
    evening = json['evening'];
    tokenNumber = json['token_number'];
    medicineType = json['medicine_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mediezy_doctor_id'] = this.mediezyDoctorId;
    data['user_id'] = this.userId;
    data['docter_id'] = this.docterId;
    data['patient_id'] = this.patientId;
    data['medical_shop_id'] = this.medicalShopId;
    data['medicine_id'] = this.medicineId;
    data['medicineName'] = this.medicineName;
    data['Dosage'] = this.dosage;
    data['interval'] = this.interval;
    data['time_section'] = this.timeSection;
    data['NoOfDays'] = this.noOfDays;
    data['Noon'] = this.noon;
    data['night'] = this.night;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token_id'] = this.tokenId;
    data['morning'] = this.morning;
    data['type'] = this.type;
    data['notes'] = this.notes;
    data['illness'] = this.illness;
    data['evening'] = this.evening;
    data['token_number'] = this.tokenNumber;
    data['medicine_type'] = this.medicineType;
    return data;
  }
}
