import 'dart:ffi';

class NewOrderModel {
  NewOrderModel({
    this.status,
    this.medicineOrder,
    this.message,
  });

  NewOrderModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['Medicine Order'] != null) {
      medicineOrder = [];
      json['Medicine Order'].forEach((v) {
        medicineOrder?.add(MedicineOrder.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? status;
  List<MedicineOrder>? medicineOrder;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (medicineOrder != null) {
      map['Medicine Order'] = medicineOrder?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }
}

class MedicineOrder {
  MedicineOrder({
    this.appointmentId,
    this.patientName,
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
    this.date,
    this.tokenNumber,
    this.notes,
    this.tokenTime,
    this.medicalshopUserId,
    this.prescriptionImages,
    this.medicines,
  });

  MedicineOrder.fromJson(dynamic json) {
    appointmentId = json['appointment_id'];
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
    date = json['date'];
    tokenNumber = json['TokenNumber'];
    notes = json['notes'];
    tokenTime = json['TokenTime'];
    medicalshopUserId = json['medicalshop_userId'];
    if (json['prescription_images'] != null) {
      prescriptionImages = [];
      json['prescription_images'].forEach((v) {
        prescriptionImages?.add(PrescriptionImages.fromJson(v));
      });
    }
    if (json['medicines'] != null) {
      medicines = [];
      json['medicines'].forEach((v) {
        medicines?.add(Medicines.fromJson(v));
      });
    }
  }
  int? appointmentId;
  String? patientName;
  String? mediezyPatientId;
  int? patientId;
  int? userId;
  int? doctorId;
  int? tokenId;
  String? doctorName;
  dynamic userImage;
  String? gender;
  int? age;
  String? mobileNo;
  dynamic appoinmentforId;
  String? date;
  int? tokenNumber;
  String? notes;
  String? tokenTime;
  int? medicalshopUserId;
  List<PrescriptionImages>? prescriptionImages;
  List<Medicines>? medicines;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appointment_id'] = appointmentId;
    map['PatientName'] = patientName;
    map['mediezy_patient_id'] = mediezyPatientId;
    map['patient_id'] = patientId;
    map['User_id'] = userId;
    map['doctor_id'] = doctorId;
    map['token_id'] = tokenId;
    map['doctor_name'] = doctorName;
    map['user_image'] = userImage;
    map['gender'] = gender;
    map['age'] = age;
    map['MobileNo'] = mobileNo;
    map['Appoinmentfor_id'] = appoinmentforId;
    map['date'] = date;
    map['TokenNumber'] = tokenNumber;
    map['TokenNumber'] = notes;
    map['TokenTime'] = tokenTime;
    map['medicalshop_userId'] = medicalshopUserId;
    if (prescriptionImages != null) {
      map['prescription_images'] =
          prescriptionImages?.map((v) => v.toJson()).toList();
    }
    if (medicines != null) {
      map['medicines'] = medicines?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Medicines {
  Medicines({
    this.id,
    this.medicineName,
    this.mediezyDoctorId,
    this.userId,
    this.doctorId,
    this.patientId,
    this.medicalShopId,
    this.dosage,
    this.interval,
    this.timeSection,
    this.noOfDays,
    this.noon,
    this.night,
    this.tokenId,
    this.morning,
    this.type,
    this.notes,
    this.illness,
    this.evening,
    this.tokenNumber,
    this.medicineType,
    this.status,
  });

  Medicines.fromJson(dynamic json) {
    id = json['id'];
    medicineName = json['medicineName'];
    mediezyDoctorId = json['mediezy_doctor_id'];
    userId = json['user_id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    medicalShopId = json['medical_shop_id'];
    dosage = json['Dosage'];
    interval = json['interval'];
    timeSection = json['time_section'];
    noOfDays = json['NoOfDays'];
    noon = json['Noon'];
    night = json['night'];
    tokenId = json['token_id'];
    morning = json['morning'];
    type = json['type'];
    notes = json['notes'];
    illness = json['illness'];
    evening = json['evening'];
    tokenNumber = json['token_number'];
    medicineType = json['medicine_type'];
    status = json['status'];
  }
  int? id;
  String? medicineName;
  dynamic mediezyDoctorId;
  int? userId;
  int? doctorId;
  int? patientId;
  int? medicalShopId;
  String? dosage;
  dynamic interval;
  String? timeSection;
  String? noOfDays;
  int? noon;
  int? night;
  int? tokenId;
  int? morning;
  int? type;
  dynamic notes;
  dynamic illness;
  int? evening;
  int? tokenNumber;
  int? medicineType;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['medicineName'] = medicineName;
    map['mediezy_doctor_id'] = mediezyDoctorId;
    map['user_id'] = userId;
    map['doctor_id'] = doctorId;
    map['patient_id'] = patientId;
    map['medical_shop_id'] = medicalShopId;
    map['Dosage'] = dosage;
    map['interval'] = interval;
    map['time_section'] = timeSection;
    map['NoOfDays'] = noOfDays;
    map['Noon'] = noon;
    map['night'] = night;
    map['token_id'] = tokenId;
    map['morning'] = morning;
    map['type'] = type;
    map['notes'] = notes;
    map['illness'] = illness;
    map['evening'] = evening;
    map['token_number'] = tokenNumber;
    map['medicine_type'] = medicineType;
    map['status'] = status;
    return map;
  }
}

class PrescriptionImages {
  PrescriptionImages({
    this.id,
    this.prescriptionImage,
    this.status,
  });

  PrescriptionImages.fromJson(dynamic json) {
    id = json['id'];
    prescriptionImage = json['prescription_image'];
    status = json['status'];
  }
  int? id;
  String? prescriptionImage;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['prescription_image'] = prescriptionImage;
    map['status'] = status;
    return map;
  }
}
