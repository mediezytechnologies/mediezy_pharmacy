part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool isLoading,
    required bool isError,
    required String message,
    required bool status,
    AuthModel? model,
  }) = _Initial;

  factory AuthState.initial() => const AuthState(
      isError: false, isLoading: false, message: '', status: false);
}
