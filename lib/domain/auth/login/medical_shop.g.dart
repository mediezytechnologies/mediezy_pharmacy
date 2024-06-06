// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalShop _$MedicalShopFromJson(Map<String, dynamic> json) => MedicalShop(
      id: (json['id'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      mobileNo: json['mobileNo'] as String?,
      email: json['email'] as String?,
      userRole: json['user_role'] as String?,
    );

Map<String, dynamic> _$MedicalShopToJson(MedicalShop instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'mobileNo': instance.mobileNo,
      'email': instance.email,
      'user_role': instance.userRole,
    };
