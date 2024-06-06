// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      medicalShop: json['medical_shop'] == null
          ? null
          : MedicalShop.fromJson(json['medical_shop'] as Map<String, dynamic>),
      token: json['token'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'medical_shop': instance.medicalShop,
      'token': instance.token,
      'role': instance.role,
    };
