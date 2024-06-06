// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicine _$MedicineFromJson(Map<String, dynamic> json) => Medicine(
      id: (json['id'] as num?)?.toInt(),
      mediezyDoctorId: json['mediezy_doctor_id'],
      userId: (json['user_id'] as num?)?.toInt(),
      docterId: (json['docter_id'] as num?)?.toInt(),
      patientId: (json['patient_id'] as num?)?.toInt(),
      medicalShopId: (json['medical_shop_id'] as num?)?.toInt(),
      medicineId: (json['medicine_id'] as num?)?.toInt(),
      medicineName: json['medicineName'] as String?,
      dosage: json['Dosage'] as String?,
      interval: json['interval'] as String?,
      timeSection: json['time_section'] as String?,
      noOfDays: json['NoOfDays'] as String?,
      noon: (json['Noon'] as num?)?.toInt(),
      night: (json['night'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      tokenId: (json['token_id'] as num?)?.toInt(),
      morning: (json['morning'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
      notes: json['notes'],
      illness: json['illness'],
      evening: (json['evening'] as num?)?.toInt(),
      tokenNumber: (json['token_number'] as num?)?.toInt(),
      medicineType: (json['medicine_type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
      'id': instance.id,
      'mediezy_doctor_id': instance.mediezyDoctorId,
      'user_id': instance.userId,
      'docter_id': instance.docterId,
      'patient_id': instance.patientId,
      'medical_shop_id': instance.medicalShopId,
      'medicine_id': instance.medicineId,
      'medicineName': instance.medicineName,
      'Dosage': instance.dosage,
      'interval': instance.interval,
      'time_section': instance.timeSection,
      'NoOfDays': instance.noOfDays,
      'Noon': instance.noon,
      'night': instance.night,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'token_id': instance.tokenId,
      'morning': instance.morning,
      'type': instance.type,
      'notes': instance.notes,
      'illness': instance.illness,
      'evening': instance.evening,
      'token_number': instance.tokenNumber,
      'medicine_type': instance.medicineType,
    };
