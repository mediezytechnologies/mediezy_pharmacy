import 'package:dartz/dartz.dart';
import 'package:mediezy_medical/domain/auth/login/auth_model.dart';
import 'package:mediezy_medical/domain/core/error/error_model/error_model.dart';

abstract class AuthService {
  Future<Either<ErrorModel, AuthModel>> authService({
    required String email,
    required String password,
  });
}
