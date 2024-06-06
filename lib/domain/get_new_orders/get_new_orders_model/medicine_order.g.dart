// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineOrder _$MedicineOrderFromJson(Map<String, dynamic> json) =>
    MedicineOrder(
      patientName: json['PatientName'] as String?,
      mediezyPatientId: json['mediezy_patient_id'] as String?,
      patientId: (json['patient_id'] as num?)?.toInt(),
      userId: (json['User_id'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      age: (json['age'] as num?)?.toInt(),
      mobileNo: json['MobileNo'] as String?,
      appoinmentforId: json['Appoinmentfor_id'] as String?,
      date: json['date'] as String?,
      tokenNumber: json['TokenNumber'] as String?,
      tokenTime: json['TokenTime'] as String?,
      medicalshopUserId: (json['medicalshop_userId'] as num?)?.toInt(),
      medicines: (json['medicines'] as List<dynamic>?)
          ?.map((e) => Medicine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicineOrderToJson(MedicineOrder instance) =>
    <String, dynamic>{
      'PatientName': instance.patientName,
      'mediezy_patient_id': instance.mediezyPatientId,
      'patient_id': instance.patientId,
      'User_id': instance.userId,
      'gender': instance.gender,
      'age': instance.age,
      'MobileNo': instance.mobileNo,
      'Appoinmentfor_id': instance.appoinmentforId,
      'date': instance.date,
      'TokenNumber': instance.tokenNumber,
      'TokenTime': instance.tokenTime,
      'medicalshop_userId': instance.medicalshopUserId,
      'medicines': instance.medicines,
    };
