import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';
import 'package:mediezy_medical/mvc/view/services/base_url.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

class PreviousHistoryService {
  static Future<List<MedicineOrder>?> previousHistoryService(
      {required String date}) async {
    try {
      String? id = GetLocalStorage.getUserIdAndToken('id');
      var formData = {"medical_shop_id": id, "date": date};

      var response = await DioClient.dio
          .post("$baseUrl/medicalshop/getPreviousOrderHistory", data: formData);
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
