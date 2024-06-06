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
    this.tokenTime,
    this.medicalshopUserId,
    this.medicines,
  });

  MedicineOrder.fromJson(dynamic json) {
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
    tokenTime = json['TokenTime'];
    medicalshopUserId = json['medicalshop_userId'];
    if (json['medicines'] != null) {
      medicines = [];
      json['medicines'].forEach((v) {
        medicines?.add(Medicines.fromJson(v));
      });
    }
  }
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
  String? appoinmentforId;
  String? date;
  String? tokenNumber;
  String? tokenTime;
  int? medicalshopUserId;
  List<Medicines>? medicines;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    map['TokenTime'] = tokenTime;
    map['medicalshop_userId'] = medicalshopUserId;
    if (medicines != null) {
      map['medicines'] = medicines?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Medicines {
  Medicines({
    this.id,
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
    this.medicineType,
  });

  Medicines.fromJson(dynamic json) {
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
  int? id;
  dynamic mediezyDoctorId;
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
  dynamic notes;
  dynamic illness;
  int? evening;
  int? tokenNumber;
  int? medicineType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['mediezy_doctor_id'] = mediezyDoctorId;
    map['user_id'] = userId;
    map['docter_id'] = docterId;
    map['patient_id'] = patientId;
    map['medical_shop_id'] = medicalShopId;
    map['medicine_id'] = medicineId;
    map['medicineName'] = medicineName;
    map['Dosage'] = dosage;
    map['interval'] = interval;
    map['time_section'] = timeSection;
    map['NoOfDays'] = noOfDays;
    map['Noon'] = noon;
    map['night'] = night;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['token_id'] = tokenId;
    map['morning'] = morning;
    map['type'] = type;
    map['notes'] = notes;
    map['illness'] = illness;
    map['evening'] = evening;
    map['token_number'] = tokenNumber;
    map['medicine_type'] = medicineType;
    return map;
  }
}
