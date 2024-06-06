import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_medical/ddd/domain/auth/auth_service.dart';
import 'package:mediezy_medical/ddd/domain/auth/login/auth_model.dart';
import 'package:mediezy_medical/ddd/domain/core/error/error_model/error_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthState.initial()) {
    on<_Started>((event, emit) async {
      emit(state.copyWith(
          isLoading: true, isError: false, message: '', status: false));

      final _result = await authService.authService(
          email: event.email, password: event.password);
      final _state = _result.fold(
        (ErrorModel error) {
          return state.copyWith(
              isLoading: false,
              isError: true,
              message: error.message.toString(),
              status: false);
        },
        (AuthModel model) {
          return state.copyWith(
              isLoading: false,
              isError: false,
              model: model,
              message: "",
              status: true);
        },
      );
      emit(_state);
    });
  }
}
