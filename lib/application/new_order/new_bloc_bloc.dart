// ignore_for_file: unused_result

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_medical/domain/get_new_orders/get_new_orders_model/medicine_order.dart';
import 'package:mediezy_medical/domain/get_new_orders/get_new_orders_service.dart';

part 'new_bloc_event.dart';
part 'new_bloc_state.dart';
part 'new_bloc_bloc.freezed.dart';

@injectable
class NewBlocBloc extends Bloc<NewBlocEvent, NewBlocState> {
  final GetNewOrdersService getNewOrdersService;
  NewBlocBloc(this.getNewOrdersService) : super(NewBlocState.initial()) {
    on<NewBlocEvent>((event, emit) async {
      state.copyWith(
          isLoading: true, isError: false, message: '', status: false);
      final result = await getNewOrdersService.getNewOrdersService();

      emit(result.fold(
          (l) => state.copyWith(
                isLoading: false,
                isError: true,
                message: l.message!,
                newOrdersModel: [],
                status: false,
              ), (r) {
        return state.copyWith(
          isLoading: false,
          isError: false,
          message: state.message,
          status: state.status,
          newOrdersModel: r,
        );
      }));
      log("fjsdkfjskdlfjklsdf");
      // emit(stateData);
    });
  }
}





// @injectable
// class GetDoctersBloc extends Bloc<GetDoctersEvent, GetDoctersState> {
//   GetDoctersRepo getDoctersRepo;
//   // List<AllDoctor> cachedDoctors = [];
//   GetDoctersBloc(this.getDoctersRepo) : super(GetDoctersState.initial()) {
//     on<_Started>((event, emit) async {
//       if (event.isLoading) {
//         emit(state.copyWith(
//           isloding: true,
//           isError: false,
//           message: "",
//           status: false,
//           model: [],
//         ));
//       }
//       final getDoctorResult = await getDoctersRepo.getDoctersRepo();
//       emit(getDoctorResult.fold(
//           (l) => state.copyWith(
//                 isloding: false,
//                 isError: true,
//                 message: l.message!,
//                 model: [],
//                 status: false,
//               ), (r) {
//         // cachedDoctors = r;
//         return state.copyWith(
//           isloding: false,
//           isError: false,
//           message: state.message,
//           status: state.status,
//           model: r,
//         );
//       }));
//     });

    