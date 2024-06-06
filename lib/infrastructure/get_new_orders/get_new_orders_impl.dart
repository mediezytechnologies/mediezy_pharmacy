// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_medical/domain/core/error/error_model/error_model.dart';
import 'package:mediezy_medical/domain/get_new_orders/get_new_orders_model/get_new_orders_model.dart';
import 'package:mediezy_medical/domain/get_new_orders/get_new_orders_model/medicine_order.dart';
import 'package:mediezy_medical/domain/get_new_orders/get_new_orders_service.dart';
import 'package:mediezy_medical/infrastructure/core/api_end_point.dart';
import 'package:mediezy_medical/infrastructure/core/token/token.dart';

@LazySingleton(as: GetNewOrdersService)
class GetNewOrdersImpl implements GetNewOrdersService {
  @override
  Future<Either<ErrorModel, List<MedicineOrder>>> getNewOrdersService() async {
    String? medicalId = GetLocalStorage.getUserIdAndToken('id');
    log("medical id :$medicalId");
    var dataMap = {
      "medical_shop_id": medicalId,
    };
    try {
      final response = await Dio(BaseOptions(
        contentType: 'Content-Type: application/json',
      )).post(
        ApiEndPoints.getNewOrders,
        data: {"medical_shop_id": medicalId},
      );
      log("dataMap  ");
      // log(response.data);
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = GetNewOrdersModel.fromJson(response.data);
        print(">>>>>>>>>>>>>>>$result");
        // print("token :$token");
        print("medicalShopIdd");
        return response.data;
        //Right(result.medicineOrder!);
      } else {
        return Left(ErrorModel());
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log("dio error catched");
      log(e.message!);
      log("error haaaa :${e.error.toString()}");
      final err = ErrorModel.fromJson(e.response!.data);
      log("err: $err");
      return Left(ErrorModel());
    }
  }
}
