import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mediezy_medical/ddd/infrastructure/core/base_url.dart';
import 'package:mediezy_medical/mvc/controller/dio_client.dart';
import 'package:mediezy_medical/mvc/model/new_order_submit/new_order_submit_model.dart';

class NewOrderSubmitService {
  static Future<NewOrderSubmitModel?> newOrderSubmitService({
    required String patientId,
    required String tokenId,
    required String doctorId,
    required String orderStatus,
    required List<int> medicineList,
  }) async {
    try {
      var formData = {
        "medical_shop_id": "1370",
        "patient_id": patientId,
        "token_id": tokenId,
        "doctor_id": doctorId,
        "order_details_status": orderStatus,
        "medicine_list": medicineList,
      };
      for (var element in formData.entries) {
        log(element.toString());
      }
      var response = await DioClient.dio
          .post("$baseUrl/medicalshop/MedicineOrderSubmit", data: formData);
      NewOrderSubmitModel model = NewOrderSubmitModel.fromJson(response.data);
      log(model.toString());
      log("res ${response.data}");

      return model;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log("${e.response!.data}===========");
      log("${e.message}=fdsfg=fd");
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
