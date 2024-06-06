part of 'new_bloc_bloc.dart';

@freezed
class NewBlocState with _$NewBlocState {
  const factory NewBlocState({
    required bool isLoading,
    required bool isError,
    required String message,
    required bool status,
    required List<MedicineOrder> newOrdersModel,
  }) = _Initial;

  factory NewBlocState.initial() => const NewBlocState(
      isLoading: false,
      isError: false,
      message: '',
      status: false,
      newOrdersModel: []);
}
