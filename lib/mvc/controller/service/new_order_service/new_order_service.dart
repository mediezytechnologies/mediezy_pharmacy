import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';
import 'package:mediezy_medical/mvc/model/new_order/upcoming_date_model.dart';

import '../../../view/services/base_url.dart';
import '../../../view/services/get_local_storage.dart';

class MedicineService {
  static Future<List<MedicineOrder>?> medicineService(String date) async {
    try {
      String? id = GetLocalStorage.getUserIdAndToken('id');
      var formData = {"medical_shop_id": id, "date": date};

      var response = await DioClient.dio
          .post("$baseUrl/medicalshop/getUpcomingOrder", data: formData);
      NewOrderModel? model = NewOrderModel.fromJson(response.data);
      log(formData.toString());
      log(model.toString());
      log("res ${response.data}");
      return model.medicineOrder;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log("${e.response!.data}===========");
      log("${e.message}=fdsfg=fd");
    }
    return null;
  }
}

//! upcoming date service

class UpcomingDateService {
  static Future<List<Date>?> upcomingDateService() async {
    try {
      String? id = GetLocalStorage.getUserIdAndToken('id');
      var response = await DioClient.dio.post(
          "$baseUrl/medicalshop/getOrderDate",
          data: {"medical_shop_id": id});
      UpcomingDateModel? model = UpcomingDateModel.fromJson(response.data);
      log(model.toString());
      log(response.data.toString());
      return model.date;
    } on DioException catch (e) {
      log("${e.response!.data}===========");
      log("${e.message}=fdsfg=fd");
    }
    return null;
  }
}
