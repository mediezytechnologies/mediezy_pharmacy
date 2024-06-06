import 'package:dartz/dartz.dart';
import 'package:mediezy_medical/domain/core/error/error_model/error_model.dart';
import 'package:mediezy_medical/domain/get_new_orders/get_new_orders_model/medicine_order.dart';

abstract class GetNewOrdersService {
  Future<Either<ErrorModel, List<MedicineOrder>>> getNewOrdersService();
}
