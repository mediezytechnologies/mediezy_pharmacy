import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

import '../../../view/services/base_url.dart';

class CompletedService {
  static Future<List<MedicineOrder>?> completedService() async {
    try {
      String? id = GetLocalStorage.getUserIdAndToken('id');
      var response = await DioClient.dio.post(
          "$baseUrl/medicalshop/getMedicineCompleteOrder",
          data: {"medical_shop_id": id});
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
