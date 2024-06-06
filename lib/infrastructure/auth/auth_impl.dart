// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_medical/domain/auth/auth_service.dart';
import 'package:mediezy_medical/domain/auth/login/auth_model.dart';
import 'package:mediezy_medical/domain/core/error/error_model/error_model.dart';
import 'package:mediezy_medical/infrastructure/core/api_end_point.dart';
import 'package:mediezy_medical/infrastructure/core/token/token.dart';

@LazySingleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  @override
  Future<Either<ErrorModel, AuthModel>> authService(
      {required String email, required String password}) async {
    try {
      final response = await Dio(BaseOptions(
        contentType: 'application/x-www-form-urlencoded',
      )).post(
        ApiEndPoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      // log(response.data);
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = AuthModel.fromJson(response.data);
        Map<String, dynamic> user = {
          "token": response.data['token'],
          'id': response.data['medical_shop']['id'].toString(),
        };
        GetLocalStorage.saveToken(user);
        String? token = GetLocalStorage.getUserIdAndToken('token');
        String? id = GetLocalStorage.getUserIdAndToken('id');
        print(result);
        log("tok ==== :  $token");
        log("iid ==== :  $id");
        return Right(result);
      } else {
        return Left(ErrorModel());
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log("dio error catched");
      log(e.message!);
      log(e.error.toString());
      log(e.error.toString());
      final err = ErrorModel.fromJson(e.response!.data);
      log("err: $err");
      return Left(ErrorModel());
    }
  }
}
