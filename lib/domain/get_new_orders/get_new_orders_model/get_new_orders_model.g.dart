// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_new_orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNewOrdersModel _$GetNewOrdersModelFromJson(Map<String, dynamic> json) =>
    GetNewOrdersModel(
      status: json['status'] as bool?,
      medicineOrder: (json['Medicine Order'] as List<dynamic>?)
          ?.map((e) => MedicineOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetNewOrdersModelToJson(GetNewOrdersModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'Medicine Order': instance.medicineOrder,
      'message': instance.message,
    };
