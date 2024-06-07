import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mediezy_medical/ddd/infrastructure/core/base_url.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';

class CompletedService {
  static Future<List<MedicineOrder>?> completedService() async {
    try {
      var response = await DioClient.dio.post(
          "$baseUrl/medicalshop/getMedicineCompleteOrder",
          data: {"medical_shop_id": "1370"});
      NewOrderModel? model = NewOrderModel.fromJson(response.data);
      log(model.toString());
      log("response =${response.data}");
      return model.medicineOrder;
    } on DioException catch (e) {
      log(e.toString());
      log(e.response!.data);
      log(e.message!);
    }
    return null;
  }
}
