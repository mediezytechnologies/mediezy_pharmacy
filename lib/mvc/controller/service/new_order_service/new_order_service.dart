import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mediezy_medical/ddd/infrastructure/core/base_url.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';

class MedicineService {
  static Future<List<MedicineOrder>?> medicineService() async {
    try {
      var response = await DioClient.dio.post(
          "$baseUrl/medicalshop/getUpcomingOrder",
          data: {"medical_shop_id": "1370"});
      NewOrderModel? model = NewOrderModel.fromJson(response.data);
      log(model.toString());
      log("res ${response.data}");
      return model.medicineOrder;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log("6656566565656556565  dist");
      log("${e.response!.data}===========");
      log("${e.message}=fdsfg=fd");
    }
    return null;
  }
}
