part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started({
    required String email,
    required String password,
  }) = _Started;
}
